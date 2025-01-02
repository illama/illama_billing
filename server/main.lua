-------------------------------
--          INIT
-------------------------------
local ESX = exports["es_extended"]:getSharedObject()
local PendingBills = {}
local RecurringBillsThread = false
local scriptVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0) or '1.0.0'

-------------------------------
--     UTILITY FUNCTIONS
-------------------------------
local function canCreateSocietyBill(xPlayer)
    local jobConfig = Config.AllowedJobs[xPlayer.job.name]
    if not jobConfig then return false end
    return xPlayer.job.grade >= jobConfig.minGrade
end

local function isJobAllowedForRecurring(jobName)
    local jobConfig = Config.AllowedJobs[jobName]
    return jobConfig and jobConfig.allowRecurring or false
end

local function IsValidDescription(text)
    if not text or text == '' then
        return false
    end
    return string.match(text, "^[%s%da-zA-ZÀ-ÿ#%-%_/]+$") ~= nil
end

function FormatDateTime()
    local time = os.date("*t")
    return string.format("%02d/%02d/%04d %02d:%02d:%02d", 
        time.day, time.month, time.year, 
        time.hour, time.min, time.sec)
end

function FormatDate(timestamp)
    local time
    if timestamp then
        time = os.date("*t", timestamp)
    else
        time = os.date("*t")
    end
    return string.format("%02d/%02d/%04d", time.day, time.month, time.year)
end

local function SendWebhook(webhookType, data)
    if not Config.Webhooks.enabled then return end
    local webhook
    if data.society then
        local jobConfig = Config.AllowedJobs[data.society]
        if jobConfig and jobConfig.webhooks then
            webhook = jobConfig.webhooks[webhookType]
            if not webhook or not webhook.enabled then
                webhook = Config.Webhooks.standard[webhookType]
            end
        end
    else
        webhook = Config.Webhooks.standard[webhookType]
    end
    
    if not webhook or not webhook.enabled or not webhook.url then 
        return 
    end

    local embed = {
        {
            ["color"] = webhook.color or 16711680,
            ["title"] = _L('webhook_'..webhookType..'_title'),
            ["description"] = _L('webhook_'..webhookType..'_desc', table.unpack(data.params or {})),
            ["fields"] = data.fields or {},
            ["footer"] = {
                ["text"] = _L('webhook_footer', FormatDateTime())
            }
        }
    }
    if data.society then
        local jobConfig = Config.AllowedJobs[data.society]
        if jobConfig and jobConfig.webhooks and jobConfig.webhooks.logo then
            embed[1]["thumbnail"] = {
                ["url"] = jobConfig.webhooks.logo
            }
        end
    end

    local payload = json.encode({
        username = data.society and Config.AllowedJobs[data.society].label or _L('webhook_bot_name'),
        embeds = embed
    })

    PerformHttpRequest(webhook.url, function(err, text, headers) 
        if err == 204 then
        elseif err ~= 200 then
        else
        end
    end, 'POST', payload, { ['Content-Type'] = 'application/json' })
end

-------------------------------
--     SERVER CALLBACKS
-------------------------------
ESX.RegisterServerCallback('illama_billing:getBills', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query([[
        SELECT b.*, b.signature 
        FROM illama_bills b
        WHERE b.receiver = ? 
        AND b.status = 'pending'
        AND NOT EXISTS (
            SELECT 1 
            FROM illama_installment_payments ip 
            WHERE ip.bill_id = b.id
        )
        ORDER BY b.date DESC
    ]], {xPlayer.identifier}, function(bills)
        cb(bills or {})
    end)
end)

ESX.RegisterServerCallback('illama_billing:getBillHistory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query([[
        SELECT 
            b.*,
            COALESCE(b.tags, '[]') as tags
        FROM illama_bills b
        WHERE receiver = ? OR sender = ?
        ORDER BY date DESC
        LIMIT 50
    ]], {
        xPlayer.identifier,
        xPlayer.identifier
    }, function(bills)
        if bills then
            for i, bill in ipairs(bills) do
                local success, decodedTags = pcall(json.decode, bill.tags)
                bills[i].tags = success and decodedTags or {}
            end
        end
        cb(bills or {})
    end)
end)

