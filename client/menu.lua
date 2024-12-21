if not lib then return end

local ESX = exports["es_extended"]:getSharedObject()

-- Menu Principal
function OpenBillingMenu()
    local PlayerData = GetPlayerData()
    if not PlayerData or not PlayerData.job then
        lib.notify({
            title = 'Erreur',
            description = 'Impossible de charger vos données',
            type = 'error'
        })
        return
    end

    --print('Ouverture menu avec job:', json.encode(PlayerData.job))
    local mainMenu = {
        id = 'billing_main_menu',
        title = 'Menu Facturation',
        options = {
            {
                title = 'Factures Personnelles',
                description = 'Gérer vos factures personnelles',
                onSelect = function()
                    OpenPersonalBillingMenu()
                end
            },
            {
                title = 'Factures Entreprise',
                description = 'Gérer les factures d\'entreprise',
                onSelect = function()
                    local canCreate = CanCreateSocietyBills()
                    --print('Permission de créer:', canCreate)
                    
                    if canCreate then
                        OpenSocietyBillingMenu()
                    else
                        lib.notify({
                            title = 'Erreur',
                            description = 'Vous n\'avez pas les droits nécessaires',
                            type = 'error'
                        })
                    end
                end
            },
            {
                title = 'Mes Factures',
                description = 'Voir les factures reçues',
                onSelect = function()
                    OpenMyBillsMenu()
                end
            },
            {
                title = 'Historique des Transactions',
                description = 'Voir l\'historique de toutes vos factures',
                onSelect = function()
                    OpenBillHistory()
                end
            }
        }
    }
    lib.registerContext(mainMenu)
    lib.showContext('billing_main_menu')
end

