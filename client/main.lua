if not lib then return end

local ESX = exports["es_extended"]:getSharedObject()

-- Initialisation des données joueur
ESX.PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

CreateThread(function()
    while not ESX.PlayerData.job do
        ESX.PlayerData = ESX.GetPlayerData()
        Wait(100)
    end
end)

-- Initialisation des données joueur
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- Commandes et touches
RegisterKeyMapping('openbilling', 'Ouvrir le menu de facturation', 'keyboard', Config.OpenKey)

RegisterCommand('openbilling', function()
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