ESX.RegisterServerCallback('illama_billing:getRecurringBills', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query([[
        SELECT 
            b.*,
            IFNULL(DATEDIFF(b.next_billing_date, NOW()), 0) as days_remaining
        FROM illama_recurring_bills b
        WHERE b.receiver = ? 
        ORDER BY b.next_billing_date ASC
    ]], {xPlayer.identifier}, function(bills)
        for i, bill in ipairs(bills) do
            bill.days_remaining = tonumber(bill.days_remaining) or 0
        end
        cb(bills or {})
    end)
end)

ESX.RegisterServerCallback('illama_billing:getAllPlayerBills', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
    
    if not xPlayer or not xTarget then 
        cb({})
        return
    end

    local bills = {
        standard = {},
        recurring = {}
    }
    MySQL.query('SELECT society, amount, reason, status FROM illama_bills WHERE receiver = ? AND status = "pending"', 
        {xTarget.identifier}, 
        function(standardBills)
            bills.standard = standardBills or {}
            MySQL.query('SELECT society, amount, reason, status, interval_days FROM illama_recurring_bills WHERE receiver = ? AND status = "active"',
                {xTarget.identifier}, 
                function(recurringBills)
                    bills.recurring = recurringBills or {}
                    cb(bills)
                end
            )
        end
    )
end)

ESX.RegisterServerCallback('illama_billing:getRecurringPaymentHistory', function(source, cb, billId)
    MySQL.query('SELECT * FROM illama_recurring_payments WHERE recurring_bill_id = ? ORDER BY payment_date DESC', 
        {billId},
        function(payments)
            cb(payments or {})
        end
    )
end)

ESX.RegisterServerCallback('illama_billing:getInstallmentPayments', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then 
        cb({})
        return
    end

    MySQL.query([[
        SELECT 
            ip.*,
            b.reason as bill_reason
        FROM illama_installment_payments ip
        JOIN illama_bills b ON b.id = ip.bill_id
        WHERE ip.player_identifier = ?
        AND ip.remaining_payments > 0
    ]], {xPlayer.identifier}, function(results)
        cb(results or {})
    end)
end)

ESX.RegisterServerCallback('illama_billing:generateBillImage', function(source, cb, content)
    local html = [[
        <div style="width: 400px; height: 500px; background-color: white; border: 2px solid black; padding: 20px; font-family: Arial, sans-serif;">
            <h2 style="text-align: center; color: #333;">%s</h2>
            <table style="width: 100%%;">
                <tr><td><strong>De:</strong></td><td>%s</td></tr>
                <tr><td><strong>À:</strong></td><td>%s</td></tr>
                <tr><td><strong>Montant:</strong></td><td>%s</td></tr>
                <tr><td><strong>Raison:</strong></td><td>%s</td></tr>
                <tr><td><strong>Statut:</strong></td><td>%s</td></tr>
                <tr><td><strong>Type:</strong></td><td>%s</td></tr>
            </table>
        </div>
    ]]

    local formattedHtml = string.format(html,
        content.title,
        content.sender,
        content.receiver,
        content.amount,
        content.reason,
        content.status,
        content.type
    )

    cb(formattedHtml)
end)

-------------------------------
--     BILL MANAGEMENT
-------------------------------
RegisterNetEvent('illama_billing:createBill')
AddEventHandler('illama_billing:createBill', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(data.target)
    if not xPlayer or not xTarget then return end
    if not data.reason or not IsValidDescription(data.reason) then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = _L('invalid_description')
        })
        return
    end
    if data.type == 'society' and not canCreateSocietyBill(xPlayer) then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = _L('insufficient_rights')
        })
        return
    end
    local maxAmount = Config.MaxBillAmount
    if data.type == 'society' then
        local jobConfig = Config.AllowedJobs[xPlayer.job.name]
        if jobConfig and jobConfig.maxAmount then
            maxAmount = jobConfig.maxAmount
        end
    end
    local amount = tonumber(data.amount)
    if not amount or amount <= 0 or amount > maxAmount then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = _L('invalid_amount')
        })
        return
    end
    local billData = {
        type = 'standard',
        data = {
            sender = xPlayer.identifier,
            sender_name = xPlayer.getName(),
            sender_source = source,
            target = data.target,
            amount = amount,
            reason = data.reason,
            bill_type = data.type,
            society = data.type == 'society' and xPlayer.job.name or nil,
            job_label = data.type == 'society' and xPlayer.job.label or nil,
            allow_installments = data.allow_installments,
            requireSignature = data.requireSignature
        }
    }
    PendingBills[data.target] = billData
    SendWebhook('bill_created', {
        society = data.type == 'society' and xPlayer.job.name or nil,
        params = {
            ESX.Math.GroupDigits(amount),
            xPlayer.getName(),
            xTarget.getName()
        },
        fields = {
            {
                ["name"] = _L('webhook_amount'),
                ["value"] = ESX.Math.GroupDigits(amount),
                ["inline"] = true
            },
            {
                ["name"] = _L('webhook_reason'),
                ["value"] = data.reason,
                ["inline"] = true
            },
            {
                ["name"] = _L('webhook_type'),
                ["value"] = data.type == 'society' and xPlayer.job.label or _L('webhook_type_personal'),
                ["inline"] = true
            }
        }
    })
    TriggerClientEvent('illama_billing:requestConfirmation', data.target, billData.data)
    TriggerClientEvent('ox_lib:notify', source, {
        type = 'info',
        description = _L('bill_request_sent')
    })
