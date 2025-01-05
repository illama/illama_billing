-------------------------------
--          INIT
-------------------------------
if not lib then return end
local ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
local isInitialized = false

local function RefreshPlayerData()
    PlayerData = ESX.GetPlayerData()
    isInitialized = true
end

local function validateAmount(amount, maxAmount)
    return type(amount) == 'number' 
        and amount > 0 
        and amount <= maxAmount
        and amount == math.floor(amount)
        and amount <= 999999999
end

local function validateReason(reason)
    return type(reason) == 'string' 
        and #reason >= 3 
        and #reason <= 100
        and not reason:match('[<>{}]')
end

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
--       LOCAL FUNCTIONS
-------------------------------
local function getDaysUntilNextPayment(nextBillingDate)
    if not nextBillingDate then return "N/A" end
    
    local nextPayment = nextBillingDate
    if nextPayment > 9999999999 then
        nextPayment = math.floor(nextPayment / 1000)
    end
    
    local now = os.time()
    local difference = nextPayment - now
    local daysRemaining = math.floor(difference / 86400)
    
    if daysRemaining < 0 then
        return _L('today')
    elseif daysRemaining == 0 then
        return _L('today')
    elseif daysRemaining == 1 then
        return _L('tomorrow')
    else
        return _L('days_remaining', daysRemaining)
    end
end

function CanCreateSocietyBills()
    local PlayerData = GetPlayerData()
    if not PlayerData or not PlayerData.job then
        return false
    end

    local playerJob = PlayerData.job

    local jobConfig = Config.AllowedJobs[playerJob.name]
    if not jobConfig then 
        return false 
    end
    return tonumber(playerJob.grade) >= tonumber(jobConfig.minGrade)
end

function OpenSocietyBillPlayerSelect(billType)
    local players = GetNearbyPlayers()
    
    local options = {}
    for _, player in ipairs(players) do
        table.insert(options, {
            title = player.name,
            description = _L('distance', math.floor(player.distance)),
            onSelect = function()
                if billType == 'standard' then
                    CreateSocietyBill(player.source)
                elseif billType == 'recurring' then
                    CreateRecurringBill(player.source)
                end
            end
        })
    end

    lib.registerContext({
        id = 'select_player_society_menu',
        title = _L('select_player'),
        menu = 'society_billing_type_menu',
        options = options
    })

    lib.showContext('select_player_society_menu')
end

-------------------------------
--       MAIN MENUS
-------------------------------
function OpenBillingMenu()
    local PlayerData = GetPlayerData()
    if not PlayerData or not PlayerData.job then
        lib.notify({
            title = _L('error'),
            description = _L('cannot_load_data'),
            type = 'error'
        })
        return
    end

    local mainMenu = {
        id = 'billing_main_menu',
        title = _L('billing_menu'),
        options = {
            {
                title = _L('separator_bills_management'),
                disabled = true
            },
            {
                title = _L('my_bills'),
                description = _L('my_bills_desc'),
                icon = 'receipt',
                onSelect = function()
                    OpenMyBillsMenu()
                end
            },
            {
                title = _L('installment_payments'),
                description = _L('view_payment_plans'),
                icon = 'calendar-days',
                onSelect = function()
                    OpenInstallmentPaymentsMenu()
                end
            },
            {
                title = _L('recurring_bills'),
                description = _L('recurring_bills_desc'),
                icon = 'rotate',
                onSelect = function()
                    OpenRecurringBillsMenu()
                end
            },
            {
                title = _L('separator_bills_creator'),
                disabled = true
            },
            {
                title = _L('personal_bills'),
                description = _L('personal_bills_desc'),
                icon = 'file-invoice',
                onSelect = function()
                    OpenPersonalBillingMenu()
                end
            },
            {
                title = _L('society_bills'),
                description = _L('society_bills_desc'),
                icon = 'building',
                onSelect = function()
                    local canCreate = CanCreateSocietyBills()
                    if canCreate then
                        OpenSocietyBillingMenu()
                    else
                        lib.notify({
                            title = _L('error'),
                            description = _L('insufficient_rights'),
                            type = 'error'
                        })
                    end
                end
            },
            {
                title = _L('separator_history'),
                disabled = true
            },
            {
                title = _L('transaction_history'),
                description = _L('transaction_history_desc'),
                icon = 'clock-rotate-left',
                onSelect = function()
                    OpenBillHistory()
                end
            }
        }
    }
    lib.registerContext(mainMenu)
    lib.showContext('billing_main_menu')
end

