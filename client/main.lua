if not lib then return end

ESX = exports["es_extended"]:getSharedObject()
PlayerData = {}
local isInitialized = false

-- Fonction pour rafraîchir les données
local function RefreshPlayerData()
    PlayerData = ESX.GetPlayerData()
    isInitialized = true
    --print('Données joueur rafraîchies:', json.encode(PlayerData.job))
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
    --print('Joueur chargé avec succès')
end)

-- Événement quand le job change
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    --print('Job mis à jour:', json.encode(job))
    if lib.getOpenMenu() and lib.getOpenMenu():find('billing_') then
        OpenBillingMenu()
    end
end)

-- Commandes et touches
RegisterKeyMapping('openbilling', 'Ouvrir le menu de facturation', 'keyboard', Config.OpenKey)

RegisterCommand('openbilling', function()
    -- Rafraîchir les données avant d'ouvrir le menu
    RefreshPlayerData()
    
    if not PlayerData or not PlayerData.job then
        --print('Erreur: Données job manquantes')
        lib.notify({
            title = 'Erreur',
            description = 'Impossible de charger vos données',
            type = 'error'
        })
        return
    end

    --print('Ouverture menu - Job actuel:', json.encode(PlayerData.job))
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


-- Export les données pour menu.lua
function GetPlayerData()
    if not isInitialized then
        RefreshPlayerData()
    end
    return PlayerData
end
