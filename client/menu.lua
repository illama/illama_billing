if not lib then return end
local ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
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

-- Événements ESX
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

function OpenMyBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            table.insert(options, {
                title = _L('bill_from', bill.sender_name),
                description = _L('amount_reason', ESX.Math.GroupDigits(bill.amount), bill.reason),
                metadata = {
                    {label = _L('status'), value = bill.status}
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

RegisterNetEvent('illama_billing:requestConfirmation')
AddEventHandler('illama_billing:requestConfirmation', function(billData)
    if not billData then return end

    lib.registerContext({
        id = 'confirm_bill_menu',
        title = _L('new_bill'),
        options = {
            {
                title = _L('bill_details'),
                description = _L('amount_reason', ESX.Math.GroupDigits(billData.amount), billData.reason),
                metadata = {
                    {label = _L('from'), value = billData.sender_name},
                    {label = _L('type'), value = billData.type == 'society' and _L('society') or _L('personal')}
                }
            },
            {
                title = _L('accept'),
                description = _L('accept_bill_desc'),
                icon = 'check',
                onSelect = function()
                    TriggerServerEvent('illama_billing:acceptBill', billData)
                    lib.notify({
                        title = _L('bill_accepted'),
                        description = _L('bill_accepted_desc'),
                        type = 'success'
                    })
                end
            },
            {
                title = _L('refuse'),
                description = _L('refuse_bill_desc'),
                icon = 'xmark',
                onSelect = function()
                    TriggerServerEvent('illama_billing:refuseBill', billData)
                    lib.notify({
                        title = _L('bill_refused'),
                        description = _L('bill_refused_desc'),
                        type = 'error'
                    })
                end
            }
        },
        onClose = function()
            TriggerServerEvent('illama_billing:refuseBill', billData)
        end
    })
    lib.showContext('confirm_bill_menu')
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)
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
                title = _L('personal_bills'),
                description = _L('personal_bills_desc'),
                onSelect = function()
                    OpenPersonalBillingMenu()
                end
            },
            {
                title = _L('society_bills'),
                description = _L('society_bills_desc'),
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
                title = _L('my_bills'),
                description = _L('my_bills_desc'),
                onSelect = function()
                    OpenMyBillsMenu()
                end
            },
            {
                title = _L('recurring_bills'),
                description = _L('recurring_bills_desc'),
                onSelect = function()
                    OpenRecurringBillsMenu()
                end
            },
            {
                title = _L('transaction_history'),
                description = _L('transaction_history_desc'),
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
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('select_player_menu')
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

    local options = {
        {
            title = _L('standard_bill'),
            description = _L('standard_bill_desc'),
            onSelect = function()
                OpenSocietyBillPlayerSelect('standard')
            end
        }
    }

    local PlayerData = GetPlayerData()
    local jobConfig = Config.AllowedJobs[PlayerData.job.name]
    if jobConfig and jobConfig.allowRecurring then
        table.insert(options, {
            title = _L('recurring_bill'),
            description = _L('recurring_bill_desc'),
            onSelect = function()
                OpenSocietyBillPlayerSelect('recurring')
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
            type = 'personal'
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
        }
    })

    if not input then return end
    local selectedTemplate = jobConfig.templates[input[1]]
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
                type = 'society'
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
                type = 'society'
            })
        end
    end
end

function CreateRecurringBill(target)
    local PlayerData = GetPlayerData()
    local jobConfig = Config.AllowedJobs[PlayerData.job.name]
    
    if not jobConfig or not jobConfig.allowRecurring then return end

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
                label = _L('payment_amount'),
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
            TriggerServerEvent('illama_billing:createRecurringBill', {
                target = target,
                amount = customInput[1],
                interval_days = customInput[2],
                reason = customInput[3],
                society = PlayerData.job.name,
                society_label = jobConfig.label
            })
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
            TriggerServerEvent('illama_billing:createRecurringBill', {
                target = target,
                amount = selectedTemplate.amount,
                interval_days = selectedTemplate.interval,
                reason = selectedTemplate.reason,
                society = PlayerData.job.name,
                society_label = jobConfig.label
            })
        end
    end
