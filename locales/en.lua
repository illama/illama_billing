Locales['en'] = {
    -------------------
    -- MAIN MENU
    -------------------
    ['billing_menu'] = 'Billing Menu',
    ['open_billing_menu'] = 'Open billing menu',
    
    -- Main sections
    ['personal_bills'] = 'Personal Bills',
    ['personal_bills_desc'] = 'Manage your personal bills',
    ['society_bills'] = 'Business Bills',
    ['society_bills_desc'] = 'Manage business bills',
    ['my_bills'] = 'My Bills',
    ['my_bills_desc'] = 'View received bills',
    ['recurring_bills'] = 'Recurring Bills',
    ['recurring_bills_desc'] = 'Manage your subscriptions and recurring payments',
    ['transaction_history'] = 'Transaction History',
    ['transaction_history_desc'] = 'View history of all your bills',

    -------------------
    -- INDIVIDUAL BILLS
    -------------------
    ['new_bill'] = 'New Bill',
    ['bill_type'] = 'Bill Type',
    ['bill_details'] = 'Bill Details',
    ['bill_number'] = 'Bill #%s',
    ['amount_label'] = 'Amount',
    ['amount_desc'] = 'Enter amount',
    ['reason_label'] = 'Reason',
    ['reason_desc'] = 'Enter reason',
    ['amount'] = 'Amount: $%s',
    ['amount_reason'] = 'Amount: $%s - %s',
    ['reason'] = 'Reason: %s',
    ['bill_from'] = 'Bill from %s',

    -------------------
    -- GROUP BILLS
    -------------------
    ['group_billing'] = 'Group Billing',
    ['group_bill'] = 'Group Bill',
    ['group_bill_desc'] = 'Create a shared bill between multiple people',
    ['group_bill_suffix'] = 'Group Bill',
    ['group_bill_split_equally'] = 'Split equally',
    ['individual_bill'] = 'Individual Bill',
    ['individual_bill_desc'] = 'Create a bill for a single person',
    
    -- Split options
    ['split_type'] = 'Split Type',
    ['split_equal'] = 'Equal Split',
    ['split_percentage'] = 'Percentage Split',
    ['split_amount'] = 'Fixed Amount Split',
    ['total_amount'] = 'Total Amount',
    ['enter_percentages'] = 'Enter percentages',
    ['enter_amounts'] = 'Enter amounts',
    ['percentage_not_100'] = 'Percentages must add up to 100%',
    ['amounts_not_total'] = 'Amounts must add up to the total amount',

    -------------------
    -- SOCIETY BILLS
    -------------------
    ['new_society_bill'] = 'New Business Bill',
    ['society'] = 'Business',
    ['standard_bill'] = 'Standard Bill',
    ['standard_bill_desc'] = 'Create a one-time bill',
    ['select_template'] = 'Choose a template or create a custom bill',
    ['custom_bill'] = 'Custom Bill',
    ['society_payment'] = 'Business Payment',
    ['confirm_society_bill'] = 'Amount: $%s\nReason: %s',

    -------------------
    -- RECURRING BILLS
    -------------------
    ['recurring_bill'] = 'Recurring Bill',
    ['recurring_bill_desc'] = 'Create a monthly/recurring bill',
    ['recurring_bill_number'] = 'Recurring Bill #%s',
    ['new_recurring_bill'] = 'New Recurring Bill',
    ['recurring_payment'] = 'Recurring Payment',
    ['recurring_payment_suffix'] = '(Recurring Payment)',
    
    -- Recurring settings
    ['subscription_type'] = 'Subscription Type',
    ['custom_subscription'] = 'Custom Subscription',
    ['select_subscription_template'] = 'Choose a template or create a custom subscription',
    ['interval_days'] = 'Interval (days)',
    ['interval_days_desc'] = 'Number of days between each payment',
    ['recurring_reason_desc'] = 'Enter reason for recurring billing',
    ['confirm_recurring_bill'] = 'Recurring bill of $%s every %d days for: %s',

    -------------------
    -- PAYMENTS
    -------------------
    -- Payment methods
    ['payment_method'] = 'Payment method: %s',
    ['cash'] = 'Cash',
    ['bank'] = 'Bank',
    ['pay_cash'] = 'Pay with cash',
    ['pay_bank'] = 'Pay by bank',
    ['pay_amount_cash'] = 'Pay $%s in cash',
    ['pay_amount_bank'] = 'Pay $%s by bank',
    
    -- Advance payments
    ['advance_payment'] = 'Advance Payment',
    ['pay_advance'] = 'Pay in advance',
    ['pay_advance_desc'] = 'Pay multiple installments in advance',
    ['payment_amount'] = 'Amount per payment',
    ['payment_amount_desc'] = 'Enter the amount for each payment',
    ['amount_per_payment'] = 'Amount per payment',
    ['confirm_advance_payment'] = 'Total to pay: $%s for %d payments by %s',

    -- Counters and amounts
    ['payment_count'] = 'Number of payments: %d',
    ['payments_count'] = 'Number of payments',
    ['payments_count_desc'] = '%d payment%s',
    ['payment_count_desc'] = 'Choose number of payments to make in advance',
    ['total_to_pay'] = 'Total to pay: $%s',
    
    -- History and confirmations
    ['payment_history'] = 'Payment History',
    ['payment_history_desc'] = 'View payment history',
    ['confirm_payment'] = 'Confirm Payment',
    ['payment_received'] = 'You received $%s from %s',
    ['payment_made'] = 'You paid $%s to %s',
    ['payment_made_society'] = 'You paid $%s to %s',
    ['payment_made_player'] = 'You paid $%s to %s',
    ['bill_paid_amount'] = 'Bill of $%s paid',

    -------------------
    -- STATUS AND TIME
    -------------------
    ['status'] = 'Status',
    ['active'] = 'Active',
    ['inactive'] = 'Inactive',
    ['next_payment'] = 'Next payment',
    ['today'] = 'Today',
    ['tomorrow'] = 'Tomorrow',
    ['days_remaining'] = 'In %d days',
    ['days_count'] = '%d days',
    ['interval'] = '%d days',
    ['in_days'] = 'In %d days',
    ['undefined'] = 'Undefined',
    ['plural_s'] = 's',

    -------------------
    -- HISTORY
    -------------------
    ['from'] = 'from',
    ['to'] = 'to',
    ['type'] = 'Type',
    ['personal'] = 'Personal',
    ['bill_history_title'] = '%s Bill %s %s',
    ['no_history'] = 'No history',
    ['no_history_desc'] = 'You have no bills in history',
    ['no_payments'] = 'No payments',
    ['no_payments_desc'] = 'No payments have been made yet',
    ['no_bills'] = 'No bills',
    ['no_bills_desc'] = 'No bills have been made yet',
    
    -------------------
    -- ACTIONS AND BUTTONS
    -------------------
    ['accept'] = 'Accept',
    ['refuse'] = 'Refuse',
    ['accept_bill_desc'] = 'Accept this bill',
    ['refuse_bill_desc'] = 'Refuse this bill',
    ['accept_recurring_desc'] = 'Accept this recurring bill',
    ['refuse_recurring_desc'] = 'Refuse this recurring bill',
    ['select_player'] = 'Select a player',
    ['select_players'] = 'Select players',
    ['select_min_players'] = 'Select at least 2 players',
    ['select_billing_type'] = 'Billing type',
    ['confirmation'] = 'Confirmation',
    ['delete_bill'] = 'Delete bill',
    ['cancel_subscription'] = 'Cancel subscription',
    ['cancel_subscription_desc'] = 'Cancel this subscription',
    ['confirm_delete_bill'] = 'Are you sure you want to delete this bill?',
    ['confirm_cancel_subscription'] = 'Are you sure you want to cancel this subscription?',

    -------------------
    -- NOTIFICATIONS AND ERRORS
    -------------------
    -- Success
    ['success'] = 'Success',
    ['bills_created'] = 'Bills have been created',
    ['bill_accepted'] = 'Bill accepted',
    ['bill_accepted_desc'] = 'You have accepted the bill',
    ['bill_accepted_by_receiver'] = 'Bill accepted',
    ['recurring_bill_accepted'] = 'Recurring bill accepted',
    ['recurring_bill_setup'] = 'Recurring billing has been set up',
    ['recurring_setup_success'] = 'Recurring billing has been set up',
    ['bill_request_sent'] = 'Bill request sent',
    ['recurring_bill_request_sent'] = 'Recurring bill request sent',
    ['bill_deleted'] = 'Bill successfully deleted',
    ['subscription_cancelled'] = 'Subscription cancelled',

    -- Errors
    ['error'] = 'Error',
    ['insufficient_rights'] = 'You don\'t have the necessary rights',
    ['cannot_load_data'] = 'Unable to load your data',
    ['no_nearby_players'] = 'No nearby players',
    ['need_multiple_players'] = 'At least 2 nearby players are needed to create a group bill',
    ['invalid_amount'] = 'Amount must be greater than 0',
    ['invalid_interval'] = 'Invalid interval (1-365 days)',
    ['insufficient_funds'] = 'You don\'t have enough money (missing $%s)',
    ['bill_already_paid'] = 'This bill doesn\'t exist or has already been paid',
    ['bill_inactive'] = 'This bill is no longer active',
    ['bill_refused'] = 'Bill Refused',
    ['bill_refused_desc'] = 'You have refused the bill',
    ['bill_refused_by_receiver'] = 'The recipient has refused the bill',
    ['bill_expired'] = 'Bill Expired',
    ['bill_expired_desc'] = 'The bill has expired',
    ['bill_deleted_amount'] = 'A bill of $%s has been deleted',
    ['recurring_cancelled'] = 'A recurring bill has been cancelled due to inactivity',
    ['recurring_cancelled_inactivity'] = 'The subscription has been cancelled due to inactivity',
    ['player_disconnected_recurring'] = 'Player has disconnected, recurring bill cancelled',
    ['player_disconnected_bill'] = 'Player has disconnected, bill cancelled',

    -------------------
    -- SYSTEM MESSAGES
    -------------------
    ['distance'] = '%d meters',
    ['version_read_error'] = '^1[illama_billing] Unable to read version from fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Unable to check version on GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Error reading GitHub version^7',
    ['new_version_available'] = '^3[illama_billing] A new version is available!^7',
    ['current_version'] = '^3[illama_billing] Current version: ^7%s',
    ['latest_version'] = '^3[illama_billing] Latest version: ^7%s',
    ['release_notes'] = '^3[illama_billing] Release notes: ^7%s',
    ['changes_list'] = '^3[illama_billing] Changes: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Script is up to date (v%s)^7',
}