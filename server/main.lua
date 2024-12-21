local ESX = exports["es_extended"]:getSharedObject()
local PendingBills = {}
local function canCreateSocietyBill(xPlayer)
    local jobConfig = Config.AllowedJobs[xPlayer.job.name]
    if not jobConfig then return false end
    return xPlayer.job.grade >= jobConfig.minGrade
end
-- Callback pour récupérer les factures
ESX.RegisterServerCallback('illama_billing:getBills', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query('SELECT * FROM illama_bills WHERE receiver = ? AND status = ? ORDER BY date DESC', 
        {
            xPlayer.identifier,
            'pending'
        }, 
        function(bills)
            cb(bills or {})
        end
    )
end)

-- Création de facture (demande)
RegisterNetEvent('illama_billing:createBill')
AddEventHandler('illama_billing:createBill', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(data.target)
    
    if not xPlayer or not xTarget then return end

    -- Vérification du type et des droits
    if data.type == 'society' and not canCreateSocietyBill(xPlayer) then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Vous n\'avez pas les droits nécessaires'
        })
        return
    end

    -- Vérification du montant maximum selon le job
    local maxAmount = Config.MaxBillAmount
    if data.type == 'society' then
        local jobConfig = Config.AllowedJobs[xPlayer.job.name]
        if jobConfig and jobConfig.maxAmount then
            maxAmount = jobConfig.maxAmount
        end
    end

    -- Vérification du montant
    local amount = tonumber(data.amount)
    if not amount or amount <= 0 or amount > maxAmount then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Montant invalide'
        })
        return
    end

    -- Créer les données de la facture en attente
    local billData = {
        sender = xPlayer.identifier,
        sender_name = xPlayer.getName(),
        sender_source = source,
        target = data.target,
        amount = amount,
        reason = data.reason,
        type = data.type,
        society = data.type == 'society' and xPlayer.job.name or nil,
        job_label = data.type == 'society' and (Config.AllowedJobs[xPlayer.job.name] and Config.AllowedJobs[xPlayer.job.name].label or xPlayer.job.label) or nil
    }

    -- Stocker temporairement la facture
    PendingBills[data.target] = billData

    -- Demander confirmation au joueur cible
    TriggerClientEvent('illama_billing:requestConfirmation', data.target, billData)
    
    -- Notifier l'envoyeur que la demande a été envoyée
    TriggerClientEvent('ox_lib:notify', source, {
        type = 'info',
        description = 'Demande de facture envoyée, en attente de confirmation'
    })
end)

-- Acceptation de la facture
RegisterNetEvent('illama_billing:acceptBill')
AddEventHandler('illama_billing:acceptBill', function()
    local source = source
    local billData = PendingBills[source]
    
    if not billData then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    MySQL.query('INSERT INTO illama_bills (sender, sender_name, receiver, receiver_name, amount, reason, type, society, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        {
            billData.sender,
            billData.sender_name,
            xPlayer.identifier,
            xPlayer.getName(),
            billData.amount,
            billData.reason,
            billData.type,
            billData.society,
            'pending'
        },
        function(affectedRows)
            if affectedRows then
                -- Notifier l'envoyeur original
                TriggerClientEvent('ox_lib:notify', billData.sender_source, {
                    type = 'success',
                    description = 'Facture acceptée par le destinataire'
                })
            end
        end
    )

    -- Supprimer la facture en attente
    PendingBills[source] = nil
end)

-- Refus de la facture
RegisterNetEvent('illama_billing:refuseBill')
AddEventHandler('illama_billing:refuseBill', function()
    local source = source
    local billData = PendingBills[source]
    
    if not billData then return end

    -- Notifier l'envoyeur original
    TriggerClientEvent('ox_lib:notify', billData.sender_source, {
        type = 'error',
        description = 'Facture refusée par le destinataire'
    })

    -- Supprimer la facture en attente
    PendingBills[source] = nil
end)

