Locales['en'] = {
    -------------------
    -- MAIN MENU
    -------------------
    ['billing_menu'] = 'Billing Menu',
    ['open_billing_menu'] = 'Open billing menu',
    
    -- Main sections
    ['personal_bills'] = 'Personal Bills',
    ['personal_bills_desc'] = 'Manage your personal bills',
    ['society_bills'] = 'Company Bills',
    ['society_bills_desc'] = 'Manage company bills',
    ['my_bills'] = 'My Bills',
    ['my_bills_desc'] = 'View received bills',
    ['recurring_bills'] = 'Subscriptions',
    ['recurring_bills_desc'] = 'Manage your subscriptions',
    ['transaction_history'] = 'Transaction History',
    ['transaction_history_desc'] = 'View history of all your bills',
    ['my_recurring_bills'] = 'My subscriptions',

    -------------------
    -- INDIVIDUAL BILLS
    -------------------
    ['new_bill'] = 'New Bill',
    ['bill_type'] = 'Bill type',
    ['bill_details'] = 'Bill details',
    ['bill_number'] = 'Bill #%s',
    ['amount_label'] = 'Amount',
    ['amount_desc'] = 'Enter amount',
    ['reason_label'] = 'Reason',
    ['reason_desc'] = 'Enter reason',
    ['amount'] = 'Amount: $%s',
    ['amount_reason'] = 'Amount: $%s - %s',
    ['amount_and_reason'] = 'Amount: $%s - %s',
    ['reason'] = 'Reason: %s',
    ['bill_from'] = 'Bill from %s',
    ['standard_bill'] = 'Standard bill',
    ['check_bills'] = 'Check bills',
    ['check_bills_desc'] = 'Check current bills',
    ['select_player_check'] = 'Select player to check',
    ['bills_status'] = 'Bills status',

    -------------------
    -- GROUP BILLS
    -------------------
    ['group_billing'] = 'Group bill',
    ['group_bill'] = 'Group bill',
    ['group_bill_desc'] = 'Create a shared bill between multiple people',
    ['group_bill_suffix'] = 'Group bill',
    ['group_bill_split_equally'] = 'Equal split',
    ['individual_bill'] = 'Individual bill',
    ['individual_bill_desc'] = 'Create a bill for a single person',
    
    -- Split
    ['split_type'] = 'Split type',
    ['split_equal'] = 'Equal split',
    ['split_percentage'] = 'Percentage split',
    ['split_amount'] = 'Fixed amount split',
    ['total_amount'] = 'Total amount',
    ['enter_percentages'] = 'Enter percentages',
    ['enter_amounts'] = 'Enter amounts',
    ['percentage_not_100'] = 'Sum of percentages must equal 100%',
    ['amounts_not_total'] = 'Sum of amounts must equal total amount',
    ['percentage_split'] = 'Split by %',
    ['custom_split'] = 'Custom split',
    ['equal_split'] = 'Equal split',
    ['remaining_percentage'] = '%s - %d%% remaining',
    ['remaining_amount'] = '%s - $%s remaining',
    ['enter_percentage_per_player'] = 'Enter percentage for each player',
    ['enter_amount_per_player'] = 'Enter amount for each player',

    -- Installment payment - Menus and notifications
    ['pay_installments'] = 'Pay in installments',
    ['pay_installments_desc'] = 'Split payment over several weeks',
    ['installment_setup'] = 'Installment payment setup',
    ['number_of_payments'] = 'Number of payments',
    ['max_5_payments'] = 'Maximum 5 payments (1 per week)',
    ['confirm_installment_plan'] = 'Confirm payment plan',
    ['payment_plan'] = 'Payment plan: %s',  -- 1 argument
    ['installment_status'] = '%d payments remaining out of %d\nAmount per payment: $%s', -- 3 arguments
    ['installment_details'] = 'Payment plan in %d installments\nAmount per payment: $%s\nTotal amount: $%s', -- 3 arguments
    ['payment_plan_created'] = 'Installment payment plan created successfully',
    ['bill_accepted_with_installments'] = 'Bill has been accepted with installment payment',

    -- Installment payments menu
    ['installment_payments'] = 'Installment payments',
    ['view_payment_plans'] = 'View my current payment plans',
    ['my_payment_plans'] = 'My installment payments',
    ['payment_plan'] = 'Payment plan: %s',
    ['no_installment_payments'] = 'No installment payments',
    ['no_active_payment_plans'] = 'You have no active payment plans',
    ['total_remaining'] = 'Remaining amount to pay',
    ['allow_installments'] = 'Allow installment payments',
    ['allow_installments_desc'] = 'Allow installment payments for this bill',

    -- Automatic payment notifications
    ['installment_payment'] = 'Installment payment',
    ['payment_processed'] = 'Payment of $%s automatically deducted',
    ['payment_failed'] = 'Payment failed',
    ['insufficient_funds_installment'] = 'Insufficient funds for installment payment',

    -------------------
    -- COMPANY BILLS
    -------------------
    ['new_society_bill'] = 'New Company Bill',
    ['society'] = 'Company',
    ['standard_bill'] = 'Standard Bill',
    ['standard_bill_desc'] = 'Create a single bill',
    ['select_template'] = 'Choose a template or create a custom bill',
    ['custom_bill'] = 'Custom Bill',
    ['society_payment'] = 'Company Payment',
    ['confirm_society_bill'] = 'Amount: $%s\nReason: %s',
    ['society_bill'] = 'Company',

    -------------------
    -- RECURRING BILLS
    -------------------
    ['recurring_bill'] = 'Subscriptions',
    ['recurring_bill_desc'] = 'Create a subscription',
    ['recurring_bill_number'] = 'Subscription #%s',
    ['new_recurring_bill'] = 'New subscription',
    ['recurring_payment'] = 'Subscription payment',
    ['recurring_payment_suffix'] = '(Subscription payment)',
    ['no_recurring_bills'] = 'No subscriptions',
    ['no_recurring_bills_desc'] = 'You have no subscriptions',
    ['bill_interval'] = 'Interval',
    
    -- Recurring settings
    ['subscription_type'] = 'Subscription type',
    ['custom_subscription'] = 'Custom Subscription',
    ['select_subscription_template'] = 'Choose a template or create a custom subscription',
    ['interval_days'] = 'Interval (days)',
    ['interval_days_desc'] = 'Number of days between each payment',
    ['interval_days_format'] = '%d days',
    ['recurring_reason_desc'] = 'Enter reason for subscription billing',
    ['confirm_recurring_bill'] = 'Subscription of $%s every %d days for: %s',
    ['accept_recurring_payment'] = 'Accept subscription of $%s every %d days',

    -------------------
    -- PAYMENTS
    -------------------
    -- Payment methods
    ['payment_method'] = 'Payment method: %s',
    ['cash'] = 'Cash',
    ['bank'] = 'Bank',
    ['pay_cash'] = 'Pay in cash',
    ['pay_bank'] = 'Pay by bank',
    ['pay_amount_cash'] = 'Pay $%s in cash',
    ['pay_amount_bank'] = 'Pay $%s by bank',
    ['pay_amount'] = 'Pay $%s',
    
    -- Advance payments
    ['advance_payment'] = 'Advance payment',
    ['pay_advance'] = 'Pay in advance',
    ['pay_advance_desc'] = 'Pay multiple installments in advance',
    ['payment_amount'] = 'Amount per payment',
    ['payment_amount_desc'] = 'Enter amount for each payment',
    ['amount_per_payment'] = 'Amount per payment',
    ['confirm_advance_payment'] = 'Total to pay: $%s for %d payments by %s',
    ['payment_confirmation'] = 'Payment confirmation',

    -- Counters and amounts
    ['payment_count'] = 'Number of payments: %d',
    ['payments_count'] = 'Number of payments',
    ['payments_count_desc'] = '%d payment%s',
    ['payment_count_desc'] = 'Choose number of payments to make in advance',
    ['payments_count_label'] = 'Number of payments',
    ['total_to_pay'] = 'Total to pay: $%s',
    
    -- History and confirmations
    ['payment_history'] = 'Payment history',
    ['payment_history_desc'] = 'View payment history',
    ['payment_history_title'] = 'Payment History',
    ['confirm_payment'] = 'Confirm payment',
    ['payment_received'] = 'You received $%s from %s',
    ['payment_made'] = 'You paid $%s to %s',
    ['payment_made_society'] = 'You paid $%s to %s',
    ['payment_made_player'] = 'You paid $%s to %s',
    ['bill_paid_amount'] = 'Bill of $%s paid',
    ['payment_amount'] = 'Payment of $%s',

    -------------------
    -- STATUS AND TIME
    -------------------
    ['status'] = 'Status',
    ['status_label'] = 'Status',
    ['active'] = 'Active',
    ['inactive'] = 'Inactive',
    ['pending'] = 'Pending',
    ['paid'] = 'Paid',
    ['deleted'] = 'Deleted',
    ['next_payment'] = 'Next payment',
    ['next_payment_label'] = 'Next payment',
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
    ['from'] = 'from',
    ['to'] = 'to',
    ['type'] = 'Type',
    ['type_label'] = 'Type',
    ['from_label'] = 'From',
    ['to_label'] = 'To',
    ['personal'] = 'Personal',
    ['personal_bill'] = 'Personal',
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
    ['accept_bill'] = 'Accept bill',
    ['accept_bill_desc'] = 'Accept this bill',
    ['accept_subscription'] = 'Accept subscription',
    ['refuse_bill'] = 'Refuse bill',
    ['refuse_bill_desc'] = 'Refuse this bill',
    ['refuse_subscription'] = 'Refuse subscription',
    ['accept_recurring_desc'] = 'Accept this subscription',
    ['refuse_recurring_desc'] = 'Refuse this subscription',
    ['select_player'] = 'Select player',
    ['select_players'] = 'Select players',
    ['select_min_players'] = 'Select at least 2 players',
    ['select_billing_type'] = 'Bill type',
    ['confirmation'] = 'Confirmation',
    ['delete_bill'] = 'Delete bill',
    ['delete_bill_desc'] = 'A deletion confirmation will be requested.',
    ['cancel_subscription'] = 'Cancel subscription',
    ['cancel_subscription_desc'] = 'Cancel this subscription',
    ['confirm_delete_bill'] = 'Are you sure you want to delete this bill?',
    ['confirm_cancel_subscription'] = 'Are you sure you want to cancel this subscription?',
    ['unknown_player'] = 'Unknown',
    ['close'] = 'Close',
    ['info'] = 'Information',
    ['click_to_export'] = 'Click on a bill to view it',
    ['require_signature'] = 'Signature required',
    ['require_signature_desc'] = 'Request a signature for this bill',
    ['signature_required'] = 'Signature required',
    ['enter_signature'] = 'Your signature',
    ['signature_desc'] = 'Please sign to confirm the bill',
    ['signature_placeholder'] = 'Your signature here',
    ['signature'] = 'Signature',
    ['not_signed'] = 'Not signed',
    ['signed_by'] = 'Signed by',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- NOTIFICATIONS AND ERRORS
    -------------------
    -- Success
    ['success'] = 'Success',
    ['bills_created'] = 'Bills have been created',
    ['bill_accepted'] = 'Bill accepted',
    ['bill_accepted_desc'] = 'You have accepted the bill',
    ['bill_accepted_by_receiver'] = 'Bill accepted',
    ['recurring_bill_accepted'] = 'Subscription accepted',
    ['recurring_bill_setup'] = 'Subscription billing has been set up',
    ['recurring_setup_success'] = 'Subscription has been set up',
    ['bill_request_sent'] = 'Bill request sent',
    ['recurring_bill_request_sent'] = 'Subscription bill request sent',
    ['bill_deleted'] = 'Bill deleted successfully',
    ['subscription_cancelled'] = 'Subscription cancelled',

    -- Errors
    ['error'] = 'Error',
    ['insufficient_rights'] = 'You don\'t have the necessary rights',
    ['cannot_load_data'] = 'Unable to load your data',
    ['no_nearby_players'] = 'No players nearby',
    ['need_multiple_players'] = 'At least 2 players nearby are needed to create a group bill',
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
    ['recurring_cancelled'] = 'A subscription has been cancelled due to inactivity',
    ['recurring_cancelled_inactivity'] = 'The subscription has been cancelled due to inactivity',
    ['player_disconnected_recurring'] = 'Player disconnected, subscription bill cancelled',
    ['player_disconnected_bill'] = 'Player disconnected, bill cancelled',
    ['invalid_description'] = 'Description can only contain letters and spaces',

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
    ['system_disabled_title'] = 'Billing System Disabled',
    ['system_disabled_desc'] = 'System is disabled due to a configuration error',
    ['system_error'] = 'System Error',
    ['system_disabled_contact_admin'] = 'Billing system is disabled.\nContact an administrator',
    ['feature_disabled'] = 'This feature is disabled',

    -------------------
    -- TAG SYSTEM
    -------------------
    ['filter_by_tags'] = 'Filter by tags',
    ['filter_tags_desc'] = 'Filter bills by tags',
    ['manage_tags'] = 'Manage tags',
    ['manage_tags_desc'] = 'Add or remove tags for this bill',
    ['add_tag'] = 'Add tag',
    ['add_tag_desc'] = 'Enter a new tag for this bill',
    ['tag_placeholder'] = 'e.g., Important, Personal, Work',
    ['tag_added'] = 'Tag added successfully',
    ['show_all'] = 'Show all bills',
    ['show_all_desc'] = 'Remove tag filters',
    ['filter_by_tag_desc'] = 'Show bills with this tag',
    ['current_filter'] = 'Current filter',
    ['filtered_by_tag'] = 'Showing bills tagged with: %s',
    ['change_filter'] = 'Change filter',
    ['change_filter_desc'] = 'Select another tag to filter',
    ['filtered_transaction_history'] = 'Filtered transaction history',
    ['no_bills_found'] = 'No bills found',
    ['no_bills_with_tag'] = 'No bills found with tag: %s',
    ['bill_actions'] = 'Bill actions',
    ['no_tags'] = 'No tags',
    ['no_tags_desc'] = 'No tags have been added to this bill',
    ['add_new_tag'] = 'Add new tag',
    ['remove_tag_desc'] = 'Click to remove this tag',
    ['tag_removed'] = 'Tag removed successfully',
    ['tag_name'] = 'Tag name',
    ['tag_name_desc'] = 'Enter the name of the new tag',
    ['export_bill'] = 'Export bill',
    ['export_bill_desc'] = 'Export bill as image',

    -------------------
    -- SECURITY
    -------------------
    ['billing_system_error'] = 'ERROR - BILLING SYSTEM',
    ['error'] = 'ERROR',
    ['script_disabled_wrong_name'] = 'Script is disabled because resource name is incorrect!',
    ['expected_name'] = 'Expected name: ^3%s^7',
    ['current_name'] = 'Current name: ^3%s^7',
    ['rename_folder_instruction'] = 'Please rename the folder to reactivate the script.',
    ['contact_support'] = 'Contact support if you need help.',
    ['invalid_resource_name'] = 'Invalid resource name!',
    ['manifest_version'] = 'Manifest version: %s',
    ['script_disabled_security'] = 'Script is disabled for security reasons.',

    ['webhook_bot_name'] = 'Billing System',
    ['webhook_footer'] = 'Sent on %s',
    
    -- Webhooks - Titles
    ['webhook_bill_created_title'] = '📥 New Bill',
    ['webhook_bill_paid_title'] = '💰 Bill Paid',
    ['webhook_bill_deleted_title'] = '🗑️ Bill Deleted',
    ['webhook_recurring_created_title'] = '🔄 New Recurring Bill',
    ['webhook_recurring_payment_title'] = '💳 Recurring Payment',
    ['webhook_recurring_cancelled_title'] = '⛔ Subscription Cancelled',
    ['webhook_installment_created_title'] = '📋 New Payment Plan',
    ['webhook_installment_payment_title'] = '💸 Installment Payment',
    
    -- Webhooks - Descriptions
    ['webhook_bill_created_desc'] = 'A bill of $%s has been created by %s for %s',
    ['webhook_bill_paid_desc'] = 'A bill of $%s has been paid by %s',
    ['webhook_bill_deleted_desc'] = 'A bill of $%s has been deleted by %s',
    ['webhook_recurring_created_desc'] = 'A subscription of $%s has been created for %s (%s days)',
    ['webhook_recurring_payment_desc'] = 'A recurring payment of $%s has been created for %s',
    ['webhook_recurring_cancelled_desc'] = 'A subscription of $%s has been cancelled by %s',
    ['webhook_installment_created_desc'] = 'A payment plan of $%s has been created for %s (%s payments)',
    ['webhook_installment_payment_desc'] = 'An installment payment of $%s has been made by %s',
    
    -- Webhooks - Fields
    ['webhook_amount'] = 'Amount',
    ['webhook_reason'] = 'Reason',
    ['webhook_payment_method'] = 'Payment method',
    ['webhook_payment_bank'] = 'Bank',
    ['webhook_payment_cash'] = 'Cash',
    ['webhook_bill_id'] = 'Bill ID',
    ['webhook_amount_per_payment'] = 'Amount per payment',
    ['webhook_total_payments'] = 'Number of payments',
    ['webhook_remaining_payments'] = 'Remaining payments',
    ['webhook_total_amount'] = 'Total amount',
    ['webhook_next_payment'] = 'Next payment',
    ['webhook_interval'] = 'Interval',
    ['webhook_days_count'] = '%s days',
    ['webhook_type'] = 'Type',
    ['webhook_type_personal'] = 'Personal',
    ['webhook_script_start_title'] = '🚀 Script Started',
    ['webhook_script_start_desc'] = 'Billing system has started successfully',
    ['webhook_version'] = 'Version',
    ['webhook_framework'] = 'Framework'
}