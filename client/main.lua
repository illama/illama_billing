if not lib then return end
ESX = exports["es_extended"]:getSharedObject()
PlayerData = {}
local isInitialized = false

-- Fonction pour rafraîchir les données
local function RefreshPlayerData()
    PlayerData = ESX.GetPlayerData()
    isInitialized = true
end

-- Initialisation
CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(100)
    end
    RefreshPlayerData()
end)

-- Événement quand le joueur est chargé
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    isInitialized = true
end)

-- Événement quand le job change
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    if lib.getOpenMenu() and lib.getOpenMenu():find('billing_') then
        OpenBillingMenu()
    end
end)

-- Commandes et touches
RegisterKeyMapping('openbilling', _L('open_billing_menu'), 'keyboard', Config.OpenKey) -- Ajouter cette traduction dans les locales

RegisterCommand('openbilling', function()
    RefreshPlayerData()
   
    if not PlayerData or not PlayerData.job then
        lib.notify({
            title = _L('error'),
            description = _L('cannot_load_data'),
            type = 'error'
        })
        return
    end
    OpenBillingMenu()
end)

-- Fonction utilitaire pour obtenir les joueurs proches
function GetNearbyPlayers()
    local playerPed = PlayerPedId()
    local players = ESX.Game.GetPlayers()
    local nearbyPlayers = {}
    local coordinates = GetEntityCoords(playerPed)

    for _, player in ipairs(players) do
        local target = GetPlayerPed(player)
        if target ~= playerPed then
            local targetCoords = GetEntityCoords(target)
            local distance = #(coordinates - targetCoords)
           
            if distance <= 5.0 then
                table.insert(nearbyPlayers, {
                    source = GetPlayerServerId(player),
                    name = GetPlayerName(player),
                    distance = distance
                })
            end
        end
    end

    table.sort(nearbyPlayers, function(a, b)
        return a.distance < b.distance
    end)
    return nearbyPlayers
end
-- Handler pour les demandes de confirmation de factures récurrentes
RegisterNetEvent('illama_billing:requestRecurringConfirmation')
AddEventHandler('illama_billing:requestRecurringConfirmation', function(billData)
    print("^3[DEBUG] Received recurring bill confirmation request^7")
    print("^3[DEBUG] Bill data:^7", json.encode(billData))

    if not billData then 
        print("^1[ERROR] Bill data is nil^7")
        return 
    end

    if lib.getOpenMenu() then lib.hideContext() end

    lib.registerContext({
        id = 'confirm_recurring_bill',
        title = _L('new_recurring_bill'),
        options = {
            {
                title = _L('bill_details'),
                description = _L('amount_reason',
                    ESX.Math.GroupDigits(billData.amount),
                    billData.reason
                ),
                metadata = {
                    {label = _L('society'), value = billData.society_label},
                    {label = _L('interval'), value = _L('days_count', billData.interval_days)},
                    {label = _L('amount_per_payment'), value = '$'..ESX.Math.GroupDigits(billData.amount)},
                    {label = _L('type'), value = _L('recurring_payment')}
                }
            },
            {
                title = _L('accept'),
                description = _L('accept_recurring_desc'),
                icon = 'check',
                onSelect = function()
                    TriggerServerEvent('illama_billing:acceptRecurringBill')
                    lib.notify({
                        title = _L('bill_accepted'),
                        description = _L('recurring_setup_success'),
                        type = 'success'
                    })
                end
            },
            {
                title = _L('refuse'),
                description = _L('refuse_recurring_desc'),
                icon = 'xmark',
                onSelect = function()
                    TriggerServerEvent('illama_billing:refuseRecurringBill')
                    lib.notify({
                        title = _L('bill_refused'),
                        description = _L('recurring_refused_desc'),
                        type = 'error'
                    })
                end
            }
        },
        onClose = function()
            TriggerServerEvent('illama_billing:refuseRecurringBill')
        end
    })
    
    lib.showContext('confirm_recurring_bill')
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)
-- Export les données pour menu.lua
function GetPlayerData()
    if not isInitialized then
        RefreshPlayerData()
    end
    return PlayerData
end