-- Menu Factures Personnelles
function OpenPersonalBillingMenu()
    local players = GetNearbyPlayers()
    
    if #players == 0 then
        lib.notify({
            title = 'Erreur',
            description = 'Aucun joueur à proximité',
            type = 'error'
        })
        return
    end

    local options = {}
    for _, player in ipairs(players) do
        table.insert(options, {
            title = player.name,
            description = ('Distance: %s mètres'):format(math.floor(player.distance)),
            onSelect = function()
                CreatePersonalBill(player.source)
            end
        })
    end

    lib.registerContext({
        id = 'select_player_menu',
        title = 'Sélectionner un joueur',
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('select_player_menu')
end

-- Menu Factures Société
function OpenSocietyBillingMenu()
    local players = GetNearbyPlayers()
    
    if #players == 0 then
        lib.notify({
            title = 'Erreur',
            description = 'Aucun joueur à proximité',
            type = 'error'
        })
        return
    end

    local options = {}
    for _, player in ipairs(players) do
        table.insert(options, {
            title = player.name,
            description = ('Distance: %s mètres'):format(math.floor(player.distance)),
            onSelect = function()
                CreateSocietyBill(player.source)
            end
        })
    end

    lib.registerContext({
        id = 'select_player_menu_society',
        title = 'Sélectionner un joueur',
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('select_player_menu_society')
end

function CreatePersonalBill(target)
    local input = lib.inputDialog('Nouvelle Facture', {
        {
            type = 'number',
            label = 'Montant',
            description = 'Entrez le montant',
            required = true,
            min = 1,
            max = Config.MaxBillAmount,
            default = 1,
        },
        {
            type = 'input',
            label = 'Raison',
            description = 'Entrez la raison',
            required = true
        }
    })

    if input then
        local amount = tonumber(input[1])
        if not amount or amount <= 0 then
            lib.notify({
                title = 'Erreur',
                description = 'Le montant doit être supérieur à 0',
                type = 'error'
            })
            return
        end

        TriggerServerEvent('illama_billing:createBill', {
            target = target,
            amount = amount,
            reason = input[2],
            type = 'personal'
        })
    end
end
function CanCreateSocietyBills()
    local PlayerData = GetPlayerData()
    if not PlayerData or not PlayerData.job then
        --print('PlayerData ou job non trouvé')
        return false
    end

    local playerJob = PlayerData.job
    --print('Vérification job:', json.encode(playerJob))

    local jobConfig = Config.AllowedJobs[playerJob.name]
    if not jobConfig then 
        --print('Job non configuré:', playerJob.name)
        return false 
    end

    --print('Grade:', playerJob.grade, 'Grade minimum:', jobConfig.minGrade)
    return tonumber(playerJob.grade) >= tonumber(jobConfig.minGrade)
end

-- Créer une facture société
function CreateSocietyBill(target)
    local playerJob = ESX.PlayerData.job
    local jobConfig = Config.AllowedJobs[playerJob.name]
    
    if not jobConfig then return end
    local maxAmount = jobConfig.maxAmount or Config.MaxBillAmount

    local input = lib.inputDialog('Nouvelle Facture Société', {
        {
            type = 'number',
            label = 'Montant',
            description = 'Entrez le montant',
            required = true,
            min = 1,
            max = maxAmount,
            default = 1,
        },
        {
            type = 'input',
            label = 'Raison',
            description = 'Entrez la raison',
            required = true
        }
    })

    if input then
        local amount = tonumber(input[1])
        if not amount or amount <= 0 or amount > maxAmount then
            lib.notify({
                title = 'Erreur',
                description = 'Montant invalide',
                type = 'error'
            })
            return
        end

        TriggerServerEvent('illama_billing:createBill', {
            target = target,
            amount = amount,
            reason = input[2],
            type = 'society'
        })
    end
end

-- Menu Mes Factures
function OpenMyBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getBills', function(bills)
        local options = {}
        
        for i, bill in ipairs(bills) do
            table.insert(options, {
                title = ('Facture de %s'):format(bill.sender_name),
                description = ('Montant: $%s - Raison: %s'):format(ESX.Math.GroupDigits(bill.amount), bill.reason),
                metadata = {
                    {label = 'Status', value = bill.status}
                },
                onSelect = function()
                    OpenBillDetailsMenu(bill)
                end
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = 'Aucune facture',
                description = 'Vous n\'avez aucune facture en attente'
            })
        end

        lib.registerContext({
            id = 'my_bills_menu',
            title = 'Mes Factures',
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('my_bills_menu')
    end)
end
function OpenBillHistory()
    ESX.TriggerServerCallback('illama_billing:getBillHistory', function(bills)
        local options = {}
        
        for i, bill in ipairs(bills) do
            local status_color = {
                pending = '🟡',
                paid = '🟢',
                deleted = '🔴'
            }

            -- Détermine si le joueur est l'envoyeur ou le destinataire
            local playerIdentifier = ESX.PlayerData.identifier
            local isReceiver = (bill.receiver == playerIdentifier)

            -- Formatte le titre en fonction de si on est l'envoyeur ou le destinataire
            local title
            if isReceiver then
                title = ('%s Facture de %s à vous'):format(
                    status_color[bill.status] or '⚪',
                    bill.sender_name
                )
            else
                title = ('%s Facture de vous à %s'):format(
                    status_color[bill.status] or '⚪',
                    bill.receiver_name
                )
            end

            table.insert(options, {
                title = title,
                description = ('Montant: $%s - Raison: %s'):format(ESX.Math.GroupDigits(bill.amount), bill.reason),
                metadata = {
                    {label = 'Status', value = bill.status},
                    {label = 'Type', value = bill.type == 'society' and 'Société' or 'Personnel'},
                    {label = 'De', value = bill.sender_name},
                    {label = 'À', value = bill.receiver_name}
                }
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = 'Aucun historique',
                description = 'Vous n\'avez aucune facture dans l\'historique'
            })
        end

        lib.registerContext({
            id = 'bills_history_menu',
            title = 'Historique des Transactions',
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('bills_history_menu')
    end)
end
-- Menu Détails Facture
function OpenBillDetailsMenu(bill)
    local options = {}

    if bill.status == 'pending' then
        table.insert(options, {
            title = 'Payer en espèces',
            description = ('Payer $%s en espèces'):format(ESX.Math.GroupDigits(bill.amount)),
            icon = 'money-bill',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'cash')
            end
        })

        table.insert(options, {
            title = 'Payer par banque',
            description = ('Payer $%s par banque'):format(ESX.Math.GroupDigits(bill.amount)),
            icon = 'credit-card',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'bank')
            end
        })
    end

    table.insert(options, {
        title = 'Supprimer la facture',
        description = 'Supprimer définitivement cette facture',
        icon = 'trash',
        onSelect = function()
            local confirm = lib.alertDialog({
                header = 'Confirmation',
                content = 'Êtes-vous sûr de vouloir supprimer cette facture ?',
                centered = true,
                cancel = true
            })
            if confirm == 'confirm' then
                TriggerServerEvent('illama_billing:deleteBill', bill.id)
                lib.showContext('my_bills_menu') -- Retour au menu précédent
            end
        end
    })

    lib.registerContext({
        id = 'bill_details_menu',
        title = ('Facture #%s'):format(bill.id),
        menu = 'my_bills_menu',
        options = options
    })

    lib.showContext('bill_details_menu')
end

function CreateConfirmBillMenu(data)
    lib.registerContext({
        id = 'confirm_bill_menu',
        title = 'Nouvelle Facture',
        options = {
            {
                title = 'Détails de la facture',
                description = ('Montant: $%s - Raison: %s'):format(ESX.Math.GroupDigits(data.amount), data.reason),
                metadata = {
                    {label = 'De', value = data.sender_name},
                    {label = 'Type', value = data.type == 'society' and 'Société' or 'Personnel'}
                }
            },
            {
                title = 'Accepter la facture',
                description = 'Accepter de recevoir cette facture',
                icon = 'check',
                onSelect = function()
                    TriggerServerEvent('illama_billing:acceptBill', data)
                    lib.notify({
                        title = 'Facture Acceptée',
                        description = 'Vous avez accepté la facture',
                        type = 'success'
                    })
                end
            },
            {
                title = 'Refuser la facture',
                description = 'Refuser de recevoir cette facture',
                icon = 'xmark',
                onSelect = function()
                    TriggerServerEvent('illama_billing:refuseBill', data)
                    lib.notify({
                        title = 'Facture Refusée',
                        description = 'Vous avez refusé la facture',
                        type = 'error'
                    })
                end
            }
        }
    })
    lib.showContext('confirm_bill_menu')
end

-- Événement pour recevoir la demande de facture
RegisterNetEvent('illama_billing:requestConfirmation')
AddEventHandler('illama_billing:requestConfirmation', function(data)
    CreateConfirmBillMenu(data)
end)
