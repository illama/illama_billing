if not lib then return end

local ESX = exports["es_extended"]:getSharedObject()

-- Menu Principal
function OpenBillingMenu()
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
                    -- Vérification de sécurité pour le job
                    if not ESX.PlayerData or not ESX.PlayerData.job then
                        lib.notify({
                            title = 'Erreur',
                            description = 'Impossible de récupérer votre emploi',
                            type = 'error'
                        })
                        return
                    end

                    -- Vérification du grade
                    if ESX.PlayerData.job.grade_name == 'boss' then
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

-- Créer une facture société
function CreateSocietyBill(target)
    local input = lib.inputDialog('Nouvelle Facture Société', {
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
                    {label = 'Status', value = bill.status},
                    {label = 'Date', value = bill.date and bill.date or 'Date inconnue'}
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

-- Menu Détails Facture
function OpenBillDetailsMenu(bill)
    if bill.status ~= 'pending' then
        lib.notify({
            title = 'Information',
            description = 'Cette facture a déjà été traitée',
            type = 'info'
        })
        return
    end

    lib.registerContext({
        id = 'bill_details_menu',
        title = ('Facture #%s'):format(bill.id),
        menu = 'my_bills_menu',
        options = {
            {
                title = 'Payer en espèces',
                description = ('Payer $%s en espèces'):format(ESX.Math.GroupDigits(bill.amount)),
                onSelect = function()
                    TriggerServerEvent('illama_billing:payBill', bill.id, 'cash')
                end
            },
            {
                title = 'Payer par banque',
                description = ('Payer $%s par banque'):format(ESX.Math.GroupDigits(bill.amount)),
                onSelect = function()
                    TriggerServerEvent('illama_billing:payBill', bill.id, 'bank')
                end
            }
        }
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