end)

RegisterNetEvent('illama_billing:payBill')
AddEventHandler('illama_billing:payBill', function(billId, paymentType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.single('SELECT * FROM illama_bills WHERE id = ? AND status = ?', 
        {billId, 'pending'},
        function(bill)
            if not bill then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = _L('bill_already_paid')
                })
                return
            end

            local money = paymentType == 'bank' and xPlayer.getAccount('bank').money or xPlayer.getMoney()

            if money < bill.amount then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = _L('insufficient_funds', ESX.Math.GroupDigits(bill.amount - money))
                })
                return
            end

            if paymentType == 'bank' then
                xPlayer.removeAccountMoney('bank', bill.amount)
            else
                xPlayer.removeMoney(bill.amount)
            end

            MySQL.update('UPDATE illama_bills SET status = ? WHERE id = ?', 
                {'paid', billId},
                function(affectedRows)
                    if affectedRows > 0 then
                        SendWebhook('bill_paid', {
                            society = bill.type == 'society' and bill.society or nil,
                            params = {
                                ESX.Math.GroupDigits(bill.amount),
                                xPlayer.getName()
                            },
                            fields = {
                                {
                                    ["name"] = _L('webhook_payment_method'),
                                    ["value"] = paymentType == 'bank' and _L('webhook_payment_bank') or _L('webhook_payment_cash'),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = _L('webhook_bill_id'),
                                    ["value"] = billId,
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = _L('webhook_reason'),
                                    ["value"] = bill.reason,
                                    ["inline"] = true
                                }
                            }
                        })
                        if bill.type == 'society' then
                            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. bill.society, function(account)
                                if account then
                                    account.addMoney(bill.amount)
                                    
                                    TriggerClientEvent('ox_lib:notify', source, {
                                        type = 'success',
                                        description = _L('payment_made_society', ESX.Math.GroupDigits(bill.amount), bill.society)
                                    })

                                    local xPlayers = ESX.GetPlayers()
                                    for _, playerId in ipairs(xPlayers) do
                                        local xTarget = ESX.GetPlayerFromId(playerId)
                                        if xTarget and xTarget.job.name == bill.society and xTarget.job.grade_name == 'boss' then
                                            TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                                title = _L('society_payment'),
                                                description = _L('bill_paid_amount', ESX.Math.GroupDigits(bill.amount)),
                                                type = 'success'
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

                                TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                    type = 'success',
                                    description = _L('payment_received', ESX.Math.GroupDigits(bill.amount), xPlayer.getName())
                                })
                            else
                                MySQL.query('UPDATE users SET accounts = JSON_SET(accounts, "$.bank", CAST(JSON_EXTRACT(accounts, "$.bank") AS UNSIGNED) + ?) WHERE identifier = ?',
                                    {bill.amount, bill.sender}
                                )
                            end

                            TriggerClientEvent('ox_lib:notify', source, {
                                type = 'success',
                                description = _L('payment_made_player', ESX.Math.GroupDigits(bill.amount), bill.sender_name)
                            })
                        end

                        TriggerClientEvent('illama_billing:refreshMenu', source)
                    end
                end
            )
        end
    )
end)

