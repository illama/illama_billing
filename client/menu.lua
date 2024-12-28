if not lib then return end
local ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
local isInitialized = false

local function RefreshPlayerData()
    PlayerData = ESX.GetPlayerData()
    isInitialized = true
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
function OpenMyBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            table.insert(options, {
                title = _L('bill_from', bill.sender_name),
                description = _L('amount_reason', ESX.Math.GroupDigits(bill.amount), bill.reason),
                metadata = {
                    {label = _L('status_label'), value = bill.status == 'pending' and _L('pending') or (bill.status == 'paid' and _L('paid') or _L('deleted'))}
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

    local metadata = {
        {label = _L('from'), value = billData.sender_name}
    }

    if billData.interval_days then
        table.insert(metadata, {label = "Fréquence", value = billData.interval_days .. " jours"})
        table.insert(metadata, {label = "Type", value = "Récurrent"})
    else
        table.insert(metadata, {label = "Type", value = billData.type == 'society' and "Société" or "Personnel"})
    end

    lib.registerContext({
        id = 'confirm_bill_menu',
        title = _L('new_bill'),
        options = {
            {
                title = _L('bill_details'),
                description = string.format("Montant: $%s - Raison: %s", 
                    ESX.Math.GroupDigits(billData.amount), 
                    billData.reason
                ),
                metadata = metadata
            },
            {
                title = billData.interval_days and 'Accepter l\'abonnement' or 'Accepter la facture',
                description = billData.interval_days and 
                    string.format('Accepter le paiement récurrent de $%s tous les %d jours', 
                        ESX.Math.GroupDigits(billData.amount), 
                        billData.interval_days
                    ) or 
                    string.format('Payer $%s', ESX.Math.GroupDigits(billData.amount)),
                icon = 'check',
                onSelect = function()
                    if billData.interval_days then
                        TriggerServerEvent('illama_billing:acceptRecurringBill')
                    else
                        TriggerServerEvent('illama_billing:acceptBill', billData)
                    end
                    lib.notify({
                        title = _L('bill_accepted'),
                        description = _L('bill_accepted_desc'),
                        type = 'success'
                    })
                end
            },
            {
                title = 'Refuser',
                description = billData.interval_days and 'Refuser l\'abonnement' or 'Refuser la facture',
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
            }
        },
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
        }
    })

    if not input then return end
    
    local selectedPlayers = input[1]
    local splitType = input[2]
    local totalAmount = input[3]
    local reason = input[4]

    if not selectedPlayers or #selectedPlayers < 2 then
        lib.notify({
            title = _L('error'),
            description = _L('select_min_players'),
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
            local playerName = playerNames[tostring(source)] or 'Unknown'
            local labelText = playerName

            if splitType == 'percentage' then
                labelText = string.format('%s - %d%% restant', playerName, remainingPercentage)
            else
                labelText = string.format('%s - $%s restant', playerName, ESX.Math.GroupDigits(remainingAmount))
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
            and "Entrez le pourcentage pour chaque joueur"
            or "Entrez le montant pour chaque joueur"

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

            if amount > 0 then
                TriggerServerEvent('illama_billing:createBill', {
                    target = tonumber(source),
                    amount = amount,
                    reason = reason .. ' (' .. (splitType == 'percentage' and 'Répartition en %' or 'Répartition personnalisée') .. ')',
                    type = billType
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
                    reason = reason .. ' (Répartition égale)',
                    type = billType
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

    lib.registerContext({
        id = 'society_billing_type_menu',
        title = _L('bill_type'),
        menu = 'billing_main_menu',
        options = options
    })

    lib.showContext('society_billing_type_menu')
end

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

function OpenRecurringBillsMenu()
    ESX.TriggerServerCallback('illama_billing:getRecurringBills', function(bills)
        local options = {}
        
        for _, bill in ipairs(bills) do
            local nextPaymentText = "Non défini"
            if bill.days_remaining then
                local days = tonumber(bill.days_remaining)
                if days <= 0 then
                    nextPaymentText = "Aujourd'hui"
                elseif days == 1 then
                    nextPaymentText = "Demain"
                else
                    nextPaymentText = string.format("Dans %d jours", days)
                end
            end

            table.insert(options, {
                title = bill.society_label,
                description = string.format("Montant: $%s - %s", 
                    ESX.Math.GroupDigits(bill.amount),
                    bill.reason
                ),
                metadata = {
                    {label = "Prochain paiement", value = nextPaymentText},
                    {label = "Intervalle", value = string.format("%d jours", bill.interval_days)},
                    {label = "Statut", value = bill.status == 'active' and "Actif" or "Inactif"}
                },
                onSelect = function()
                    OpenRecurringBillActions(bill)
                end
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = "Aucune facture récurrente",
                description = "Vous n'avez aucune facture récurrente"
            })
        end

        lib.registerContext({
            id = 'recurring_bills_menu',
            title = "Mes factures récurrentes",
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
            title = "Payer en avance",
            description = "Effectuer des paiements à l'avance",
            icon = 'money-bill',
            onSelect = function()
                OpenAdvancePaymentMenu(bill)
            end
        })

        table.insert(options, {
            title = "Annuler l'abonnement",
            description = "Annuler cet abonnement",
            icon = 'ban',
            onSelect = function()
                local confirm = lib.alertDialog({
                    header = "Confirmation",
                    content = "Êtes-vous sûr de vouloir annuler cet abonnement ?",
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
        title = "Historique des paiements",
        description = "Voir l'historique des paiements pour cette facture",
        icon = 'history',
        onSelect = function()
            OpenRecurringPaymentHistory(bill.id)
        end
    })

    lib.registerContext({
        id = 'recurring_bill_actions',
        title = string.format("Facture récurrente #%d", bill.id),
        menu = 'recurring_bills_menu',
        options = options
    })

    lib.showContext('recurring_bill_actions')
end

function OpenAdvancePaymentMenu(bill)
    local input = lib.inputDialog("Paiement en avance", {
        {
            type = 'select',
            label = "Méthode de paiement",
            options = {
                { value = 'cash', label = "Espèces" },
                { value = 'bank', label = "Banque" }
            },
            default = 'bank'
        },
        {
            type = 'number',
            label = "Nombre de paiements",
            description = "Combien de paiements souhaitez-vous effectuer en avance ?",
            required = true,
            min = 1,
            max = 12,
            default = 1
        }
    })

    if input then
        local total = bill.amount * input[2]
        local confirm = lib.alertDialog({
            header = "Confirmation du paiement",
            content = string.format("Voulez-vous payer $%s pour %d paiement(s) en %s ?", 
                ESX.Math.GroupDigits(total), 
                input[2], 
                input[1] == 'cash' and "espèces" or "banque"
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
                {label = "Montant", value = string.format("$%s", ESX.Math.GroupDigits(payment.amount))},
                {label = "Nombre de paiements", value = payment.payments_count}
            }
            local pluriel = payment.payments_count > 1 and "s" or ""
            table.insert(options, {
                title = string.format("Paiement de $%s", ESX.Math.GroupDigits(payment.amount)),
                description = string.format("%d paiement%s", payment.payments_count, pluriel),
                metadata = paymentMetadata
            })
        end
        
        if #options == 0 then
            table.insert(options, {
                title = "Aucun paiement",
                description = "Aucun paiement n'a été effectué",
                disabled = true
            })
        end

        lib.registerContext({
            id = 'recurring_payment_history',
            title = "Historique des paiements",
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
                    {label = _L('status'), value = bill.status == 'pending' and _L('pending') or (bill.status == 'paid' and _L('paid') or _L('deleted'))},
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