end

function OpenRecurringBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getRecurringBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            local nextPaymentText = _L('undefined')
            if bill.days_remaining then
                if tonumber(bill.days_remaining) <= 0 then
                    nextPaymentText = _L('today')
                elseif tonumber(bill.days_remaining) == 1 then
                    nextPaymentText = _L('tomorrow')
                else
                    nextPaymentText = _L('in_days', tonumber(bill.days_remaining))
                end
            end

            table.insert(options, {
                title = bill.society_label,
                description = _L('amount_reason',
                    ESX.Math.GroupDigits(bill.amount),
                    bill.reason
                ),
                metadata = {
                    {label = _L('next_payment'), value = nextPaymentText},
                    {label = _L('interval'), value = _L('days_count', bill.interval_days)},
                    {label = _L('status'), value = bill.status == 'active' and _L('active') or _L('inactive')}
                },
                onSelect = function()
                    OpenRecurringBillActions(bill)
                end
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_recurring_bills'),
                description = _L('no_recurring_bills_desc')
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
function OpenRecurringBillActions(bill)
    local options = {}

    if bill.status == 'active' then
        table.insert(options, {
            title = _L('pay_advance'),
            description = _L('pay_advance_desc'),
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
                    lib.showContext('recurring_bills_menu')
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
        title = _L('recurring_bill_number', bill.id),
        menu = 'recurring_bills_menu',
        options = options
    })

    lib.showContext('recurring_bill_actions')
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
            label = _L('payment_count'),
            description = _L('payment_count_desc'),
            required = true,
            min = 1,
            max = 12,
            default = 1
        }
    })

    if input then
        local total = bill.amount * input[2]
        local confirm = lib.alertDialog({
            header = _L('confirm_payment'),
            content = _L('confirm_advance_payment',
                ESX.Math.GroupDigits(total),
                input[2],
                input[1] == 'cash' and _L('cash') or _L('bank')
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
            table.insert(options, {
                title = _L('payment_amount', ESX.Math.GroupDigits(payment.amount)),
                description = _L('payments_count_desc', 
                    payment.payments_count,
                    payment.payments_count > 1 and _L('plural_s') or ''
                ),
                metadata = {
                    {label = _L('amount'), value = '$' .. ESX.Math.GroupDigits(payment.amount)},
                    {label = _L('payments_count'), value = payment.payments_count}
                }
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
            title = _L('payment_history'),
            menu = 'recurring_bill_actions',
            options = options
        })

        lib.showContext('recurring_payment_history')
    end, billId)
end

function OpenBillHistory()
    ESX.TriggerServerCallback('illama_billing:getBillHistory', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            local status_color = {
                pending = '🟡',
                paid = '🟢',
                deleted = '🔴'
            }

            local playerIdentifier = ESX.PlayerData.identifier
            local isReceiver = (bill.receiver == playerIdentifier)

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
                ),
                metadata = {
                    {label = _L('status'), value = bill.status},
                    {label = _L('type'), value = bill.type == 'society' and _L('society') or _L('personal')},
                    {label = _L('from'), value = bill.sender_name},
                    {label = _L('to'), value = bill.receiver_name}
                }
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = _L('no_history'),
                description = _L('no_history_desc'),
                disabled = true
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
function OpenBillDetailsMenu(bill)
    local options = {}

    if bill.status == 'pending' then
        table.insert(options, {
            title = _L('pay_cash'),
            description = _L('pay_amount_cash', ESX.Math.GroupDigits(bill.amount)),
            icon = 'money-bill',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'cash')
            end
        })

        table.insert(options, {
            title = _L('pay_bank'),
            description = _L('pay_amount_bank', ESX.Math.GroupDigits(bill.amount)),
            icon = 'credit-card',
            onSelect = function()
                TriggerServerEvent('illama_billing:payBill', bill.id, 'bank')
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
                    lib.showContext('my_bills_menu')
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

RegisterNetEvent('illama_billing:requestRecurringConfirmation')
AddEventHandler('illama_billing:requestRecurringConfirmation', function(billData)
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