RegisterNetEvent('illama_billing:acceptBill')
AddEventHandler('illama_billing:acceptBill', function(billData)
    local source = source
    local pendingBill = PendingBills[source]
    
    if not pendingBill then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    MySQL.insert('INSERT INTO illama_bills (sender, sender_name, receiver, receiver_name, amount, reason, type, society, status, allow_installments, signature) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        {
            pendingBill.data.sender,
            pendingBill.data.sender_name,
            xPlayer.identifier,
            xPlayer.getName(),
            pendingBill.data.amount,
            pendingBill.data.reason,
            pendingBill.data.bill_type,
            pendingBill.data.society,
            'pending',
            pendingBill.data.allow_installments,
            billData.signature
        },
        function(id)
            if id then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'success',
                    description = _L('bill_accepted')
                })

                TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
                    type = 'success',
                    description = _L('bill_accepted_by_receiver')
                })
            end
        end
    )

    PendingBills[source] = nil
end)

RegisterNetEvent('illama_billing:refuseBill')
AddEventHandler('illama_billing:refuseBill', function(billData)
    local source = source
    local pendingBill = PendingBills[source]
    
    if not pendingBill then return end

    TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
        type = 'error',
        description = _L('bill_refused_by_receiver')
    })

    PendingBills[source] = nil
end)

AddEventHandler('playerDropped', function()
    local source = source
    local pendingBill = PendingBills[source]
    if pendingBill then
        if pendingBill.type == 'recurring' then
            TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
                type = 'error',
                description = _L('player_disconnected_recurring')
            })
        else
            TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
                type = 'error',
                description = _L('player_disconnected_bill')
            })
        end
        PendingBills[source] = nil
    end
end)

RegisterNetEvent('illama_billing:deleteBill')
AddEventHandler('illama_billing:deleteBill', function(billId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    MySQL.single([[
        SELECT b.*, j.label as job_label 
        FROM illama_bills b 
        LEFT JOIN jobs j ON j.name = b.society 
        WHERE b.id = ? AND b.receiver = ?
    ]], {billId, xPlayer.identifier},
        function(bill)
            if not bill then return end
            
            MySQL.update('DELETE FROM illama_bills WHERE id = ? AND receiver = ?', 
                {billId, xPlayer.identifier},
                function(affectedRows)
                    if affectedRows then
                        SendWebhook('bill_deleted', {
                            society = bill.type == 'society' and bill.society or nil,
                            params = {
                                tostring(ESX.Math.GroupDigits(bill.amount)),
                                xPlayer.getName()
                            },
                            fields = {
                                {
                                    ["name"] = _L('webhook_bill_id'),
                                    ["value"] = tostring(billId),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = _L('webhook_reason'),
                                    ["value"] = tostring(bill.reason),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = _L('webhook_type'),
                                    ["value"] = bill.type == 'society' and (bill.job_label or bill.society) or _L('webhook_type_personal'),
                                    ["inline"] = true
                                }
                            }
                        })

                        TriggerClientEvent('ox_lib:notify', source, {
                            type = 'success',
                            description = _L('bill_deleted')
                        })

                        if bill.type == 'society' then
                            local xPlayers = ESX.GetPlayers()
                            for _, playerId in ipairs(xPlayers) do
                                local xTarget = ESX.GetPlayerFromId(playerId)
                                if xTarget and xTarget.job.name == bill.society and xTarget.job.grade_name == 'boss' then
                                    TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                        type = 'error',
                                        description = _L('bill_deleted_amount', ESX.Math.GroupDigits(bill.amount))
                                    })
                                end
                            end
                        else
                            local xTarget = ESX.GetPlayerFromIdentifier(bill.sender)
                            if xTarget then
                                TriggerClientEvent('ox_lib:notify', xTarget.source, {
                                    type = 'error',
                                    description = _L('bill_deleted_amount', ESX.Math.GroupDigits(bill.amount))
                                })
                            end
                        end
                    end
                end
            )
        end
    )
end)

-------------------------------
--     RECURRING BILLS
-------------------------------
RegisterNetEvent('illama_billing:createRecurringBill')
AddEventHandler('illama_billing:createRecurringBill', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(data.target)

    if not canCreateSocietyBill(xPlayer) or not isJobAllowedForRecurring(xPlayer.job.name) then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = _L('insufficient_rights')
        })
        return
    end

    local pendingBillData = {
        type = 'recurring',
        data = {
            sender = xPlayer.identifier,
            sender_name = xPlayer.getName(),
            sender_source = source,
            target = data.target,
            amount = data.amount,
            reason = data.reason,
            interval_days = data.interval_days,
            society = data.society,
            society_label = data.society_label,
            type = 'society',
            bill_type = 'society'
        }
    }

    PendingBills[data.target] = pendingBillData

    TriggerClientEvent('illama_billing:requestConfirmation', data.target, pendingBillData.data)

    TriggerClientEvent('ox_lib:notify', source, {
        type = 'info',
        description = _L('recurring_bill_request_sent')
    })
