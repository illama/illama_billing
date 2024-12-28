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
    ['my_bills_desc'] = '查看接收到的账单',
    ['recurring_bills'] = '定期账单',
    ['recurring_bills_desc'] = '管理您的订阅和定期付款',
    ['transaction_history'] = '交易历史',
    ['transaction_history_desc'] = '查看所有账单历史',
    ['my_recurring_bills'] = '我的定期账单',

    -------------------
    -- 单个账单
    -------------------
    ['new_bill'] = '新账单',
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
    ['bill_from'] = '账单来自 %s',
    ['standard_bill'] = '标准账单',
    ['check_bills'] = '检查账单',
    ['check_bills_desc'] = '检查进行中的账单',
    ['select_player_check'] = '选择一个玩家进行检查',
    ['bills_status'] = '账单状态',

    -------------------
    -- 群组账单
    -------------------
    ['group_billing'] = '集团账单',
    ['group_bill'] = '群组账单',
    ['group_bill_desc'] = '在多个人之间创建共享账单',
    ['group_bill_suffix'] = '群组账单',
    ['group_bill_split_equally'] = '平均分摊',
    ['individual_bill'] = '个人账单',
    ['individual_bill_desc'] = '为一个人创建账单',
    
    -- 分摊选项
    ['split_type'] = '分摊类型',
    ['split_equal'] = '平均分摊',
    ['split_percentage'] = '按百分比分摊',
    ['split_amount'] = '固定金额分摊',
    ['total_amount'] = '总金额',
    ['enter_percentages'] = '输入百分比',
    ['enter_amounts'] = '输入金额',
    ['percentage_not_100'] = '百分比之和必须等于 100%',
    ['amounts_not_total'] = '金额之和必须等于总金额',
    ['percentage_split'] = '按百分比分摊',
    ['custom_split'] = '自定义分摊',
    ['equal_split'] = '平均分摊',
    ['remaining_percentage'] = '%s - %d%% 剩余',
    ['remaining_amount'] = '%s - $%s 剩余',
    ['enter_percentage_per_player'] = '输入每个玩家的百分比',
    ['enter_amount_per_player'] = '输入每个玩家的金额',

    -------------------
    -- 公司账单
    -------------------
    ['new_society_bill'] = '新公司账单',
    ['society'] = '公司',
    ['standard_bill'] = '标准账单',
    ['standard_bill_desc'] = '创建一次性账单',
    ['select_template'] = '选择模板或创建自定义账单',
    ['custom_bill'] = '自定义账单',
    ['society_payment'] = '公司付款',
    ['confirm_society_bill'] = '金额: $%s\n原因: %s',
    ['society_bill'] = '公司',

    -------------------
    -- 定期账单
    -------------------
    ['recurring_bill'] = '定期账单',
    ['recurring_bill_desc'] = '创建每月/定期账单',
    ['recurring_bill_number'] = '定期账单 #%s',
    ['new_recurring_bill'] = '新定期账单',
    ['recurring_payment'] = '定期付款',
    ['recurring_payment_suffix'] = '(定期付款)',
    ['no_recurring_bills'] = '没有定期账单',
    ['no_recurring_bills_desc'] = '您没有定期账单',
    ['bill_interval'] = '间隔',
    
    -- 定期设置
    ['subscription_type'] = '订阅类型',
    ['custom_subscription'] = '自定义订阅',
    ['select_subscription_template'] = '选择模板或创建自定义订阅',
    ['interval_days'] = '间隔（天）',
    ['interval_days_desc'] = '每次付款之间的天数',
    ['interval_days_format'] = '%d 天',
    ['recurring_reason_desc'] = '输入定期账单的原因',
    ['confirm_recurring_bill'] = '定期账单 $%s 每 %d 天一次，原因: %s',
    ['accept_recurring_payment'] = '接受每 %d 天一次的定期付款 $%s',

    -------------------
    -- 付款
    -------------------
    -- 付款方式
    ['payment_method'] = '付款方式: %s',
    ['cash'] = '现金',
    ['bank'] = '银行',
    ['pay_cash'] = '用现金支付',
    ['pay_bank'] = '通过银行支付',
    ['pay_amount_cash'] = '支付 $%s 现金',
    ['pay_amount_bank'] = '支付 $%s 通过银行',
    ['pay_amount'] = '支付 $%s',
    
    -- 提前付款
    ['advance_payment'] = '提前付款',
    ['pay_advance'] = '提前支付',
    ['pay_advance_desc'] = '提前支付多个分期付款',
    ['payment_amount'] = '付款金额',
    ['payment_amount_desc'] = '输入每笔付款的金额',
    ['amount_per_payment'] = '每笔付款的金额',
    ['confirm_advance_payment'] = '总支付: $%s，共 %d 次付款，支付给: %s',
    ['payment_confirmation'] = '付款确认',

    -- 计数器和金额
    ['payment_count'] = '付款次数: %d',
    ['payments_count'] = '付款次数',
    ['payments_count_desc'] = '%d 次付款',
    ['payment_count_desc'] = '选择提前支付的付款次数',
    ['payments_count_label'] = '付款次数',
    ['total_to_pay'] = '总支付: $%s',
    
    -- 历史和确认
    ['payment_history'] = '付款历史',
    ['payment_history_desc'] = '查看付款历史',
    ['payment_history_title'] = '付款历史',
    ['confirm_payment'] = '确认付款',
    ['payment_received'] = '您收到来自 %s 的 $%s',
    ['payment_made'] = '您支付给 %s $%s',
    ['payment_made_society'] = '您支付给公司 %s $%s',
    ['payment_made_player'] = '您支付给玩家 %s $%s',
    ['bill_paid_amount'] = '账单 $%s 已支付',
    ['payment_amount'] = '支付 $%s',

    -------------------
    -- 状态和时间
    -------------------
    ['status'] = '状态',
    ['status_label'] = '状态',
    ['active'] = '活跃',
    ['inactive'] = '不活跃',
    ['pending'] = '待处理',
    ['paid'] = '已支付',
    ['deleted'] = '已删除',
    ['next_payment'] = '下一个付款',
    ['next_payment_label'] = '下一个付款',
    ['today'] = '今天',
    ['tomorrow'] = '明天',
    ['days_remaining'] = '剩余 %d 天',
    ['days_count'] = '%d 天',
    ['interval'] = '%d 天',
    ['interval_label'] = '间隔',
    ['in_days'] = '在 %d 天内',
    ['undefined'] = '未定义',
    ['plural_s'] = 's',
    ['days'] = '天',

    -------------------
    -- 历史
    -------------------
    ['from'] = '从',
    ['to'] = '至',
    ['type'] = '类型',
    ['type_label'] = '类型',
    ['from_label'] = '从',
    ['to_label'] = '至',
    ['personal'] = '个人',
    ['personal_bill'] = '个人',
    ['bill_history_title'] = '%s 账单 %s %s',
    ['no_history'] = '没有历史',
    ['no_history_desc'] = '您没有账单历史',
    ['no_payments'] = '没有付款',
    ['no_payments_desc'] = '尚未进行付款',
    ['no_bills'] = '没有账单',
    ['no_bills_desc'] = '尚未开出账单',
    
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
    ['accept_recurring_desc'] = '接受此定期账单',
    ['refuse_recurring_desc'] = '拒绝此定期账单',
    ['select_player'] = '选择玩家',
    ['select_players'] = '选择玩家',
    ['select_min_players'] = '至少选择 2 位玩家',
    ['select_billing_type'] = '账单类型',
    ['confirmation'] = '确认',
    ['delete_bill'] = '删除账单',
    ['cancel_subscription'] = '取消订阅',
    ['cancel_subscription_desc'] = '取消此订阅',
    ['confirm_delete_bill'] = '您确定要删除此账单吗？',
    ['confirm_cancel_subscription'] = '您确定要取消此订阅吗？',
    ['unknown_player'] = '未知',

    -------------------
    -- 通知和错误
    -------------------
    -- 成功
    ['success'] = '成功',
    ['bills_created'] = '账单已创建',
    ['bill_accepted'] = '账单已接受',
    ['bill_accepted_desc'] = '您已接受账单',
    ['bill_accepted_by_receiver'] = '账单已接受',
    ['recurring_bill_accepted'] = '定期账单已接受',
    ['recurring_bill_setup'] = '定期账单已设置',
    ['recurring_setup_success'] = '定期账单已配置',
    ['bill_request_sent'] = '账单请求已发送',
    ['recurring_bill_request_sent'] = '定期账单请求已发送',
    ['bill_deleted'] = '账单已成功删除',
    ['subscription_cancelled'] = '订阅已取消',

    -- 错误
    ['error'] = '错误',
    ['insufficient_rights'] = '您没有足够的权限',
    ['cannot_load_data'] = '无法加载您的数据',
    ['no_nearby_players'] = '附近没有玩家',
    ['need_multiple_players'] = '创建集团账单需要至少 2 位附近的玩家',
    ['invalid_amount'] = '金额必须大于 0',
    ['invalid_interval'] = '无效的间隔（1-365 天）',
    ['insufficient_funds'] = '您没有足够的资金（缺少 $%s）',
    ['bill_already_paid'] = '此账单不存在或已被支付',
    ['bill_inactive'] = '此账单不再活跃',
    ['bill_refused'] = '账单已拒绝',
    ['bill_refused_desc'] = '您已拒绝账单',
    ['bill_refused_by_receiver'] = '收件人已拒绝账单',
    ['bill_expired'] = '账单已过期',
    ['bill_expired_desc'] = '账单已过期',
    ['bill_deleted_amount'] = '金额为 $%s 的账单已被删除',
    ['recurring_cancelled'] = '由于不活跃，定期账单已被取消',
    ['recurring_cancelled_inactivity'] = '由于不活跃，订阅已被取消',
    ['player_disconnected_recurring'] = '玩家已断开连接，定期账单已被取消',
    ['player_disconnected_bill'] = '玩家已断开连接，账单已被取消',

    -------------------
    -- 系统消息
    -------------------
    ['distance'] = '%d 米',
    ['version_read_error'] = '^1[illama_billing] 无法读取 fxmanifest.lua 中的版本^7',
    ['github_check_error'] = '^1[illama_billing] 无法检查 GitHub 上的版本^7',
    ['github_version_read_error'] = '^1[illama_billing] 读取 GitHub 版本时出错^7',
    ['new_version_available'] = '^3[illama_billing] 有新版本可用！^7',
    ['current_version'] = '^3[illama_billing] 当前版本: ^7%s',
    ['latest_version'] = '^3[illama_billing] 最新版本: ^7%s',
    ['release_notes'] = '^3[illama_billing] 发行说明: ^7%s',
    ['changes_list'] = '^3[illama_billing] 修改内容: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] 脚本是最新的（v%s）^7'
}