-- Paiement de facture
RegisterNetEvent('illama_billing:payBill')
AddEventHandler('illama_billing:payBill', function(billId, paymentType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.query('SELECT * FROM illama_bills WHERE id = ? AND status = ?', 
        {
            billId,
            'pending'
        },
        function(bills)
            if not bills or #bills == 0 then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = 'Cette facture n\'existe pas ou a déjà été payée'
                })
                return
            end

            local bill = bills[1]
            local money = paymentType == 'bank' and xPlayer.getAccount('bank').money or xPlayer.getMoney()

            if money < bill.amount then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = ('Vous n\'avez pas assez d\'argent (manque $%s)'):format(ESX.Math.GroupDigits(bill.amount - money))
                })
                return
            end

            MySQL.query('UPDATE illama_bills SET status = ? WHERE id = ?', 
                {
                    'paid',
                    billId
                },
                function(affectedRows)
                    if affectedRows then
                        if paymentType == 'bank' then
                            xPlayer.removeAccountMoney('bank', bill.amount)
                        else
                            xPlayer.removeMoney(bill.amount)
                        end

                        if bill.type == 'society' then
                            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. bill.society, function(account)
                                if account then
                                    account.addMoney(bill.amount)
                                    
                                    -- Notification pour le payeur
                                    TriggerClientEvent('ox_lib:notify', source, {
                                        type = 'success',
                                        description = ('Vous avez payé $%s à %s'):format(ESX.Math.GroupDigits(bill.amount), bill.society)
                                    })

                                    -- Notifier tous les patrons connectés
                                    local xPlayers = ESX.GetPlayers()
                                    for _, playerId in ipairs(xPlayers) do
                                        local xTarget = ESX.GetPlayerFromId(playerId)
                                        if xTarget and xTarget.job.name == bill.society and xTarget.job.grade_name == 'boss' then
                                            TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                                title = 'Paiement Société',
                                                description = ('Une facture de $%s a été payée'):format(ESX.Math.GroupDigits(bill.amount)),
                                                type = 'success',
                                                duration = 6000
                                            })
                                        end
                                    end
                                end
                            end)
                        else
                            local xTarget = ESX.GetPlayerFromIdentifier(bill.sender)
                            if xTarget then
                                if paymentType == 'bank' then
                                    xTarget.addAccountMoney('bank', bill.amount)
                                else
                                    xTarget.addMoney(bill.amount)
                                end

                                TriggerClientEvent('ox_lib:notify', source, {
                                    type = 'success',
                                    description = ('Vous avez payé $%s à %s'):format(ESX.Math.GroupDigits(bill.amount), bill.sender_name)
                                })

                                TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                    type = 'success',
                                    description = ('Vous avez reçu un paiement de $%s de %s'):format(ESX.Math.GroupDigits(bill.amount), xPlayer.getName())
                                })
                            else
                                MySQL.query('UPDATE users SET accounts = JSON_SET(accounts, "$.bank", CAST(JSON_EXTRACT(accounts, "$.bank") AS UNSIGNED) + ?) WHERE identifier = ?',
                                    {bill.amount, bill.sender}
                                )

                                TriggerClientEvent('ox_lib:notify', source, {
                                    type = 'success',
                                    description = ('Vous avez payé $%s à %s (hors-ligne)'):format(ESX.Math.GroupDigits(bill.amount), bill.sender_name)
                                })
                            end
                        end
                    end
                end
            )
        end
    )
end)
-- Callback pour récupérer l'historique complet
ESX.RegisterServerCallback('illama_billing:getBillHistory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query('SELECT * FROM illama_bills WHERE receiver = ? OR sender = ? ORDER BY date DESC LIMIT 50', 
        {
            xPlayer.identifier,
            xPlayer.identifier
        }, 
        function(bills)
            cb(bills or {})
        end
    )
end)

-- Événement pour supprimer une facture
RegisterNetEvent('illama_billing:deleteBill')
AddEventHandler('illama_billing:deleteBill', function(billId)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.query('SELECT * FROM illama_bills WHERE id = ? AND receiver = ?', 
        {
            billId,
            xPlayer.identifier
        },
        function(bills)
            if bills and #bills > 0 then
                MySQL.query('UPDATE illama_bills SET status = ? WHERE id = ?', 
                    {
                        'deleted',
                        billId
                    },
                    function(affectedRows)
                        if affectedRows then
                            TriggerClientEvent('ox_lib:notify', source, {
                                type = 'success',
                                description = 'Facture supprimée avec succès'
                            })

                            -- Notifier l'envoyeur si c'est une facture société
                            local bill = bills[1]
                            if bill.type == 'society' then
                                local xPlayers = ESX.GetPlayers()
                                for _, playerId in ipairs(xPlayers) do
                                    local xTarget = ESX.GetPlayerFromId(playerId)
                                    if xTarget and xTarget.job.name == bill.society and xTarget.job.grade_name == 'boss' then
                                        TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                            type = 'error',
                                            description = ('Une facture de $%s a été supprimée par le client'):format(ESX.Math.GroupDigits(bill.amount))
                                        })
                                    end
                                end
                            else
                                -- Notifier l'envoyeur personnel si en ligne
                                local xTarget = ESX.GetPlayerFromIdentifier(bill.sender)
                                if xTarget then
                                    TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                        type = 'error',
                                        description = ('Une de vos factures de $%s a été supprimée'):format(ESX.Math.GroupDigits(bill.amount))
                                    })
                                end
                            end
                        end
                    end
                )
            end
        end
    )
end)
-- Nettoyage des factures en attente quand un joueur se déconnecte
AddEventHandler('playerDropped', function()
    local source = source
    if PendingBills[source] then
        local billData = PendingBills[source]
        -- Notifier l'envoyeur que le joueur s'est déconnecté
        TriggerClientEvent('ox_lib:notify', billData.sender_source, {
            type = 'error',
            description = 'Le joueur s\'est déconnecté, facture annulée'
        })
        PendingBills[source] = nil
    end
end)
