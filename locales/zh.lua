Locales['zh'] = {
    -------------------
    -- 主菜单
    -------------------
    ['billing_menu'] = '账单菜单',
    ['open_billing_menu'] = '打开账单菜单',
    
    -- 主要部分
    ['personal_bills'] = '个人账单',
    ['personal_bills_desc'] = '管理个人账单',
    ['society_bills'] = '公司账单',
    ['society_bills_desc'] = '管理公司账单',
    ['my_bills'] = '我的账单',
    ['my_bills_desc'] = '查看收到的账单',
    ['recurring_bills'] = '订阅账单',
    ['recurring_bills_desc'] = '管理订阅账单',
    ['transaction_history'] = '交易历史',
    ['transaction_history_desc'] = '查看所有账单历史',
    ['my_recurring_bills'] = '我的订阅',

    -------------------
    -- 个人账单
    -------------------
    ['new_bill'] = '新建账单',
    ['bill_type'] = '账单类型',
    ['bill_details'] = '账单详情',
    ['bill_number'] = '账单 #%s',
    ['amount_label'] = '金额',
    ['amount_desc'] = '输入金额',
    ['reason_label'] = '原因',
    ['reason_desc'] = '输入原因',
    ['amount'] = '金额: $%s',
    ['amount_reason'] = '金额: $%s - %s',
    ['amount_and_reason'] = '金额: $%s - %s',
    ['reason'] = '原因: %s',
    ['bill_from'] = '来自 %s 的账单',
    ['standard_bill'] = '标准账单',
    ['check_bills'] = '检查账单',
    ['check_bills_desc'] = '检查当前账单',
    ['select_player_check'] = '选择要检查的玩家',
    ['bills_status'] = '账单状态',

    -------------------
    -- 团体账单
    -------------------
    ['group_billing'] = '团体账单',
    ['group_bill'] = '团体账单',
    ['group_bill_desc'] = '创建多人共享账单',
    ['group_bill_suffix'] = '团体账单',
    ['group_bill_split_equally'] = '平均分配',
    ['individual_bill'] = '个人账单',
    ['individual_bill_desc'] = '为单人创建账单',
    
    -- 分配
    ['split_type'] = '分配类型',
    ['split_equal'] = '平均分配',
    ['split_percentage'] = '百分比分配',
    ['split_amount'] = '固定金额分配',
    ['total_amount'] = '总金额',
    ['enter_percentages'] = '输入百分比',
    ['enter_amounts'] = '输入金额',
    ['percentage_not_100'] = '百分比总和必须等于100%',
    ['amounts_not_total'] = '金额总和必须等于总金额',
    ['percentage_split'] = '百分比分配',
    ['custom_split'] = '自定义分配',
    ['equal_split'] = '平均分配',
    ['remaining_percentage'] = '%s - 剩余%d%%',
    ['remaining_amount'] = '%s - 剩余$%s',
    ['enter_percentage_per_player'] = '为每个玩家输入百分比',
    ['enter_amount_per_player'] = '为每个玩家输入金额',

    -- 分期付款 - 菜单和通知
    ['pay_installments'] = '分期付款',
    ['pay_installments_desc'] = '将付款分散到几周内',
    ['installment_setup'] = '设置分期付款',
    ['number_of_payments'] = '付款次数',
    ['max_5_payments'] = '最多5次付款（每周1次）',
    ['confirm_installment_plan'] = '确认付款计划',
    ['payment_plan'] = '付款计划: %s',
    ['installment_status'] = '剩余%d次付款，共%d次\n每次付款金额: $%s',
    ['installment_details'] = '%d次分期付款计划\n每次付款金额: $%s\n总金额: $%s',
    ['payment_plan_created'] = '分期付款计划创建成功',
    ['bill_accepted_with_installments'] = '账单已接受，将采用分期付款',

    -- 分期付款菜单
    ['installment_payments'] = '分期付款',
    ['view_payment_plans'] = '查看我的当前付款计划',
    ['my_payment_plans'] = '我的分期付款',
    ['payment_plan'] = '付款计划: %s',
    ['no_installment_payments'] = '无分期付款',
    ['no_active_payment_plans'] = '您没有活动的付款计划',
    ['total_remaining'] = '剩余应付金额',
    ['allow_installments'] = '允许分期付款',
    ['allow_installments_desc'] = '允许此账单分期付款',

    -- 自动付款通知
    ['installment_payment'] = '分期付款',
    ['payment_processed'] = '已自动扣款 $%s',
    ['payment_failed'] = '付款失败',
    ['insufficient_funds_installment'] = '分期付款资金不足',

    -------------------
    -- 公司账单
    -------------------
    ['new_society_bill'] = '新建公司账单',
    ['society'] = '公司',
    ['standard_bill'] = '标准账单',
    ['standard_bill_desc'] = '创建单次账单',
    ['select_template'] = '选择模板或创建自定义账单',
    ['custom_bill'] = '自定义账单',
    ['society_payment'] = '公司付款',
    ['confirm_society_bill'] = '金额: $%s\n原因: %s',
    ['society_bill'] = '公司',

    -------------------
    -- 订阅账单
    -------------------
    ['recurring_bill'] = '订阅',
    ['recurring_bill_desc'] = '创建订阅',
    ['recurring_bill_number'] = '订阅 #%s',
    ['new_recurring_bill'] = '新建订阅',
    ['recurring_payment'] = '订阅付款',
    ['recurring_payment_suffix'] = '(订阅付款)',
    ['no_recurring_bills'] = '无订阅',
    ['no_recurring_bills_desc'] = '您没有任何订阅',
    ['bill_interval'] = '间隔',
    
    -- 订阅设置
    ['subscription_type'] = '订阅类型',
    ['custom_subscription'] = '自定义订阅',
    ['select_subscription_template'] = '选择模板或创建自定义订阅',
    ['interval_days'] = '间隔（天）',
    ['interval_days_desc'] = '每次付款之间的天数',
    ['interval_days_format'] = '%d天',
    ['recurring_reason_desc'] = '输入订阅账单原因',
    ['confirm_recurring_bill'] = '每%d天支付$%s的订阅，用于: %s',
    ['accept_recurring_payment'] = '接受每%d天支付$%s的订阅',

    -------------------
    -- 付款
    -------------------
    -- 支付方式
    ['payment_method'] = '支付方式: %s',
    ['cash'] = '现金',
    ['bank'] = '银行',
    ['pay_cash'] = '现金支付',
    ['pay_bank'] = '银行支付',
    ['pay_amount_cash'] = '现金支付 $%s',
    ['pay_amount_bank'] = '银行支付 $%s',
    ['pay_amount'] = '支付 $%s',
    
    -- 预付款
    ['advance_payment'] = '预付款',
    ['pay_advance'] = '预先支付',
    ['pay_advance_desc'] = '预先支付多次付款',
    ['payment_amount'] = '每次付款金额',
    ['payment_amount_desc'] = '输入每次付款金额',
    ['amount_per_payment'] = '每次付款金额',
    ['confirm_advance_payment'] = '总付款: $%s，共%d次付款，通过%s',
    ['payment_confirmation'] = '付款确认',

    -- 计数和金额
    ['payment_count'] = '付款次数: %d',
    ['payments_count'] = '付款次数',
    ['payments_count_desc'] = '%d次付款',
    ['payment_count_desc'] = '选择要预先支付的次数',
    ['payments_count_label'] = '付款次数',
    ['total_to_pay'] = '总计支付: $%s',
    
    -- 历史和确认
    ['payment_history'] = '付款历史',
    ['payment_history_desc'] = '查看付款历史',
    ['payment_history_title'] = '付款历史',
    ['confirm_payment'] = '确认付款',
    ['payment_received'] = '您收到来自%s的$%s',
    ['payment_made'] = '您向%s支付了$%s',
    ['payment_made_society'] = '您向%s支付了$%s',
    ['payment_made_player'] = '您向%s支付了$%s',
    ['bill_paid_amount'] = '账单$%s已支付',
    ['payment_amount'] = '支付$%s',

    -------------------
    -- 状态和时间
    -------------------
    ['status'] = '状态',
    ['status_label'] = '状态',
    ['active'] = '活动',
    ['inactive'] = '非活动',
    ['pending'] = '待处理',
    ['paid'] = '已支付',
    ['deleted'] = '已删除',
    ['next_payment'] = '下次付款',
    ['next_payment_label'] = '下次付款',
    ['today'] = '今天',
    ['tomorrow'] = '明天',
    ['days_remaining'] = '%d天后',
    ['days_count'] = '%d天',
    ['interval'] = '%d天',
    ['interval_label'] = '间隔',
    ['in_days'] = '%d天后',
    ['undefined'] = '未定义',
    ['plural_s'] = '次',
    ['days'] = '天',

    -------------------
    -- 历史
    -------------------
    ['from'] = '从',
    ['to'] = '到',
    ['type'] = '类型',
    ['type_label'] = '类型',
    ['from_label'] = '从',
    ['to_label'] = '到',
    ['personal'] = '个人',
    ['personal_bill'] = '个人',
    ['bill_history_title'] = '%s账单%s%s',
    ['no_history'] = '无历史记录',
    ['no_history_desc'] = '您没有历史账单',
    ['no_payments'] = '无付款',
    ['no_payments_desc'] = '尚未进行任何付款',
    ['no_bills'] = '无账单',
    ['no_bills_desc'] = '尚未创建任何账单',
    
    -------------------
    -- 操作和按钮
    -------------------
    ['accept'] = '接受',
    ['refuse'] = '拒绝',
    ['accept_bill'] = '接受账单',
    ['accept_bill_desc'] = '接受此账单',
    ['accept_subscription'] = '接受订阅',
    ['refuse_bill'] = '拒绝账单',
    ['refuse_bill_desc'] = '拒绝此账单',
    ['refuse_subscription'] = '拒绝订阅',
    ['accept_recurring_desc'] = '接受此订阅',
    ['refuse_recurring_desc'] = '拒绝此订阅',
    ['select_player'] = '选择玩家',
    ['select_players'] = '选择玩家',
    ['select_min_players'] = '至少选择2名玩家',
    ['select_billing_type'] = '账单类型',
    ['confirmation'] = '确认',
    ['delete_bill'] = '删除账单',
    ['delete_bill_desc'] = '将要求确认删除。',
    ['cancel_subscription'] = '取消订阅',
    ['cancel_subscription_desc'] = '取消此订阅',
    ['confirm_delete_bill'] = '您确定要删除此账单吗？',
    ['confirm_cancel_subscription'] = '您确定要取消此订阅吗？',
    ['unknown_player'] = '未知',
    ['close'] = '关闭',
    ['info'] = '信息',
    ['click_to_export'] = '点击账单以查看',
    ['require_signature'] = '需要签名',
    ['require_signature_desc'] = '要求为此账单签名',
    ['signature_required'] = '需要签名',
    ['enter_signature'] = '您的签名',
    ['signature_desc'] = '请签名确认账单',
    ['signature_placeholder'] = '在此签名',
    ['signature'] = '签名',
    ['not_signed'] = '未签名',
    ['signed_by'] = '签名人',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- 通知和错误
    -------------------
    -- 成功
    ['success'] = '成功',
    ['bills_created'] = '账单已创建',
    ['bill_accepted'] = '账单已接受',
    ['bill_accepted_desc'] = '您已接受账单',
    ['bill_accepted_by_receiver'] = '账单已接受',
    ['recurring_bill_accepted'] = '订阅已接受',
    ['recurring_bill_setup'] = '订阅账单已设置',
    ['recurring_setup_success'] = '订阅已成功设置',
    ['bill_request_sent'] = '账单请求已发送',
    ['recurring_bill_request_sent'] = '订阅账单请求已发送',
    ['bill_deleted'] = '账单已成功删除',
    ['subscription_cancelled'] = '订阅已取消',

    -- 错误
    ['error'] = '错误',
    ['insufficient_rights'] = '权限不足',
    ['cannot_load_data'] = '无法加载您的数据',
    ['no_nearby_players'] = '附近没有玩家',
    ['need_multiple_players'] = '需要至少2名附近玩家才能创建团体账单',
    ['invalid_amount'] = '金额必须大于0',
    ['invalid_interval'] = '无效间隔（1-365天）',
    ['insufficient_funds'] = '资金不足（缺少$%s）',
    ['bill_already_paid'] = '此账单不存在或已支付',
    ['bill_inactive'] = '此账单已失效',
    ['bill_refused'] = '账单已拒绝',
    ['bill_refused_desc'] = '您已拒绝账单',
    ['bill_refused_by_receiver'] = '接收方已拒绝账单',
    ['bill_expired'] = '账单已过期',
    ['bill_expired_desc'] = '账单已过期',
    ['bill_deleted_amount'] = '金额为$%s的账单已删除',
    ['recurring_cancelled'] = '订阅因不活动已取消',
    ['recurring_cancelled_inactivity'] = '订阅因不活动已取消',
    ['player_disconnected_recurring'] = '玩家已断开连接，订阅账单已取消',
    ['player_disconnected_bill'] = '玩家已断开连接，账单已取消',
    ['invalid_description'] = '描述只能包含字母和空格',

    -------------------
    -- 系统消息
    -------------------
    ['distance'] = '%d米',
    ['version_read_error'] = '^1[illama_billing] 无法从fxmanifest.lua读取版本^7',
    ['github_check_error'] = '^1[illama_billing] 无法检查GitHub版本^7',
    ['github_version_read_error'] = '^1[illama_billing] 读取GitHub版本时出错^7',
    ['new_version_available'] = '^3[illama_billing] 有新版本可用！^7',
    ['current_version'] = '^3[illama_billing] 当前版本: ^7%s',
    ['latest_version'] = '^3[illama_billing] 最新版本: ^7%s',
    ['release_notes'] = '^3[illama_billing] 发布说明: ^7%s',
    ['changes_list'] = '^3[illama_billing] 更改: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] 脚本已是最新版本 (v%s)^7',
    ['system_disabled_title'] = '账单系统已禁用',
    ['system_disabled_desc'] = '由于配置错误，系统已禁用',
    ['system_error'] = '系统错误',
    ['system_disabled_contact_admin'] = '账单系统已禁用。\n请联系管理员',
    ['feature_disabled'] = '此功能已禁用',

    -------------------
    -- 标签系统
    -------------------
    ['filter_by_tags'] = '按标签筛选',
    ['filter_tags_desc'] = '按标签筛选账单',
    ['manage_tags'] = '管理标签',
    ['manage_tags_desc'] = '为此账单添加或删除标签',
    ['add_tag'] = '添加标签',
    ['add_tag_desc'] = '为此账单输入新标签',
    ['tag_placeholder'] = '例如：重要、个人、工作',
    ['tag_added'] = '标签添加成功',
    ['show_all'] = '显示所有账单',
    ['show_all_desc'] = '移除标签筛选',
    ['filter_by_tag_desc'] = '显示带有此标签的账单',
    ['current_filter'] = '当前筛选',
    ['filtered_by_tag'] = '显示带有标签的账单：%s',
    ['change_filter'] = '更改筛选',
    ['change_filter_desc'] = '选择其他标签进行筛选',
    ['filtered_transaction_history'] = '已筛选的交易历史',
    ['no_bills_found'] = '未找到账单',
    ['no_bills_with_tag'] = '未找到带有标签的账单：%s',
    ['bill_actions'] = '账单操作',
    ['no_tags'] = '无标签',
    ['no_tags_desc'] = '此账单尚未添加标签',
    ['add_new_tag'] = '添加新标签',
    ['remove_tag_desc'] = '点击删除此标签',
    ['tag_removed'] = '标签已成功删除',
    ['tag_name'] = '标签名称',
    ['tag_name_desc'] = '输入新标签的名称',
    ['export_bill'] = '导出账单',
    ['export_bill_desc'] = '将账单导出为图片',

    -------------------
    -- 安全性
    -------------------
    ['billing_system_error'] = '错误 - 账单系统',
    ['error'] = '错误',
    ['script_disabled_wrong_name'] = '由于资源名称不正确，脚本已禁用！',
    ['expected_name'] = '预期名称: ^3%s^7',
    ['current_name'] = '当前名称: ^3%s^7',
    ['rename_folder_instruction'] = '请重命名文件夹以重新启用脚本。',
    ['contact_support'] = '如需帮助请联系支持。',
    ['invalid_resource_name'] = '无效的资源名称！',
    ['manifest_version'] = '清单版本: %s',
    ['script_disabled_security'] = '出于安全原因，脚本已禁用。',

    ['webhook_bot_name'] = '账单系统',
    ['webhook_footer'] = '发送于%s',
    
    -- Webhooks - 标题
    ['webhook_bill_created_title'] = '📥 新账单',
    ['webhook_bill_paid_title'] = '💰 账单已支付',
    ['webhook_bill_deleted_title'] = '🗑️ 账单已删除',
    ['webhook_recurring_created_title'] = '🔄 新订阅账单',
    ['webhook_recurring_payment_title'] = '💳 订阅付款',
    ['webhook_recurring_cancelled_title'] = '⛔ 订阅已取消',
    ['webhook_installment_created_title'] = '📋 新付款计划',
    ['webhook_installment_payment_title'] = '💸 分期付款',
    
    -- Webhooks - 描述
    ['webhook_bill_created_desc'] = '%s为%s创建了金额为$%s的账单',
    ['webhook_bill_paid_desc'] = '%s支付了金额为$%s的账单',
    ['webhook_bill_deleted_desc'] = '%s删除了金额为$%s的账单',
    ['webhook_recurring_created_desc'] = '为%s创建了金额为$%s的订阅（%s天）',
    ['webhook_recurring_payment_desc'] = '为%s创建了金额为$%s的订阅付款',
    ['webhook_recurring_cancelled_desc'] = '%s取消了金额为$%s的订阅',
    ['webhook_installment_created_desc'] = '为%s创建了金额为$%s的付款计划（%s次付款）',
    ['webhook_installment_payment_desc'] = '%s支付了金额为$%s的分期付款',
    
    -- Webhooks - 字段
    ['webhook_amount'] = '金额',
    ['webhook_reason'] = '原因',
    ['webhook_payment_method'] = '支付方式',
    ['webhook_payment_bank'] = '银行',
    ['webhook_payment_cash'] = '现金',
    ['webhook_bill_id'] = '账单ID',
    ['webhook_amount_per_payment'] = '每次付款金额',
    ['webhook_total_payments'] = '付款次数',
    ['webhook_remaining_payments'] = '剩余付款',
    ['webhook_total_amount'] = '总金额',
    ['webhook_next_payment'] = '下次付款',
    ['webhook_interval'] = '间隔',
    ['webhook_days_count'] = '%s天',
    ['webhook_type'] = '类型',
    ['webhook_type_personal'] = '个人',
    ['webhook_script_start_title'] = '🚀 脚本已启动',
    ['webhook_script_start_desc'] = '账单系统已成功启动',
    ['webhook_version'] = '版本',
    ['webhook_framework'] = '框架'
}