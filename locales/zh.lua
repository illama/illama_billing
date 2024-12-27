Locales['zh'] = {
    -------------------
    -- 主菜单
    -------------------
    ['billing_menu'] = '账单菜单',
    ['open_billing_menu'] = '打开账单菜单',
    
    -- 主要部分
    ['personal_bills'] = '个人账单',
    ['personal_bills_desc'] = '管理您的个人账单',
    ['society_bills'] = '公司账单',
    ['society_bills_desc'] = '管理公司账单',
    ['my_bills'] = '我的账单',
    ['my_bills_desc'] = '查看已收到的账单',
    ['recurring_bills'] = '定期账单',
    ['recurring_bills_desc'] = '管理您的订阅和定期付款',
    ['transaction_history'] = '交易记录',
    ['transaction_history_desc'] = '查看所有账单历史',

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
    ['reason'] = '原因: %s',
    ['bill_from'] = '来自 %s 的账单',

    -------------------
    -- 群组账单
    -------------------
    ['group_billing'] = '群组账单',
    ['group_bill'] = '群组账单',
    ['group_bill_desc'] = '创建多人共享账单',
    ['group_bill_suffix'] = '群组账单',
    ['group_bill_split_equally'] = '平均分摊',
    ['individual_bill'] = '个人账单',
    ['individual_bill_desc'] = '创建单人账单',
    
    -- 分摊选项
    ['split_type'] = '分摊类型',
    ['split_equal'] = '平均分摊',
    ['split_percentage'] = '按百分比分摊',
    ['split_amount'] = '按固定金额分摊',
    ['total_amount'] = '总金额',
    ['enter_percentages'] = '输入百分比',
    ['enter_amounts'] = '输入金额',
    ['percentage_not_100'] = '百分比总和必须等于100%',
    ['amounts_not_total'] = '金额总和必须等于总金额',

    -------------------
    -- 公司账单
    -------------------
    ['new_society_bill'] = '新建公司账单',
    ['society'] = '公司',
    ['standard_bill'] = '标准账单',
    ['standard_bill_desc'] = '创建一次性账单',
    ['select_template'] = '选择模板或创建自定义账单',
    ['custom_bill'] = '自定义账单',
    ['society_payment'] = '公司付款',
    ['confirm_society_bill'] = '金额: $%s\n原因: %s',

    -------------------
    -- 定期账单
    -------------------
    ['recurring_bill'] = '定期账单',
    ['recurring_bill_desc'] = '创建月度/定期账单',
    ['recurring_bill_number'] = '定期账单 #%s',
    ['new_recurring_bill'] = '新建定期账单',
    ['recurring_payment'] = '定期付款',
    ['recurring_payment_suffix'] = '(定期付款)',
    
    -- 定期设置
    ['subscription_type'] = '订阅类型',
    ['custom_subscription'] = '自定义订阅',
    ['select_subscription_template'] = '选择模板或创建自定义订阅',
    ['interval_days'] = '间隔(天)',
    ['interval_days_desc'] = '付款间隔天数',
    ['recurring_reason_desc'] = '输入定期账单原因',
    ['confirm_recurring_bill'] = '每 %d 天定期账单 $%s，原因: %s',

    -------------------
    -- 支付
    -------------------
    -- 支付方式
    ['payment_method'] = '支付方式: %s',
    ['cash'] = '现金',
    ['bank'] = '银行',
    ['pay_cash'] = '现金支付',
    ['pay_bank'] = '银行支付',
    ['pay_amount_cash'] = '现金支付 $%s',
    ['pay_amount_bank'] = '银行支付 $%s',
    
    -- 预付款
    ['advance_payment'] = '预付款',
    ['pay_advance'] = '预付',
    ['pay_advance_desc'] = '提前支付多期款项',
    ['payment_amount'] = '每期付款金额',
    ['payment_amount_desc'] = '输入每期付款金额',
    ['amount_per_payment'] = '每期付款金额',
    ['confirm_advance_payment'] = '总支付金额: $%s，共 %d 期，通过 %s',

    -- 计数和金额
    ['payment_count'] = '付款次数: %d',
    ['payments_count'] = '付款次数',
    ['payments_count_desc'] = '%d 次付款%s',
    ['payment_count_desc'] = '选择预付期数',
    ['total_to_pay'] = '应付总额: $%s',
    
    -- 历史和确认
    ['payment_history'] = '支付历史',
    ['payment_history_desc'] = '查看支付历史',
    ['confirm_payment'] = '确认支付',
    ['payment_received'] = '已收到来自 %s 的 $%s',
    ['payment_made'] = '已向 %s 支付 $%s',
    ['payment_made_society'] = '已向 %s 支付 $%s',
    ['payment_made_player'] = '已向 %s 支付 $%s',
    ['bill_paid_amount'] = '已支付 $%s 的账单',

    -------------------
    -- 状态和时间
    -------------------
    ['status'] = '状态',
    ['active'] = '活动',
    ['inactive'] = '未激活',
    ['next_payment'] = '下次付款',
    ['today'] = '今天',
    ['tomorrow'] = '明天',
    ['days_remaining'] = '%d 天后',
    ['days_count'] = '%d 天',
    ['interval'] = '%d 天',
    ['in_days'] = '%d 天后',
    ['undefined'] = '未定义',
    ['plural_s'] = '个',

    -------------------
    -- 历史记录
    -------------------
    ['from'] = '从',
    ['to'] = '至',
    ['type'] = '类型',
    ['personal'] = '个人',
    ['bill_history_title'] = '%s 账单 %s %s',
    ['no_history'] = '无历史记录',
    ['no_history_desc'] = '您没有账单历史记录',
    ['no_payments'] = '无付款记录',
    ['no_payments_desc'] = '尚未进行任何付款',
    ['no_bills'] = '无账单',
    ['no_bills_desc'] = '尚未创建任何账单',
    
    -------------------
    -- 操作和按钮
    -------------------
    ['accept'] = '接受',
    ['refuse'] = '拒绝',
    ['accept_bill_desc'] = '接受此账单',
    ['refuse_bill_desc'] = '拒绝此账单',
    ['accept_recurring_desc'] = '接受此定期账单',
    ['refuse_recurring_desc'] = '拒绝此定期账单',
    ['select_player'] = '选择玩家',
    ['select_players'] = '选择玩家',
    ['select_min_players'] = '至少选择2名玩家',
    ['select_billing_type'] = '账单类型',
    ['confirmation'] = '确认',
    ['delete_bill'] = '删除账单',
    ['cancel_subscription'] = '取消订阅',
    ['cancel_subscription_desc'] = '取消此订阅',
    ['confirm_delete_bill'] = '确定要删除此账单吗？',
    ['confirm_cancel_subscription'] = '确定要取消此订阅吗？',

    -------------------
    -- 通知和错误
    -------------------
    -- 成功
    ['success'] = '成功',
    ['bills_created'] = '账单已创建',
    ['bill_accepted'] = '账单已接受',
    ['bill_accepted_desc'] = '您已接受该账单',
    ['bill_accepted_by_receiver'] = '账单已接受',
    ['recurring_bill_accepted'] = '定期账单已接受',
    ['recurring_bill_setup'] = '定期账单已设置',
    ['recurring_setup_success'] = '定期账单已设置',
    ['bill_request_sent'] = '账单请求已发送',
    ['recurring_bill_request_sent'] = '定期账单请求已发送',
    ['bill_deleted'] = '账单已成功删除',
    ['subscription_cancelled'] = '订阅已取消',

    -- 错误
    ['error'] = '错误',
    ['insufficient_rights'] = '权限不足',
    ['cannot_load_data'] = '无法加载您的数据',
    ['no_nearby_players'] = '附近没有玩家',
    ['need_multiple_players'] = '创建群组账单需要至少2名附近的玩家',
    ['invalid_amount'] = '金额必须大于0',
    ['invalid_interval'] = '无效的间隔(1-365天)',
    ['insufficient_funds'] = '资金不足(缺少 $%s)',
    ['bill_already_paid'] = '此账单不存在或已支付',
    ['bill_inactive'] = '此账单已失效',
    ['bill_refused'] = '账单已拒绝',
    ['bill_refused_desc'] = '您已拒绝该账单',
    ['bill_refused_by_receiver'] = '收款人已拒绝该账单',
    ['bill_expired'] = '账单已过期',
    ['bill_expired_desc'] = '账单已过期',
    ['bill_deleted_amount'] = '金额为 $%s 的账单已删除',
    ['recurring_cancelled'] = '定期账单因不活动已取消',
    ['recurring_cancelled_inactivity'] = '订阅因不活动已取消',
    ['player_disconnected_recurring'] = '玩家已断开连接，定期账单已取消',
    ['player_disconnected_bill'] = '玩家已断开连接，账单已取消',

    -------------------
    -- 系统消息
    -------------------
    ['distance'] = '%d 米',
    ['version_read_error'] = '^1[illama_billing] 无法从 fxmanifest.lua 读取版本^7',
    ['github_check_error'] = '^1[illama_billing] 无法在 GitHub 上检查版本^7',
    ['github_version_read_error'] = '^1[illama_billing] 读取 GitHub 版本时出错^7',
    ['new_version_available'] = '^3[illama_billing] 有新版本可用！^7',
    ['current_version'] = '^3[illama_billing] 当前版本: ^7%s',
    ['latest_version'] = '^3[illama_billing] 最新版本: ^7%s',
    ['release_notes'] = '^3[illama_billing] 发布说明: ^7%s',
    ['changes_list'] = '^3[illama_billing] 更改内容: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] 脚本已是最新版本 (v%s)^7',
}