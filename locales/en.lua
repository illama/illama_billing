Locales['en'] = {
    -------------------
    -- MAIN MENU
    -------------------
    ['billing_menu'] = 'Billing Menu',
    ['open_billing_menu'] = 'Open the billing menu',
    
    -- Main sections
    ['personal_bills'] = 'Personal Bills',
    ['personal_bills_desc'] = 'Create personal bills',
    ['society_bills'] = 'Company Bills',
    ['society_bills_desc'] = 'Create company bills',
    ['my_bills'] = 'My Bills',
    ['my_bills_desc'] = 'View received bills',
    ['recurring_bills'] = 'Recurring Bills',
    ['recurring_bills_desc'] = 'Manage your subscriptions and recurring payments',
    ['transaction_history'] = 'Transaction History',
    ['transaction_history_desc'] = 'View all your bill history',
    ['my_recurring_bills'] = 'My Recurring Bills',

    -------------------
    -- INDIVIDUAL BILLS
    -------------------
    ['new_bill'] = 'New Bill',
    ['bill_type'] = 'Bill Type',
    ['bill_details'] = 'Bill Details',
    ['bill_number'] = 'Bill #%s',
    ['amount_label'] = 'Amount',
    ['amount_desc'] = 'Enter the amount',
    ['reason_label'] = 'Reason',
    ['reason_desc'] = 'Enter the reason',
    ['amount'] = 'Amount: $%s',
    ['amount_reason'] = 'Amount: $%s - %s',
    ['amount_and_reason'] = 'Amount: $%s - %s',
    ['reason'] = 'Reason: %s',
    ['bill_from'] = 'Bill from %s',
    ['standard_bill'] = 'Standard Bill',
    ['check_bills'] = 'Check Bills',
    ['check_bills_desc'] = 'Check ongoing bills',
    ['select_player_check'] = 'Select a player to check',
    ['bills_status'] = 'Bills Status',

    -------------------
    -- GROUP BILLS
    -------------------
    ['group_billing'] = 'Group Billing',
    ['group_bill'] = 'Group Bill',
    ['group_bill_desc'] = 'Create a shared bill among multiple people',
    ['group_bill_suffix'] = 'Group Bill',
    ['group_bill_split_equally'] = 'Equal Split',
    ['individual_bill'] = 'Individual Bill',
    ['individual_bill_desc'] = 'Create a bill for a single person',
    
    -- Splitting options
    ['split_type'] = 'Split Type',
    ['split_equal'] = 'Equal Split',
    ['split_percentage'] = 'Percentage Split',
    ['split_amount'] = 'Fixed Amount Split',
    ['total_amount'] = 'Total Amount',
    ['enter_percentages'] = 'Enter percentages',
    ['enter_amounts'] = 'Enter amounts',
    ['percentage_not_100'] = 'The sum of percentages must equal 100%',
    ['amounts_not_total'] = 'The sum of amounts must equal the total amount',
    ['percentage_split'] = 'Percentage Split',
    ['custom_split'] = 'Custom Split',
    ['equal_split'] = 'Equal Split',
    ['remaining_percentage'] = '%s - %d%% remaining',
    ['remaining_amount'] = '%s - $%s remaining',
    ['enter_percentage_per_player'] = 'Enter the percentage for each player',
    ['enter_amount_per_player'] = 'Enter the amount for each player',
    -- Installment Payment - Menus and notifications
    ['pay_installments'] = 'Pay in installments',
    ['pay_installments_desc'] = 'Split payment over several weeks',
    ['installment_setup'] = 'Installment Payment Setup',
    ['number_of_payments'] = 'Number of payments',
    ['max_5_payments'] = 'Maximum 5 payments (1 per week)',
    ['confirm_installment_plan'] = 'Confirm Payment Plan',
    ['payment_plan'] = 'Payment Plan: %s',
    ['installment_status'] = '%d payments remaining out of %d\nAmount per payment: $%s',
    ['installment_details'] = 'Payment plan in %d installments\nAmount per payment: $%s\nTotal amount: $%s',
    ['payment_plan_created'] = 'Installment payment plan created successfully',
    ['bill_accepted_with_installments'] = 'Bill accepted with installment payment',
    ['allow_installments'] = 'Allow installment payments',
    ['allow_installments_desc'] = 'Allow installment payments for this bill',

    -- Installment Payments Menu
    ['installment_payments'] = 'Installment Payments',
    ['view_payment_plans'] = 'View my active payment plans',
    ['my_payment_plans'] = 'My Installment Payments',
    ['payment_plan'] = 'Payment Plan: %s',
    ['no_installment_payments'] = 'No Installment Payments',
    ['no_active_payment_plans'] = 'You have no active payment plans',
    ['total_remaining'] = 'Total amount remaining',

    -- Automatic Payment Notifications
    ['installment_payment'] = 'Installment Payment',
    ['payment_processed'] = 'Payment of $%s automatically processed',
    ['payment_failed'] = 'Payment Failed',
    ['insufficient_funds_installment'] = 'Insufficient funds for installment payment',

    -------------------
    -- COMPANY BILLS
    -------------------
    ['new_society_bill'] = 'New Company Bill',
    ['society'] = 'Company',
    ['standard_bill'] = 'Standard Bill',
    ['standard_bill_desc'] = 'Create a one-time bill',
    ['select_template'] = 'Choose a template or create a custom bill',
    ['custom_bill'] = 'Custom Bill',
    ['society_payment'] = 'Company Payment',
    ['confirm_society_bill'] = 'Amount: $%s\nReason: %s',
    ['society_bill'] = 'Company',

    -------------------
    -- RECURRING BILLS
    -------------------
    ['recurring_bill'] = 'Recurring Bill',
    ['recurring_bill_desc'] = 'Create a monthly/recurring bill',
    ['recurring_bill_number'] = 'Recurring Bill #%s',
    ['new_recurring_bill'] = 'New Recurring Bill',
    ['recurring_payment'] = 'Recurring Payment',
    ['recurring_payment_suffix'] = '(Recurring Payment)',
    ['no_recurring_bills'] = 'No Recurring Bills',
    ['no_recurring_bills_desc'] = 'You have no recurring bills',
    ['bill_interval'] = 'Interval',
    
    -- Recurring settings
    ['subscription_type'] = 'Subscription Type',
    ['custom_subscription'] = 'Custom Subscription',
    ['select_subscription_template'] = 'Choose a template or create a custom subscription',
    ['interval_days'] = 'Interval (days)',
    ['interval_days_desc'] = 'Number of days between each payment',
    ['interval_days_format'] = '%d days',
    ['recurring_reason_desc'] = 'Enter the reason for recurring billing',
    ['confirm_recurring_bill'] = 'Recurring bill of $%s every %d days for: %s',
    ['accept_recurring_payment'] = 'Accept recurring payment of $%s every %d days',

    -------------------
    -- PAYMENTS
    -------------------
    -- Payment methods
    ['payment_method'] = 'Payment Method: %s',
    ['cash'] = 'Cash',
    ['bank'] = 'Bank',
    ['pay_cash'] = 'Pay with cash',
    ['pay_bank'] = 'Pay by bank',
    ['pay_amount_cash'] = 'Pay $%s in cash',
    ['pay_amount_bank'] = 'Pay $%s via bank',
    ['pay_amount'] = 'Pay $%s',
    
    -- Advance payments
    ['advance_payment'] = 'Advance Payment',
    ['pay_advance'] = 'Pay in advance',
    ['pay_advance_desc'] = 'Pay several installments in advance',
    ['payment_amount'] = 'Payment Amount',
    ['payment_amount_desc'] = 'Enter the amount of each payment',
    ['amount_per_payment'] = 'Amount per payment',
    ['confirm_advance_payment'] = 'Total to pay: $%s for %d payments by %s',
    ['payment_confirmation'] = 'Payment Confirmation',

    -- Counters and amounts
    ['payment_count'] = 'Number of payments: %d',
    ['payments_count'] = 'Number of payments',
    ['payments_count_desc'] = '%d payment(s)',
    ['payment_count_desc'] = 'Choose the number of payments to make in advance',
    ['payments_count_label'] = 'Number of payments',
    ['total_to_pay'] = 'Total to pay: $%s',
    
    -- History and confirmations
    ['payment_history'] = 'Payment History',
    ['payment_history_desc'] = 'View payment history',
    ['payment_history_title'] = 'Payment History',
    ['confirm_payment'] = 'Confirm Payment',
    ['payment_received'] = 'You received $%s from %s',
    ['payment_made'] = 'You paid $%s to %s',
    ['payment_made_society'] = 'You paid $%s to %s',
    ['payment_made_player'] = 'You paid $%s to %s',
    ['bill_paid_amount'] = 'Bill of $%s paid',
    ['payment_amount'] = 'Payment of $%s',

    -------------------
    -- STATUSES AND TIME
    -------------------
    ['status'] = 'Status',
    ['status_label'] = 'Status',
    ['active'] = 'Active',
    ['inactive'] = 'Inactive',
    ['pending'] = 'Pending',
    ['paid'] = 'Paid',
    ['deleted'] = 'Deleted',
    ['next_payment'] = 'Next Payment',
    ['next_payment_label'] = 'Next Payment',
    ['today'] = 'Today',
    ['tomorrow'] = 'Tomorrow',
    ['days_remaining'] = 'In %d days',
    ['days_count'] = '%d days',
    ['interval'] = '%d days',
    ['interval_label'] = 'Interval',
    ['in_days'] = 'In %d days',
    ['undefined'] = 'Undefined',
    ['plural_s'] = 's',
    ['days'] = 'days',

    -------------------
    -- HISTORY
    -------------------
    ['from'] = 'From',
    ['to'] = 'To',
    ['type'] = 'Type',
    ['type_label'] = 'Type',
    ['from_label'] = 'From',
    ['to_label'] = 'To',
    ['personal'] = 'Personal',
    ['personal_bill'] = 'Personal',
    ['bill_history_title'] = '%s Bill %s %s',
    ['no_history'] = 'No history',
    ['no_history_desc'] = 'You have no bill in history',
    ['no_payments'] = 'No payments',
    ['no_payments_desc'] = 'No payment has been made yet',
    ['no_bills'] = 'No bills',
    ['no_bills_desc'] = 'No bills have been issued yet',
    
    -------------------
    -- ACTIONS AND BUTTONS
    -------------------
    ['accept'] = 'Accept',
    ['refuse'] = 'Refuse',
    ['accept_bill'] = 'Accept the bill',
    ['accept_bill_desc'] = 'Accept this bill',
    ['accept_subscription'] = 'Accept subscription',
    ['refuse_bill'] = 'Refuse the bill',
    ['refuse_bill_desc'] = 'Refuse this bill',
    ['refuse_subscription'] = 'Refuse subscription',
    ['accept_recurring_desc'] = 'Accept this recurring bill',
    ['refuse_recurring_desc'] = 'Refuse this recurring bill',
    ['select_player'] = 'Select a player',
    ['select_players'] = 'Select players',
    ['select_min_players'] = 'Select at least 2 players',
    ['select_billing_type'] = 'Billing Type',
    ['confirmation'] = 'Confirmation',
    ['delete_bill'] = 'Delete the bill',
    ['delete_bill_desc'] = 'A deletion confirmation will be requested.',
    ['cancel_subscription'] = 'Cancel subscription',
    ['cancel_subscription_desc'] = 'Cancel this subscription',
    ['confirm_delete_bill'] = 'Are you sure you want to delete this bill?',
    ['confirm_cancel_subscription'] = 'Are you sure you want to cancel this subscription?',
    ['unknown_player'] = 'Unknown',
    ['close'] = 'Close',
    ['info'] = 'Information',
    ['click_to_export'] = 'Click on an invoice to view it',

    -------------------
    -- NOTIFICATIONS AND ERRORS
    -------------------
    -- Success
    ['success'] = 'Success',
    ['bills_created'] = 'The bills have been created',
    ['bill_accepted'] = 'Bill accepted',
    ['bill_accepted_desc'] = 'You accepted the bill',
    ['bill_accepted_by_receiver'] = 'Bill accepted',
    ['recurring_bill_accepted'] = 'Recurring bill accepted',
    ['recurring_bill_setup'] = 'Recurring billing has been set up',
    ['recurring_setup_success'] = 'Recurring billing has been configured',
    ['bill_request_sent'] = 'Bill request sent',
    ['recurring_bill_request_sent'] = 'Recurring bill request sent',
    ['bill_deleted'] = 'Bill successfully deleted',
    ['subscription_cancelled'] = 'Subscription canceled',

    -- Errors
    ['error'] = 'Error',
    ['insufficient_rights'] = 'You do not have sufficient rights',
    ['cannot_load_data'] = 'Unable to load your data',
    ['no_nearby_players'] = 'No nearby players',
    ['need_multiple_players'] = 'At least 2 nearby players are required to create a group bill',
    ['invalid_amount'] = 'The amount must be greater than 0',
    ['invalid_interval'] = 'Invalid interval (1-365 days)',
    ['insufficient_funds'] = 'You do not have enough money (missing $%s)',
    ['bill_already_paid'] = 'This bill does not exist or has already been paid',
    ['bill_inactive'] = 'This bill is no longer active',
    ['bill_refused'] = 'Bill Refused',
    ['bill_refused_desc'] = 'You refused the bill',
    ['bill_refused_by_receiver'] = 'The recipient refused the bill',
    ['bill_expired'] = 'Bill Expired',
    ['bill_expired_desc'] = 'The bill has expired',
    ['bill_deleted_amount'] = 'A bill of $%s has been deleted',
    ['recurring_cancelled'] = 'A recurring bill has been canceled due to inactivity',
    ['recurring_cancelled_inactivity'] = 'The subscription has been canceled due to inactivity',
    ['player_disconnected_recurring'] = 'The player disconnected, recurring bill canceled',
    ['player_disconnected_bill'] = 'The player disconnected, bill canceled',

    -------------------
    -- SYSTEM MESSAGES
    -------------------
    ['distance'] = '%d meters',
    ['version_read_error'] = '^1[illama_billing] Unable to read the version in fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Unable to check the version on GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Error reading GitHub version^7',
    ['new_version_available'] = '^3[illama_billing] A new version is available!^7',
    ['current_version'] = '^3[illama_billing] Current version: ^7%s',
    ['latest_version'] = '^3[illama_billing] Latest version: ^7%s',
    ['release_notes'] = '^3[illama_billing] Release notes: ^7%s',
    ['changes_list'] = '^3[illama_billing] Changes: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] The script is up to date (v%s)^7',
    ['system_disabled_title'] = 'Billing System Disabled',
    ['system_disabled_desc'] = 'The system is disabled due to a configuration error',
    ['system_error'] = 'System Error',
    ['system_disabled_contact_admin'] = 'The billing system is disabled.\nPlease contact an administrator',
    ['feature_disabled'] = 'This feature is disabled',

    -------------------
    -- TAG SYSTEM
    -------------------
    ['filter_by_tags'] = 'Filter by Tags',
    ['filter_tags_desc'] = 'Filter bills by their tags',
    ['manage_tags'] = 'Manage Tags',
    ['manage_tags_desc'] = 'Add or remove tags for this bill',
    ['add_tag'] = 'Add Tag',
    ['add_tag_desc'] = 'Enter a new tag for this bill',
    ['tag_placeholder'] = 'e.g., Important, Personal, Work',
    ['tag_added'] = 'Tag added successfully',
    ['show_all'] = 'Show All Bills',
    ['show_all_desc'] = 'Remove tag filters',
    ['filter_by_tag_desc'] = 'Show bills with this tag',
    ['current_filter'] = 'Current Filter',
    ['filtered_by_tag'] = 'Showing bills tagged with: %s',
    ['change_filter'] = 'Change Filter',
    ['change_filter_desc'] = 'Select a different tag to filter by',
    ['filtered_transaction_history'] = 'Filtered Transaction History',
    ['no_bills_found'] = 'No Bills Found',
    ['no_bills_with_tag'] = 'No bills found with tag: %s',
    ['bill_actions'] = 'Bill Actions',
    ['no_tags'] = 'No Tags',
    ['no_tags_desc'] = 'No tags have been added to this bill',
    ['add_new_tag'] = 'Add New Tag',
    ['remove_tag_desc'] = 'Click to remove this tag',
    ['tag_removed'] = 'Tag removed successfully',
    ['tag_name'] = 'Tag Name',
    ['tag_name_desc'] = 'Enter the name of the new tag',
    ['export_bill'] = 'Export Bill',
    ['export_bill_desc'] = 'Export bill as an image',

    -------------------
    -- SECURITY
    -------------------
    ['billing_system_error'] = 'ERROR - BILLING SYSTEM',
    ['error'] = 'ERROR',
    ['script_disabled_wrong_name'] = 'Script is disabled because the resource name is incorrect!',
    ['expected_name'] = 'Expected name: ^3%s^7',
    ['current_name'] = 'Current name: ^3%s^7',
    ['rename_folder_instruction'] = 'Please rename the folder to reactivate the script.',
    ['contact_support'] = 'Contact support if you need help.',
    ['invalid_resource_name'] = 'Invalid resource name!',
    ['manifest_version'] = 'Manifest version: %s',
    ['script_disabled_security'] = 'Script is disabled for security reasons.',
}