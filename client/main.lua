-------------------------------
--          INIT
-------------------------------
if not lib then return end
ESX = exports["es_extended"]:getSharedObject()
PlayerData = {}
local isInitialized = false

-------------------------------
--       CORE FUNCTIONS
-------------------------------
local function RefreshPlayerData()
    PlayerData = ESX.GetPlayerData()
    isInitialized = true
end

function GetPlayerData()
    if not isInitialized then
        RefreshPlayerData()
    end
    return PlayerData
end

function GetNearbyPlayers()
    local playerPed = PlayerPedId()
    local players = ESX.Game.GetPlayers()
    local nearbyPlayers = {}
    local coordinates = GetEntityCoords(playerPed)
    local myServerId = GetPlayerServerId(PlayerId())
    for _, player in ipairs(players) do
        local target = GetPlayerPed(player)
        local targetServerId = GetPlayerServerId(player)
        local targetCoords = GetEntityCoords(target)
        local distance = #(coordinates - targetCoords)
        if distance <= 5.0 or targetServerId == myServerId then
            table.insert(nearbyPlayers, {
                source = targetServerId,
                name = GetPlayerName(player),
                distance = distance
            })
        end
    end
    table.sort(nearbyPlayers, function(a, b)
        return a.distance < b.distance
    end)
    
    return nearbyPlayers
end

-------------------------------
--       ESX EVENTS
-------------------------------
CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(100)
    end
    RefreshPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    isInitialized = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    if lib.getOpenMenu() and lib.getOpenMenu():find('billing_') then
        OpenBillingMenu()
    end
end)

-------------------------------
--       BILLING EVENTS
-------------------------------
RegisterNetEvent('illama_billing:requestRecurringConfirmation')
AddEventHandler('illama_billing:requestRecurringConfirmation', function(billData)
    if not billData then return end

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

-------------------------------
--       NUI CALLBACKS
-------------------------------
RegisterNUICallback('closeBill', function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)

-------------------------------
--       COMMANDS
-------------------------------
RegisterKeyMapping('openbilling', _L('open_billing_menu'), 'keyboard', Config.OpenKey)

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

-------------------------------
--     SECURITY CHECK
-------------------------------
local scriptEnabled = false

local function GetManifestVersion()
    local manifest = LoadResourceFile(GetCurrentResourceName(), 'fxmanifest.lua')
    if not manifest then return nil end
    
    for line in manifest:gmatch("[^\r\n]+") do
        local version = line:match("^version%s+['\"](.+)['\"]")
        if version then
            return version:gsub("%s+", "")
        end
    end
    return nil
end

local function StartPeriodicNotification(expectedName, currentName)
    CreateThread(function()
        while true do
            lib.notify({
                title = _L('system_disabled_title'),
                description = _L('system_disabled_desc'),
                type = 'error',
                duration = 10000
            })
            Wait(10000)
        end
    end)
end

local function DisableScript()
    AddEventHandler = function() return end
    RegisterNetEvent = function() return end
    TriggerEvent = function() return end
end

RegisterNetEvent('illama_billing:scriptDisabled')
AddEventHandler('illama_billing:scriptDisabled', function(expectedName, currentName)
    DisableScript()
    StartPeriodicNotification(expectedName, currentName)
    lib.notify({
        title = _L('system_error'),
        description = _L('system_disabled_contact_admin'),
        type = 'error',
        duration = 10000
    })
end)

local function ValidateResourceName()
    local resourceName = GetCurrentResourceName()
    local manifestVersion = GetManifestVersion()
    local expectedName = 'illama_billing_v.' .. manifestVersion
    
    if resourceName ~= expectedName then
        DisableScript()
        StartPeriodicNotification(expectedName, resourceName)
        return false
    end
    
    scriptEnabled = true
    return true
end

-------------------------------
--          INIT
-------------------------------
if not ValidateResourceName() then 
    return
end

local ESX = exports["es_extended"]:getSharedObject()

local function CheckScriptEnabled(fn)
    return function(...)
        if not scriptEnabled then
            lib.notify({
                title = _L('error'),
                description = _L('feature_disabled'),
                type = 'error'
            })
            return
        end
        return fn(...)
    end
end