function OpenPersonalBillingMenu()
    local players = GetNearbyPlayers()
    
    if #players == 0 then
        lib.notify({
            title = _L('error'),
            description = _L('no_nearby_players'),
            type = 'error'
        })
        return
    end

    local options = {
        {
            title = _L('individual_bill'),
            description = _L('individual_bill_desc'),
            onSelect = function()
                OpenIndividualBillingMenu()
            end
        },
        {
            title = _L('group_bill'),
            description = _L('group_bill_desc'),
            onSelect = function()
                OpenGroupBillingMenu('personal')
            end
        }
    }

    lib.registerContext({
        id = 'billing_type_menu',
        title = _L('select_billing_type'),
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('billing_type_menu')
end

function OpenSocietyBillingMenu()
    local players = GetNearbyPlayers()
    
    if #players == 0 then
        lib.notify({
            title = _L('error'),
            description = _L('no_nearby_players'),
            type = 'error'
        })
        return
    end

    local PlayerData = GetPlayerData()
    local jobConfig = Config.AllowedJobs[PlayerData.job.name]

    local options = {
        {
            title = _L('standard_bill'),
            description = _L('standard_bill_desc'),
            onSelect = function()
                OpenSocietyBillPlayerSelect('standard')
            end
        }
    }
    if jobConfig and jobConfig.allowGroup then
        table.insert(options, {
            title = _L('group_bill'),
            description = _L('group_bill_desc'),
            onSelect = function()
                OpenGroupBillingMenu('society')
            end
        })
    end

    if jobConfig and jobConfig.allowRecurring then
        table.insert(options, {
            title = _L('recurring_bill'),
            description = _L('recurring_bill_desc'),
            onSelect = function()
                OpenSocietyBillPlayerSelect('recurring')
            end
        })
    end
    if jobConfig and jobConfig.allowCheck then
        table.insert(options, {
            title = _L('check_bills'),
            description = _L('check_bills_desc'),
            icon = 'list',
            onSelect = function()
                OpenCheckBillsPlayerSelect()
            end
        })
    end

    if jobConfig and jobConfig.allowStats then
        table.insert(options, {
            title = _L('society_stats'),
            description = _L('society_stats_desc'),
            icon = 'chart-line',
            onSelect = function()
                OpenSocietyStats()
            end
        })
    end

    lib.registerContext({
        id = 'society_billing_type_menu',
        title = _L('bill_type'),
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('society_billing_type_menu')
end

function OpenMyBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            table.insert(options, {
                title = _L('bill_from', bill.sender_name),
                description = _L('amount_reason', ESX.Math.GroupDigits(bill.amount), bill.reason),
                metadata = {
                    {label = _L('status_label'), value = bill.status == 'pending' and _L('pending') or (bill.status == 'paid' and _L('paid') or _L('deleted'))},
                    {label = _L('signature'), value = bill.signature or _L('not_signed')}
                },
                onSelect = function()
                    OpenBillDetailsMenu(bill)
                end
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_bills'),
                description = _L('no_bills_desc'),
                disabled = true
            })
        end

        lib.registerContext({
            id = 'my_bills_menu',
            title = _L('my_bills'),
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('my_bills_menu')
    end)
end

function OpenRecurringBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getRecurringBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            local nextPaymentText = _L('undefined_payment')
            if bill.days_remaining then
                local days = tonumber(bill.days_remaining)
                if days <= 0 then
                    nextPaymentText = _L('today_payment')
                elseif days == 1 then
                    nextPaymentText = _L('tomorrow_payment')
                else
                    nextPaymentText = string.format(_L('in_days_payment'), days)
                end
            end

            table.insert(options, {
                title = bill.society_label,
                description = string.format(_L('amount_and_reason'), 
                    ESX.Math.GroupDigits(bill.amount),
                    bill.reason
                ),
                metadata = {
                    {label = _L('next_payment_label'), value = nextPaymentText},
                    {label = _L('interval_label'), value = string.format(_L('interval_days_format'), bill.interval_days)},
                    {label = _L('status_label'), value = bill.status == 'active' and _L('status_active') or _L('status_inactive')}
                },
                onSelect = function()
                    OpenRecurringBillActions(bill)
                end
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_recurring_bills'),
                description = _L('no_recurring_bills_desc'),
                disabled = true
            })
        end

        lib.registerContext({
            id = 'recurring_bills_menu',
            title = _L('my_recurring_bills'),
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('recurring_bills_menu')
    end)
end

function OpenBillHistory()
    ESX.TriggerServerCallback('illama_billing:getBillHistory', function(bills)
        local options = {
            {
                title = _L('info'),
                description = _L('click_to_export'),
                disabled = true
            },
            {
                title = _L('filter_by_tags'),
                description = _L('filter_tags_desc'),
                icon = 'tags',
                onSelect = function()
                    OpenTagFilterMenu(bills)
                end
            }
        }
        
        for _, bill in ipairs(bills) do
            local status_color = {
                pending = '🟡',
                paid = '🟢',
                deleted = '🔴'
            }

            local playerIdentifier = ESX.PlayerData.identifier
            local isReceiver = (bill.receiver == playerIdentifier)
            local tagIcons = ''
            if bill.tags and #bill.tags > 0 then
                for _, tag in ipairs(bill.tags) do
                    tagIcons = tagIcons .. '🏷️ ' .. tag .. ' '
                end
            end

            local title = _L('bill_history_title',
                status_color[bill.status] or '⚪',
                isReceiver and _L('from') or _L('to'),
                isReceiver and bill.sender_name or bill.receiver_name
            )

            table.insert(options, {
                title = title,
                description = _L('amount_reason',
                    ESX.Math.GroupDigits(bill.amount),
                    bill.reason
                ) .. (tagIcons ~= '' and '\n' .. tagIcons or ''),
                metadata = {
                    {label = _L('status'), value = bill.status == 'pending' and _L('pending') or (bill.status == 'paid' and _L('paid') or _L('deleted'))},
                    {label = _L('type'), value = bill.type == 'society' and _L('society') or _L('personal')},
                    {label = _L('from'), value = bill.sender_name},
                    {label = _L('to'), value = bill.receiver_name}
                },
                onSelect = function()
                    OpenBillActions(bill)
                end
            })
        end

        lib.registerContext({
            id = 'bills_history_menu',
            title = _L('transaction_history'),
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('bills_history_menu')
    end)
end

-------------------------------
--       CREATE BILLS MENUS
-------------------------------
function CreatePersonalBill(target)
    local input = lib.inputDialog(_L('new_bill'), {
        {
            type = 'number',
            label = _L('amount_label'),
            description = _L('amount_desc'),
            required = true,
            min = 1,
            max = Config.MaxBillAmount
        },
        {
            type = 'input',
            label = _L('reason_label'),
            description = _L('reason_desc'),
            required = true
        },
        {
            type = 'checkbox',
            label = _L('require_signature'),
            description = _L('require_signature_desc')
        },
        {
            type = 'checkbox',
            label = _L('allow_installments'),
            description = _L('allow_installments_desc')
        }
    })

    if input then
        local amount = tonumber(input[1])
        if not amount or amount <= 0 then
            lib.notify({
                title = _L('error'),
                description = _L('invalid_amount'),
                type = 'error'
            })
            return
        end

        TriggerServerEvent('illama_billing:createBill', {
            target = target,
            amount = amount,
            reason = input[2],
            type = 'personal',
            requireSignature = input[3],
            allow_installments = input[4]
        })
    end
end

function CreateSocietyBill(target)
    local PlayerData = GetPlayerData()
    local jobConfig = Config.AllowedJobs[PlayerData.job.name]
    
    if not jobConfig then return end

    local options = {}
    for i, template in ipairs(jobConfig.templates) do
        table.insert(options, {
            label = template.label,
            value = i
        })
    end

    local input = lib.inputDialog(_L('new_society_bill'), {
        {
            type = 'select',
            label = _L('bill_type'),
            description = _L('select_template'),
            options = options,
            required = true
        },
        {
            type = 'checkbox',
            label = _L('require_signature'),
            description = _L('require_signature_desc')
        },
        {
            type = 'checkbox',
            label = _L('allow_installments'),
            description = _L('allow_installments_desc')
        }
    })

    if not input then return end
    local selectedTemplate = jobConfig.templates[input[1]]
    local requireSignature = input[2]
    local allowInstallments = input[3]
    local maxAmount = jobConfig.maxAmount or Config.MaxBillAmount

    if selectedTemplate.amount == 0 then
        local customInput = lib.inputDialog(_L('custom_bill'), {
            {
                type = 'number',
                label = _L('amount_label'),
                description = _L('amount_desc'),
                required = true,
                min = 1,
                max = maxAmount,
                default = 0
            },
            {
                type = 'input',
                label = _L('reason_label'),
                description = _L('reason_desc'),
                required = true
            }
        })

        if customInput then
            TriggerServerEvent('illama_billing:createBill', {
                target = target,
                amount = customInput[1],
                reason = customInput[2],
                type = 'society',
                requireSignature = requireSignature,
                allow_installments = allowInstallments
            })
        end
    else
        local confirm = lib.alertDialog({
            header = selectedTemplate.label,
            content = _L('confirm_society_bill',
                ESX.Math.GroupDigits(selectedTemplate.amount),
                selectedTemplate.reason
            ),
            centered = true,
            cancel = true
        })

        if confirm == 'confirm' then
            TriggerServerEvent('illama_billing:createBill', {
                target = target,
                amount = selectedTemplate.amount,
                reason = selectedTemplate.reason,
                type = 'society',
                requireSignature = requireSignature,
                allow_installments = allowInstallments
            })
        end
    end
end

function CreateRecurringBill(target)
    local PlayerData = GetPlayerData()
    local jobConfig = Config.AllowedJobs[PlayerData.job.name]
    
    if not jobConfig or not jobConfig.allowRecurring then 
        return 
    end

    local options = {}
    for i, template in ipairs(jobConfig.recurringTemplates or {}) do
        table.insert(options, {
            label = template.label,
            value = i
        })
    end

    local input = lib.inputDialog(_L('new_recurring_bill'), {
        {
            type = 'select',
            label = _L('subscription_type'),
            description = _L('select_subscription_template'),
            options = options,
            required = true
        }
    })

    if not input then return end
    
    local selectedTemplate = jobConfig.recurringTemplates[input[1]]
    local maxAmount = jobConfig.recurringMaxAmount or Config.MaxBillAmount

    if selectedTemplate.amount == 0 then
        local customInput = lib.inputDialog(_L('custom_subscription'), {
            {
                type = 'number',
                label = _L('payment_amount_custom_subscription'),
                description = _L('payment_amount_desc'),
                required = true,
                min = 1,
                max = maxAmount
            },
            {
                type = 'number',
                label = _L('interval_days'),
                description = _L('interval_days_desc'),
                required = true,
                min = 1,
                max = 365
            },
            {
                type = 'input',
                label = _L('reason_label'),
                description = _L('recurring_reason_desc'),
                required = true
            }
        })

        if customInput then
            local billData = {
                target = target,
                amount = customInput[1],
                interval_days = customInput[2],
                reason = customInput[3],
                society = PlayerData.job.name,
                society_label = jobConfig.label
            }
            TriggerServerEvent('illama_billing:createRecurringBill', billData)
        end
    else
        local confirm = lib.alertDialog({
            header = selectedTemplate.label,
            content = _L('confirm_recurring_bill',
                ESX.Math.GroupDigits(selectedTemplate.amount),
                selectedTemplate.interval,
                selectedTemplate.reason
            ),
            centered = true,
            cancel = true
        })

        if confirm == 'confirm' then
            local billData = {
                target = target,
                amount = selectedTemplate.amount,
                interval_days = selectedTemplate.interval,
                reason = selectedTemplate.reason,
                society = PlayerData.job.name,
                society_label = jobConfig.label
            }
            TriggerServerEvent('illama_billing:createRecurringBill', billData)
        end
    end
end

function OpenIndividualBillingMenu()
    local players = GetNearbyPlayers()
    
    local options = {}
    for _, player in ipairs(players) do
        table.insert(options, {
            title = player.name,
            description = _L('distance', math.floor(player.distance)),
            onSelect = function()
                CreatePersonalBill(player.source)
            end
        })
    end

    lib.registerContext({
        id = 'select_player_menu',
        title = _L('select_player'),
        menu = 'billing_type_menu',
        options = options
    })

    lib.showContext('select_player_menu')
end

function OpenGroupBillingMenu(billType)
    local players = GetNearbyPlayers()
    
    if #players < 2 then
        lib.notify({
            title = _L('error'),
            description = _L('need_multiple_players'),
            type = 'error'
        })
        return
    end

    local playerOptions = {}
    local playerNames = {}
    for _, player in ipairs(players) do
        table.insert(playerOptions, {
            value = player.source,
            label = player.name
        })
        playerNames[tostring(player.source)] = player.name
    end

    local input = lib.inputDialog(_L('group_billing'), {
        {
            type = 'multi-select',
            name = 'players',
            label = _L('select_players'),
            options = playerOptions,
            required = true
        },
        {
            type = 'select',
            name = 'split_type',
            label = _L('split_type'),
            options = {
                { value = 'equal', label = _L('split_equal') },
                { value = 'percentage', label = _L('split_percentage') },
                { value = 'amount', label = _L('split_amount') }
            },
            required = true,
            default = 'equal'
        },
        {
            type = 'number',
            name = 'total_amount',
            label = _L('total_amount'),
            required = true,
            min = 1,
            max = Config.MaxBillAmount
        },
        {
            type = 'input',
            name = 'reason',
            label = _L('reason_label'),
            required = true
        },
        {
            type = 'checkbox',
            name = 'require_signature',
            label = _L('require_signature'),
            description = _L('require_signature_desc')
        }
    })

    if not input then return end
    
    local selectedPlayers = input[1]
    local splitType = input[2]
    local totalAmount = input[3]
    local reason = input[4]
    local requireSignature = input[5]
    local allowInstallments = input[6]

    if not selectedPlayers or #selectedPlayers < 2 then
        lib.notify({
            title = _L('error'),
            description = _L('select_min_players'),
            type = 'error'
        })
        return
    end

    if not validateAmount(totalAmount, Config.MaxBillAmount) then
        lib.notify({
            title = _L('error'),
            description = _L('invalid_amount'),
            type = 'error'
        })
        return
    end

    if not validateReason(reason) then
        lib.notify({
            title = _L('error'),
            description = _L('invalid_reason'),
            type = 'error'
        })
        return
    end

    if splitType == 'percentage' or splitType == 'amount' then
        local splitOptions = {}
        local remainingPercentage = 100
        local remainingAmount = totalAmount
        local lastIndex = #selectedPlayers

        for i, source in ipairs(selectedPlayers) do
            local isLast = (i == lastIndex)
            local max = splitType == 'percentage' and remainingPercentage or remainingAmount
            local playerName = playerNames[tostring(source)] or _L('unknown_player')
            local labelText = playerName

            if splitType == 'percentage' then
                labelText = string.format(_L('remaining_percentage'), playerName, remainingPercentage)
            else
                labelText = string.format(_L('remaining_amount'), playerName, ESX.Math.GroupDigits(remainingAmount))
            end

            table.insert(splitOptions, {
                type = 'number',
                name = tostring(source),
                label = labelText,
                required = true,
                min = 1,
                max = max,
                step = splitType == 'percentage' and 1 or 100
            })
        end

        local dialogTitle = splitType == 'percentage' 
            and _L('enter_percentage_per_player')
            or _L('enter_amount_per_player')

        local splitInput = lib.inputDialog(dialogTitle, splitOptions)
        
        if not splitInput then return end

        local sum = 0
        for _, value in pairs(splitInput) do
            sum = sum + value
            if splitType == 'percentage' then
                remainingPercentage = remainingPercentage - value
            else
                remainingAmount = remainingAmount - value
            end
        end

        if (splitType == 'percentage' and sum ~= 100) or 
           (splitType == 'amount' and sum ~= totalAmount) then
            lib.notify({
                title = _L('error'),
                description = splitType == 'percentage' and _L('percentage_not_100') or _L('amounts_not_total'),
                type = 'error'
            })
            return
        end

        for i, source in ipairs(selectedPlayers) do
            local amount = splitType == 'percentage' 
                and math.floor(totalAmount * splitInput[i] / 100)
                or splitInput[i]

            if amount <= 0 or math.floor(amount) ~= amount then
                return false
            end

            if amount > 0 then
                TriggerServerEvent('illama_billing:createBill', {
                    target = tonumber(source),
                    amount = amount,
                    reason = reason .. ' (' .. (splitType == 'percentage' and _L('percentage_split') or _L('custom_split')) .. ')',
                    type = billType,
                    requireSignature = requireSignature,
                    allow_installments = false
                })
            end
        end
    else
        local amountPerPerson = math.floor(totalAmount / #selectedPlayers)
        
        if amountPerPerson > 0 then
            for _, source in ipairs(selectedPlayers) do
                TriggerServerEvent('illama_billing:createBill', {
                    target = source,
                    amount = amountPerPerson,
                    reason = reason .. ' (' .. _L('equal_split') .. ')',
                    type = billType,
                    requireSignature = requireSignature,
                    allow_installments = false
                })
            end
        end
    end

    lib.notify({
        title = _L('success'),
        description = _L('bills_created'),
        type = 'success'
    })
end

-------------------------------
--       BILLS MANAGEMENT
-------------------------------
function OpenBillDetailsMenu(bill)
    local options = {}

    if bill.status == 'pending' then
        table.insert(options, {
            title = _L('pay_cash'),
            description = _L('pay_amount_cash', ESX.Math.GroupDigits(bill.amount)),
            icon = 'money-bill',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'cash')
                Wait(100)
                OpenMyBillsMenu() 
            end
        })

        table.insert(options, {
            title = _L('pay_bank'),
            description = _L('pay_amount_bank', ESX.Math.GroupDigits(bill.amount)),
            icon = 'credit-card',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'bank')
                Wait(100)
                OpenMyBillsMenu()
            end
        })

        table.insert(options, {
            title = _L('delete_bill'),
            description = _L('delete_bill_desc'),
            icon = 'trash',
            onSelect = function()
                local confirm = lib.alertDialog({
                    header = _L('confirmation'),
                    content = _L('confirm_delete_bill'),
                    centered = true,
                    cancel = true
                })
                if confirm == 'confirm' then
                    TriggerServerEvent('illama_billing:deleteBill', bill.id)
                    Wait(100)
                    OpenBillingMenu()
                end
            end
        })
    end

    lib.registerContext({
        id = 'bill_details_menu',
        title = _L('bill_number', bill.id),
        menu = 'my_bills_menu',
        options = options
    })

    lib.showContext('bill_details_menu')
end

function OpenBillActions(bill)
    local tagsList = ''
    if bill.tags and #bill.tags > 0 then
        for _, tag in ipairs(bill.tags) do
            tagsList = tagsList .. '🏷️ ' .. tag .. ' '
        end
    else
        tagsList = _L('no_tags')
    end

    local options = {
        {
            title = _L('export_bill'),
            description = _L('export_bill_desc'),
            icon = 'file-export',
            onSelect = function()
                ExportBillAsImage(bill)
            end
        },
        {
            title = _L('manage_tags'),
            description = tagsList,
            icon = 'tags',
            onSelect = function()
                OpenTagsManagementMenu(bill)
            end
        }
    }

    lib.registerContext({
        id = 'bill_actions_menu',
        title = _L('bill_actions'),
        menu = 'bills_history_menu',
        options = options
    })

    lib.showContext('bill_actions_menu')
end

function OpenSignaturePrompt(cb)
    local input = lib.inputDialog(_L('signature_required'), {
        {
            type = 'input',
            label = _L('enter_signature'),
            description = _L('signature_desc'),
            required = true,
            min = 3,
            max = 50,
            placeholder = _L('signature_placeholder')
        }
    })
    if input then
        if input[1] and #input[1] >= 3 and #input[1] <= 50 then
            cb(input[1])
        else
            lib.notify({
                title = _L('error'),
                description = _L('invalid_signature'),
                type = 'error'
            })
            OpenSignaturePrompt(cb)
        end
    else
        cb(false)
    end
end

function ExportBillAsImage(bill)
    local translations = {
        bill_receipt = _L('bill_receipt'),
        from = _L('from'),
        to = _L('to'),
        amount = _L('amount_label'),
        reason = _L('reason_label'),
        status = _L('status'),
        type = _L('type'),
        close = _L('close'),
        pending = _L('pending'),
        paid = _L('paid'),
        deleted = _L('deleted'),
        society = _L('society'),
        personal = _L('personal'),
        signature = _L('signature'),
        signed_by = _L('signed_by'),
        not_signed = _L('not_signed')
    }

    local billData = {
        id = bill.id,
        sender = bill.sender_name,
        receiver = bill.receiver_name,
        amount = ESX.Math.GroupDigits(bill.amount),
        reason = bill.reason,
        status = bill.status,
        type = bill.type,
        signature = bill.signature or nil
    }

    SendNUIMessage({
        type = 'showBillHTML',
        billData = billData,
        translations = translations
    })
    SetNuiFocus(true, true)
end

function OpenRecurringBillActions(bill)
    local options = {}

    if bill.status == 'active' then
        table.insert(options, {
            title = _L('pay_in_advance'),
            description = _L('pay_in_advance_desc'),
            icon = 'money-bill',
            onSelect = function()
                OpenAdvancePaymentMenu(bill)
            end
        })

        table.insert(options, {
            title = _L('cancel_subscription'),
            description = _L('cancel_subscription_desc'),
            icon = 'ban',
            onSelect = function()
                local confirm = lib.alertDialog({
                    header = _L('confirmation'),
                    content = _L('confirm_cancel_subscription'),
                    centered = true,
                    cancel = true
                })
                if confirm == 'confirm' then
                    TriggerServerEvent('illama_billing:cancelRecurringBill', bill.id)
                    Wait(100)
                    OpenBillingMenu()
                end
            end
        })
    end

    table.insert(options, {
        title = _L('payment_history'),
        description = _L('payment_history_desc'),
        icon = 'history',
        onSelect = function()
            OpenRecurringPaymentHistory(bill.id)
        end
    })

    lib.registerContext({
        id = 'recurring_bill_actions',
        title = string.format(_L('recurring_bill_number'), bill.id),
        menu = 'recurring_bills_menu',
        options = options
    })

    lib.showContext('recurring_bill_actions')
end

-------------------------------
--       STATS MANAGEMENT
-------------------------------
function OpenSocietyStats()
    local PlayerData = GetPlayerData()
    
    ESX.TriggerServerCallback('illama_billing:getSocietyStats', function(stats)
        if not stats then
            lib.notify({
                title = _L('error'),
                description = _L('cannot_load_stats'),
                type = 'error'
            })
            return
        end

        SendNUIMessage({
            type = 'showSocietyStats',
            stats = stats,
            society = {
                name = PlayerData.job.name,
                label = PlayerData.job.label or PlayerData.job.name
            },
            translations = {
                title = _L('society_statistics'),
                balance = _L('society_balance'),
                topPayer = _L('top_payer'),
                topBiller = _L('top_biller'),
                popularTemplates = _L('popular_templates'),
                close = _L('close'),
                amount = _L('amount'),
                count = _L('count'),
                template = _L('template'),
                usage = _L('usage')
            }
        })

        SetNuiFocus(true, true)
    end)
end

-------------------------------
--       TAGS MANAGEMENT
-------------------------------
function OpenTagsManagementMenu(bill)
    local options = {
        {
            title = _L('add_new_tag'),
            description = _L('add_tag_desc'),
            icon = 'plus',
            onSelect = function()
                OpenAddTagMenu(bill)
            end
        }
    }
    if bill.tags and #bill.tags > 0 then
        for _, tag in ipairs(bill.tags) do
            table.insert(options, {
                title = tag,
                description = _L('remove_tag_desc'),
                icon = 'xmark',
                onSelect = function()
                    TriggerServerEvent('illama_billing:removeTagFromBill', bill.id, tag)
                    lib.notify({
                        description = _L('tag_removed'),
                        type = 'success'
                    })
                    Wait(100)
                    OpenBillHistory()
                end
            })
        end
    else
        table.insert(options, {
            title = _L('no_tags'),
            description = _L('no_tags_desc'),
            disabled = true
        })
    end

    lib.registerContext({
        id = 'tags_management_menu',
        title = _L('manage_tags'),
        menu = 'bill_actions_menu',
        options = options
    })

    lib.showContext('tags_management_menu')
end

function OpenAddTagMenu(bill)
    local input = lib.inputDialog(_L('add_tag'), {
        {
            type = 'input',
            label = _L('tag_name'),
            description = _L('tag_name_desc'),
            placeholder = _L('tag_placeholder'),
            required = true
        }
    })

    if input and input[1] and input[1]:len() > 0 then
        TriggerServerEvent('illama_billing:addTagToBill', bill.id, input[1])
        lib.notify({
            description = _L('tag_added'),
            type = 'success'
        })
        Wait(100)
        OpenBillHistory()
    end
end

function OpenManageTagsMenu(bill)
    local input = lib.inputDialog(_L('manage_tags'), {
        {
            type = 'input',
            label = _L('add_tag'),
            description = _L('add_tag_desc'),
            placeholder = _L('tag_placeholder')
        }
    })

    if input and input[1] and input[1]:len() > 0 then
        TriggerServerEvent('illama_billing:addTagToBill', bill.id, input[1])
        lib.notify({
            description = _L('tag_added'),
            type = 'success'
        })
        Wait(100)
        OpenBillHistory()
    end
end

function OpenTagFilterMenu(bills)
    local uniqueTags = {}
    for _, bill in ipairs(bills) do
        if bill.tags then
            for _, tag in ipairs(bill.tags) do
                uniqueTags[tag] = true
            end
        end
    end

    local options = {
        {
            title = _L('show_all'),
            description = _L('show_all_desc'),
            onSelect = function()
                OpenBillHistory()
            end
        }
    }

    for tag, _ in pairs(uniqueTags) do
        table.insert(options, {
            title = tag,
            description = _L('filter_by_tag_desc'),
            onSelect = function()
                OpenFilteredBillHistory(bills, tag)
            end
        })
    end

    lib.registerContext({
        id = 'tag_filter_menu',
        title = _L('filter_by_tags'),
        menu = 'bills_history_menu',
        options = options
    })

    lib.showContext('tag_filter_menu')
end

function OpenFilteredBillHistory(bills, filterTag)
    local filteredBills = {}
    for _, bill in ipairs(bills) do
        if bill.tags then
            for _, tag in ipairs(bill.tags) do
                if tag == filterTag then
                    table.insert(filteredBills, bill)
                    break
                end
            end
        end
    end

    local options = {
        {
            title = _L('current_filter'),
            description = _L('filtered_by_tag', filterTag),
            disabled = true
        },
        {
            title = _L('change_filter'),
            description = _L('change_filter_desc'),
            icon = 'filter',
            onSelect = function()
                OpenTagFilterMenu(bills)
            end
        }
    }
    for _, bill in ipairs(filteredBills) do
        local status_color = {
            pending = '🟡',
            paid = '🟢',
            deleted = '🔴'
        }

        local playerIdentifier = ESX.PlayerData.identifier
        local isReceiver = (bill.receiver == playerIdentifier)
        local tagIcons = ''
        if bill.tags and #bill.tags > 0 then
            for _, tag in ipairs(bill.tags) do
                tagIcons = tagIcons .. '🏷️ ' .. tag .. ' '
            end
        end

        local title = _L('bill_history_title',
            status_color[bill.status] or '⚪',
            isReceiver and _L('from') or _L('to'),
            isReceiver and bill.sender_name or bill.receiver_name
        )

        table.insert(options, {
            title = title,
            description = _L('amount_reason',
                ESX.Math.GroupDigits(bill.amount),
                bill.reason
            ) .. (tagIcons ~= '' and '\n' .. tagIcons or ''),
            metadata = {
                {label = _L('status'), value = bill.status == 'pending' and _L('pending') or (bill.status == 'paid' and _L('paid') or _L('deleted'))},
                {label = _L('type'), value = bill.type == 'society' and _L('society') or _L('personal')},
                {label = _L('from'), value = bill.sender_name},
                {label = _L('to'), value = bill.receiver_name}
            },
            onSelect = function()
                OpenBillActions(bill)
            end
        })
    end

    if #filteredBills == 0 then
        table.insert(options, {
            title = _L('no_bills_found'),
            description = _L('no_bills_with_tag', filterTag),
            disabled = true
        })
    end

    lib.registerContext({
        id = 'filtered_bills_history_menu',
        title = _L('filtered_transaction_history'),
        menu = 'bills_history_menu',
        options = options
    })

    lib.showContext('filtered_bills_history_menu')
end

-------------------------------
--       PAYMENT MENUS
-------------------------------
function OpenInstallmentMenu(billData)
    local input = lib.inputDialog(_L('installment_setup'), {
        {
            type = 'number',
            label = _L('number_of_payments'),
            description = _L('max_5_payments'),
            required = true,
            min = 2,
            max = 5,
            default = 2
        }
    })

    if input then
        local numberOfPayments = input[1]
        local amountPerPayment = math.ceil(billData.amount / numberOfPayments)
        
        local confirm = lib.alertDialog({
            header = _L('confirm_installment_plan'),
            content = _L('installment_details', 
                numberOfPayments,
                ESX.Math.GroupDigits(amountPerPayment),
                ESX.Math.GroupDigits(amountPerPayment * numberOfPayments)
            ),
            centered = true,
            cancel = true
        })

        if confirm == 'confirm' then
            TriggerServerEvent('illama_billing:setupInstallmentPlan', billData, numberOfPayments)
            lib.hideContext()
        end
    end
end

function OpenInstallmentPaymentsMenu()
    ESX.TriggerServerCallback('illama_billing:getInstallmentPayments', function(payments)
        local options = {}
        
        for _, payment in ipairs(payments) do
            table.insert(options, {
                title = _L('payment_plan', payment.bill_reason or ''),
                description = _L('installment_status',
                    payment.remaining_payments,
                    payment.total_payments,
                    ESX.Math.GroupDigits(payment.amount_per_payment)
                ),
                metadata = {
                    {
                        label = _L('total_remaining'), 
                        value = ESX.Math.GroupDigits(payment.amount_per_payment * payment.remaining_payments)
                    }
                }
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_installment_payments'),
                description = _L('no_active_payment_plans'),
                disabled = true
            })
        end

        lib.registerContext({
            id = 'installment_payments_menu',
            title = _L('my_payment_plans'),
            menu = 'billing_main_menu',
            options = options
        })

        lib.showContext('installment_payments_menu')
    end)
end

function OpenAdvancePaymentMenu(bill)
    local input = lib.inputDialog(_L('advance_payment'), {
        {
            type = 'select',
            label = _L('payment_method'),
            options = {
                { value = 'cash', label = _L('cash') },
                { value = 'bank', label = _L('bank') }
            },
            default = 'bank'
        },
        {
            type = 'number',
            label = _L('payments_count'),
            required = true,
            min = 1,
            max = 12,
            default = 1
        }
    })

    if input then
        local total = bill.amount * input[2]
        local confirm = lib.alertDialog({
            header = _L('payment_confirmation'),
            content = string.format(_L('confirm_advance_payment'), 
                ESX.Math.GroupDigits(total), 
                input[2], 
                _L(input[1])
            ),
            centered = true,
            cancel = true
        })

        if confirm == 'confirm' then
            TriggerServerEvent('illama_billing:payRecurringBill', bill.id, input[2], input[1])
            Wait(500)
            OpenRecurringBillsMenu()
        end
    end
end

function OpenRecurringPaymentHistory(billId)
    ESX.TriggerServerCallback('illama_billing:getRecurringPaymentHistory', function(payments)
        local options = {}
        
        for _, payment in ipairs(payments) do
            local paymentMetadata = {
                {label = _L('amount_label'), value = string.format("$%s", ESX.Math.GroupDigits(payment.amount))},
                {label = _L('payments_count_label'), value = payment.payments_count}
            }
            local pluriel = payment.payments_count > 1 and "s" or ""
            table.insert(options, {
                title = string.format(_L('payment_amount'), ESX.Math.GroupDigits(payment.amount)),
                description = string.format(_L('payments_format'), payment.payments_count, pluriel),
                metadata = paymentMetadata
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_payments'),
                description = _L('no_payments_desc'),
                disabled = true
            })
        end

        lib.registerContext({
            id = 'recurring_payment_history',
            title = _L('payment_history_title'),
            menu = 'recurring_bill_actions',
            options = options
        })

        lib.showContext('recurring_payment_history')
    end, billId)
end

-------------------------------
--       CHECKING BILLS MENUS
-------------------------------
function OpenCheckBillsPlayerSelect()
    local players = GetNearbyPlayers()
    
    local options = {}
    for _, player in ipairs(players) do
        table.insert(options, {
            title = player.name,
            description = _L('distance', math.floor(player.distance)),
            onSelect = function()
                CheckPlayerBills(player.source)
            end
        })
    end

    if #options == 0 then
        table.insert(options, {
            title = _L('no_nearby_players'),
            description = _L('no_nearby_players_desc'),
            disabled = true
        })
    end

    lib.registerContext({
        id = 'check_bills_player_select',
        title = _L('select_player_check'),
        menu = 'society_billing_type_menu',
        options = options
    })

    lib.showContext('check_bills_player_select')
end

function CheckPlayerBills(target)
    local PlayerData = GetPlayerData()
    if not PlayerData.job then return end

    ESX.TriggerServerCallback('illama_billing:getAllPlayerBills', function(bills)
        local options = {}

        for _, bill in ipairs(bills.standard or {}) do
            if bill.society == PlayerData.job.name then
                table.insert(options, {
                    title = '$' .. ESX.Math.GroupDigits(bill.amount),
                    description = bill.reason,
                    metadata = {
                        {label = _L('bill_type'), value = _L('standard_bill')}
                    }
                })
            end
        end

        for _, bill in ipairs(bills.recurring or {}) do
            if bill.society == PlayerData.job.name then
                table.insert(options, {
                    title = '$' .. ESX.Math.GroupDigits(bill.amount),
                    description = bill.reason,
                    metadata = {
                        {label = _L('bill_type'), value = _L('recurring_bill')},
                        {label = _L('bill_interval'), value = string.format('%d %s', bill.interval_days, _L('days'))}
                    }
                })
            end
        end

        if #options == 0 then
            options = {{
                title = _L('no_bills'),
                description = _L('no_bills_desc'),
                disabled = true
            }}
        end

        lib.registerContext({
            id = 'check_player_bills',
            title = _L('bills_status'),
            menu = 'check_bills_player_select',
            options = options
        })

        lib.showContext('check_player_bills')
    end, target)
end

-------------------------------
--       REGISTERS / COMMANDS / EVENTS
-------------------------------
RegisterNetEvent('illama_billing:requestConfirmation')
AddEventHandler('illama_billing:requestConfirmation', function(billData)
    if not billData then return end

    local metadata = {
        {label = _L('from'), value = billData.sender_name}
    }

    if billData.interval_days then
        table.insert(metadata, {label = _L('frequency'), value = string.format(_L('days_count'), billData.interval_days)})
        table.insert(metadata, {label = _L('type'), value = _L('recurring')})
    else
        table.insert(metadata, {label = _L('type'), value = billData.type == 'society' and _L('society') or _L('personal')})
    end

    local options = {
        {
            title = _L('bill_details'),
            description = _L('amount_reason',
                ESX.Math.GroupDigits(billData.amount),
                billData.reason
            ),
            metadata = metadata
        }
    }

    if not billData.interval_days and billData.allow_installments then
        table.insert(options, {
            title = _L('pay_installments'),
            description = _L('pay_installments_desc'),
            icon = 'calendar',
            onSelect = function()
                OpenInstallmentMenu(billData)
            end
        })
    end

    table.insert(options, {
        title = billData.interval_days and _L('accept_subscription') or _L('accept_bill'),
        description = billData.interval_days and
            _L('accept_recurring_payment',
                ESX.Math.GroupDigits(billData.amount),
                billData.interval_days
            ) or
            _L('pay_amount', ESX.Math.GroupDigits(billData.amount)),
        icon = 'check',
        onSelect = function()
            local processAccept = function(signature)
                billData.signature = signature
                if billData.interval_days then
                    TriggerServerEvent('illama_billing:acceptRecurringBill', billData)
                else
                    TriggerServerEvent('illama_billing:acceptBill', billData)
                end
                lib.hideContext()
                lib.notify({
                    title = _L('bill_accepted'),
                    description = _L('bill_accepted_desc'),
                    type = 'success'
                })
            end

            if billData.requireSignature then
                Wait(100)
                lib.hideContext()
                Wait(100)
                OpenSignaturePrompt(processAccept)
            else
                processAccept(nil)
            end
        end
    })

    table.insert(options, {
        title = _L('refuse'),
        description = billData.interval_days and _L('refuse_subscription') or _L('refuse_bill'),
        icon = 'xmark',
        onSelect = function()
            if billData.interval_days then
                TriggerServerEvent('illama_billing:refuseRecurringBill')
            else
                TriggerServerEvent('illama_billing:refuseBill', billData)
            end
            lib.notify({
                title = _L('bill_refused'),
                description = _L('bill_refused_desc'),
                type = 'error'
            })
        end
    })

    lib.registerContext({
        id = 'confirm_bill_menu',
        title = _L('new_bill'),
        options = options,
        onClose = function()
            if billData.interval_days then
                TriggerServerEvent('illama_billing:refuseRecurringBill')
            else
                TriggerServerEvent('illama_billing:refuseBill', billData)
            end
        end
    })

    lib.showContext('confirm_bill_menu')
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

RegisterNetEvent('illama_billing:refuseRecurringBill')
AddEventHandler('illama_billing:refuseRecurringBill', function()
    local source = source
    local pendingBill = PendingBills[source]
    
    if not pendingBill then return end

    TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
        type = 'error',
        description = _L('bill_refused_by_receiver')
    })

    PendingBills[source] = nil
end)

RegisterNetEvent('illama_billing:billExpired')
AddEventHandler('illama_billing:billExpired', function(billId, billType)
    if lib.getOpenMenu() then
        lib.hideContext()
    end
    
    lib.notify({
        title = _L('bill_expired'),
        description = billType == 'recurring' and _L('recurring_cancelled_inactivity') or _L('bill_expired_desc'),
        type = 'error'
    })
    PlaySoundFrontend(-1, "EXIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

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