end)

RegisterNetEvent('illama_billing:acceptRecurringBill')
AddEventHandler('illama_billing:acceptRecurringBill', function()
    local source = source
    local pendingBill = PendingBills[source]

    if not pendingBill or not pendingBill.data.interval_days then 
        return 
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local billData = pendingBill.data
    local nextBillingDate = os.time() + (billData.interval_days * 86400)

    MySQL.insert('INSERT INTO illama_recurring_bills (society, society_label, receiver, receiver_name, amount, reason, interval_days, next_billing_date) VALUES (?, ?, ?, ?, ?, ?, ?, FROM_UNIXTIME(?))',
        {
            billData.society,
            billData.society_label,
            xPlayer.identifier,
            xPlayer.getName(),
            billData.amount,
            billData.reason,
            billData.interval_days,
            nextBillingDate
        },
        function(id)
            if id then
                SendWebhook('recurring_created', {
                    society = pendingBill.data.society,
                    params = {
                        ESX.Math.GroupDigits(pendingBill.data.amount),
                        xPlayer.getName(),
                        pendingBill.data.interval_days
                    },
                    fields = {
                        {
                            ["name"] = _L('webhook_amount'),
                            ["value"] = ESX.Math.GroupDigits(pendingBill.data.amount),
                            ["inline"] = true
                        },
                        {
                            ["name"] = _L('webhook_interval'),
                            ["value"] = _L('webhook_days_count', pendingBill.data.interval_days),
                            ["inline"] = true
                        },
                        {
                            ["name"] = _L('webhook_next_payment'),
                            ["value"] = FormatDate(os.time() + (pendingBill.data.interval_days * 86400)),
                            ["inline"] = true
                        },
                        {
                            ["name"] = _L('webhook_reason'),
                            ["value"] = pendingBill.data.reason,
                            ["inline"] = true
                        }
                    }
                })
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'success',
                    description = _L('recurring_bill_accepted')
                })
                
                TriggerClientEvent('ox_lib:notify', billData.sender_source, {
                    type = 'success',
                    description = _L('recurring_bill_setup')
                })

                if not RecurringBillsThread then
                    StartRecurringBillsThread()
                end
            end
        end
    )

    PendingBills[source] = nil
end)

RegisterNetEvent('illama_billing:payRecurringBill')
AddEventHandler('illama_billing:payRecurringBill', function(billId, payments, paymentType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.single('SELECT * FROM illama_recurring_bills WHERE id = ? AND status = ?', 
        {billId, 'active'},
        function(bill)
            if not bill then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = _L('bill_inactive')
                })
                return
            end

            local totalAmount = bill.amount * payments
            local money = paymentType == 'bank' and xPlayer.getAccount('bank').money or xPlayer.getMoney()

            if money < totalAmount then
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'error',
                    description = _L('insufficient_funds', ESX.Math.GroupDigits(totalAmount - money))
                })
                return
            end

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..bill.society, function(account)
                if not account then return end

                if paymentType == 'bank' then
                    xPlayer.removeAccountMoney('bank', totalAmount)
                else
                    xPlayer.removeMoney(totalAmount)
                end

                local newNextBillingDate = os.time() + ((bill.interval_days * payments) * 86400)
                
                MySQL.query('UPDATE illama_recurring_bills SET next_billing_date = FROM_UNIXTIME(?) WHERE id = ?',
                    {newNextBillingDate, billId}
                )

                MySQL.insert('INSERT INTO illama_recurring_payments (recurring_bill_id, amount, payments_count) VALUES (?, ?, ?)',
                    {billId, totalAmount, payments}
                )

                account.addMoney(totalAmount)

                local formattedAmount = ESX.Math.GroupDigits(totalAmount)
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'success',
                    description = _L('payment_made_society', formattedAmount, bill.society)
                })

                local xPlayers = ESX.GetPlayers()
                for _, playerId in ipairs(xPlayers) do
                    local xTarget = ESX.GetPlayerFromId(playerId)
                    if xTarget and xTarget.job.name == bill.society and xTarget.job.grade_name == 'boss' then
                        TriggerClientEvent('ox_lib:notify', xTarget.source, {
                            title = _L('recurring_payment'),
                            description = _L('payment_received', formattedAmount),
                            type = 'success'
                        })
                    end
                end
            end)
        end
    )
end)

RegisterNetEvent('illama_billing:cancelRecurringBill')
AddEventHandler('illama_billing:cancelRecurringBill', function(billId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.query('DELETE FROM illama_recurring_bills WHERE id = ? AND receiver = ?', 
        {billId, xPlayer.identifier},
        function(affectedRows)
            if affectedRows > 0 then
                MySQL.query('DELETE FROM illama_recurring_payments WHERE recurring_bill_id = ?', {billId})
                
                TriggerClientEvent('ox_lib:notify', source, {
                    type = 'success',
                    description = _L('subscription_cancelled')
                })
            end
        end
    )
end)

-------------------------------
--     INSTALLMENT BILLS
-------------------------------
RegisterNetEvent('illama_billing:setupInstallmentPlan')
AddEventHandler('illama_billing:setupInstallmentPlan', function(billData, numberOfPayments)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pendingBill = PendingBills[source]
    
    if not xPlayer or not pendingBill then return end

    MySQL.insert('INSERT INTO illama_bills (sender, sender_name, receiver, receiver_name, amount, reason, type, society, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        {
            pendingBill.data.sender,
            pendingBill.data.sender_name,
            xPlayer.identifier,
            xPlayer.getName(),
            pendingBill.data.amount,
            pendingBill.data.reason,
            pendingBill.data.bill_type,
            pendingBill.data.society,
            'pending'
        },
        function(billId)
            if billId then
                local amountPerPayment = math.ceil(pendingBill.data.amount / numberOfPayments)
                local nextPaymentDate = os.time() + (7 * 86400)
                MySQL.insert('INSERT INTO illama_installment_payments (bill_id, player_identifier, amount_per_payment, remaining_payments, next_payment_date, total_payments) VALUES (?, ?, ?, ?, FROM_UNIXTIME(?), ?)',
                    {
                        billId,
                        xPlayer.identifier,
                        amountPerPayment,
                        numberOfPayments,
                        nextPaymentDate,
                        numberOfPayments
                    },
                    function(id)
                        if id then
                            SendWebhook('installment_created', {
                                society = pendingBill.data.society,
                                params = {
                                    ESX.Math.GroupDigits(pendingBill.data.amount),
                                    xPlayer.getName(),
                                    numberOfPayments
                                },
                                fields = {
                                    {
                                        ["name"] = _L('webhook_amount_per_payment'),
                                        ["value"] = ESX.Math.GroupDigits(amountPerPayment),
                                        ["inline"] = true
                                    },
                                    {
                                        ["name"] = _L('webhook_total_payments'),
                                        ["value"] = numberOfPayments,
                                        ["inline"] = true
                                    },
                                    {
                                        ["name"] = _L('webhook_next_payment'),
                                        ["value"] = FormatDate(nextPaymentDate),
                                        ["inline"] = true
                                    },
                                    {
                                        ["name"] = _L('webhook_reason'),
                                        ["value"] = pendingBill.data.reason,
                                        ["inline"] = true
                                    }
                                }
                            })
                            TriggerClientEvent('ox_lib:notify', source, {
                                type = 'success',
                                description = _L('payment_plan_created')
                            })
                            TriggerClientEvent('ox_lib:notify', pendingBill.data.sender_source, {
                                type = 'success',
                                description = _L('bill_accepted_with_installments')
                            })
                        end
                    end
                )
            end
        end
    )
    PendingBills[source] = nil
end)

-------------------------------
--     TAGS MANAGEMENT
-------------------------------
RegisterNetEvent('illama_billing:addTagToBill')
AddEventHandler('illama_billing:addTagToBill', function(billId, tag)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.query('SELECT tags FROM illama_bills WHERE id = ?', {billId}, function(result)
        if result and result[1] then
            local success, currentTags = pcall(json.decode, result[1].tags or '[]')
            if not success then currentTags = {} end
            for _, existingTag in ipairs(currentTags) do
                if existingTag == tag then
                    return
                end
            end
            
            table.insert(currentTags, tag)
            
            MySQL.update('UPDATE illama_bills SET tags = ? WHERE id = ?', {
                json.encode(currentTags),
                billId
            })
        end
    end)
end)

RegisterNetEvent('illama_billing:removeTagFromBill')
AddEventHandler('illama_billing:removeTagFromBill', function(billId, tagToRemove)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end

    MySQL.query('SELECT tags FROM illama_bills WHERE id = ?', {billId}, function(result)
        if result and result[1] then
            local success, currentTags = pcall(json.decode, result[1].tags or '[]')
            if not success then currentTags = {} end
            local newTags = {}
            for _, tag in ipairs(currentTags) do
                if tag ~= tagToRemove then
                    table.insert(newTags, tag)
                end
            end
            
            MySQL.update('UPDATE illama_bills SET tags = ? WHERE id = ?', {
                json.encode(newTags),
                billId
            })
        end
    end)
end)

-------------------------------
--     PAYMENT PROCESSING
-------------------------------
function StartRecurringBillsThread()
    if RecurringBillsThread then return end
    RecurringBillsThread = true
    CreateThread(function()
        while true do
            MySQL.query('SELECT * FROM illama_recurring_bills WHERE status = ? AND next_billing_date <= NOW()',
                {'active'},
                function(bills)
                    for _, bill in ipairs(bills) do
                        local xPlayer = ESX.GetPlayerFromIdentifier(bill.receiver)
                        if xPlayer then
                            MySQL.insert('INSERT INTO illama_bills (sender, sender_name, receiver, receiver_name, amount, reason, type, society, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
                                {
                                    nil,
                                    bill.society_label,
                                    bill.receiver,
                                    bill.receiver_name,
                                    bill.amount,
                                    bill.reason..' '.._L('recurring_payment_suffix'),
                                    'society',
                                    bill.society,
                                    'pending'
                                },
                                function(billId)
                                    if billId then
                                        SendWebhook('recurring_payment', {
                                            society = bill.society,
                                            params = {
                                                ESX.Math.GroupDigits(bill.amount),
                                                xPlayer.getName()
                                            },
                                            fields = {
                                                {
                                                    ["name"] = _L('webhook_amount'),
                                                    ["value"] = ESX.Math.GroupDigits(bill.amount),
                                                    ["inline"] = true
                                                },
                                                {
                                                    ["name"] = _L('webhook_next_payment'),
                                                    ["value"] = FormatDate(os.time() + (bill.interval_days * 86400)),
                                                    ["inline"] = true
                                                },
                                                {
                                                    ["name"] = _L('webhook_reason'),
                                                    ["value"] = bill.reason,
                                                    ["inline"] = true
                                                },
                                                {
                                                    ["name"] = _L('webhook_bill_id'),
                                                    ["value"] = billId,
                                                    ["inline"] = true
                                                }
                                            }
                                        })
                                    end
                                end
                            )
                            MySQL.query('UPDATE illama_recurring_bills SET next_billing_date = DATE_ADD(next_billing_date, INTERVAL ? DAY) WHERE id = ?',
                                {bill.interval_days, bill.id}
                            )
                            TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                                title = _L('recurring_bill'),
                                description = _L('new_recurring_bill_amount',
                                    ESX.Math.GroupDigits(bill.amount),
                                    bill.society_label
                                ),
                                type = 'info',
                                duration = 10000
                            })
                        else
                            MySQL.query('UPDATE illama_recurring_bills SET next_billing_date = DATE_ADD(next_billing_date, INTERVAL ? DAY) WHERE id = ?',
                                {bill.interval_days, bill.id}
                            )
                        end
                    end
                end
            )
            Wait(60000)
        end
    end)
end

CreateThread(function()
    while true do
        MySQL.query([[
            SELECT * FROM illama_installment_payments 
            WHERE remaining_payments > 0 
            AND next_payment_date <= NOW()
        ]], {}, function(payments)
            for _, payment in ipairs(payments) do
                local xPlayer = ESX.GetPlayerFromIdentifier(payment.player_identifier)
                
                if xPlayer then
                    local bankMoney = xPlayer.getAccount('bank').money
                    
                    if bankMoney >= payment.amount_per_payment then
                        xPlayer.removeAccountMoney('bank', payment.amount_per_payment)
                        MySQL.query([[
                            UPDATE illama_installment_payments 
                            SET remaining_payments = remaining_payments - 1,
                                next_payment_date = DATE_ADD(next_payment_date, INTERVAL 7 DAY)
                            WHERE id = ?
                        ]], {payment.id})
                        TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                            title = _L('installment_payment'),
                            description = _L('payment_processed', ESX.Math.GroupDigits(payment.amount_per_payment)),
                            type = 'success'
                        })
                    else
                        TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                            title = _L('payment_failed'),
                            description = _L('insufficient_funds_installment'),
                            type = 'error'
                        })
                    end
                end
            end
        end)
        
        Wait(60000)
    end
end)

-------------------------------
--     VERSION CHECKING
-------------------------------
local githubUser = 'illama'
local githubRepo = 'illama_billing'

local function GetCurrentVersion()
    local resourceName = GetCurrentResourceName()
    local manifest = LoadResourceFile(resourceName, 'fxmanifest.lua')
    if not manifest then
        return nil
    end
   
    for line in manifest:gmatch("[^\r\n]+") do
        local version = line:match("^version%s+['\"](.+)['\"]")
        if version then
            return version:gsub("%s+", "")
        end
    end
   
    return nil
end

local function CheckVersion()
    local currentVersion = GetCurrentVersion()
    if not currentVersion then
        print(_L('version_read_error'))
        return
    end

    PerformHttpRequest(
        ('https://api.github.com/repos/%s/%s/releases/latest'):format(githubUser, githubRepo),
        function(err, text, headers)
            if err ~= 200 then
                print(_L('github_check_error'))
                return
            end
           
            local data = json.decode(text)
            if not data or not data.tag_name then
                print(_L('github_version_read_error'))
                return
            end
           
            local latestVersion = data.tag_name:gsub("^v", "")
           
            if latestVersion ~= currentVersion then
                print(_L('new_version_available'))
                print(_L('current_version', currentVersion))
                print(_L('latest_version', latestVersion))
                print(_L('release_notes', data.html_url or 'N/A'))
                if data.body then
                    print(_L('changes_list', data.body))
                end
            else
                print(_L('script_up_to_date', currentVersion))
            end
        end,
        'GET',
        '',
        {['User-Agent'] = 'FXServer-'..githubUser}
    )
end

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

local function StartPeriodicWarning(expectedName, currentName)
    CreateThread(function()
        while true do
            print('^1[' .. _L('billing_system_error') .. '] ^7')
            print('^1[' .. _L('error') .. '] ^7' .. _L('script_disabled_wrong_name'))
            print('^1[' .. _L('error') .. '] ^7' .. _L('expected_name', expectedName))
            print('^1[' .. _L('error') .. '] ^7' .. _L('current_name', currentName))
            print('^1[' .. _L('error') .. '] ^7' .. _L('rename_folder_instruction'))
            print('^1[' .. _L('error') .. '] ^7' .. _L('contact_support'))
            Wait(10000)
        end
    end)
end
local function DisableScript(expectedName, currentName)
    AddEventHandler = function() return end
    RegisterNetEvent = function() return end
    TriggerEvent = function() return end
    ESX.RegisterServerCallback = function() return end
    RegisterCommand = function() return end
    StartPeriodicWarning(expectedName, currentName)
    TriggerClientEvent('illama_billing:scriptDisabled', -1, expectedName, currentName)
end

local function ValidateResourceName()
    local resourceName = GetCurrentResourceName()
    local manifestVersion = GetManifestVersion()
    local expectedName = 'illama_billing_v.' .. manifestVersion
    
    if resourceName ~= expectedName then
        print('^1[' .. _L('error') .. '] ^7' .. _L('invalid_resource_name'))
        print('^1[' .. _L('error') .. '] ^7' .. _L('expected_name', expectedName))
        print('^1[' .. _L('error') .. '] ^7' .. _L('current_name', resourceName))
        print('^1[' .. _L('error') .. '] ^7' .. _L('manifest_version', manifestVersion))
        print('^1[' .. _L('error') .. '] ^7' .. _L('script_disabled_security'))
        
        DisableScript(expectedName, resourceName)
        return false
    end
    
    scriptEnabled = true
    return true
end

-------------------------------
--     INITIALIZATION
-------------------------------
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if not Config.Webhooks.enabled then return end
    SendWebhook('script_start', {
        society = nil,
        params = {},
        fields = {
            {
                ["name"] = _L('webhook_version'),
                ["value"] = scriptVersion,
                ["inline"] = true
            },
            {
                ["name"] = _L('webhook_framework'),
                ["value"] = 'ESX',
                ["inline"] = true
            }
        }
    })
end)

CreateThread(function()
    Wait(5000)
    StartRecurringBillsThread()
    CheckVersion()
end)

if not ValidateResourceName() then 
    return
end

local ESX = exports["es_extended"]:getSharedObject()

local function CheckScriptEnabled(fn)
    return function(...)
        if not scriptEnabled then
            return
        end
        return fn(...)
    end
end