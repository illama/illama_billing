Locales['ru'] = {
    -------------------
    -- ГЛАВНОЕ МЕНЮ
    -------------------
    ['billing_menu'] = 'Меню счетов',
    ['open_billing_menu'] = 'Открыть меню счетов',
    
    -- Основные разделы
    ['personal_bills'] = 'Личные счета',
    ['personal_bills_desc'] = 'Управляйте своими личными счетами',
    ['society_bills'] = 'Счет компании',
    ['society_bills_desc'] = 'Управляйте счетами компании',
    ['my_bills'] = 'Мои счета',
    ['my_bills_desc'] = 'Посмотреть полученные счета',
    ['recurring_bills'] = 'Регулярные счета',
    ['recurring_bills_desc'] = 'Управляйте своими подписками и регулярными платежами',
    ['transaction_history'] = 'История транзакций',
    ['transaction_history_desc'] = 'Посмотреть всю историю счетов',
    ['my_recurring_bills'] = 'Мои регулярные счета',

    -------------------
    -- ИНДИВИДУАЛЬНЫЕ СЧЕТА
    -------------------
    ['new_bill'] = 'Новый счет',
    ['bill_type'] = 'Тип счета',
    ['bill_details'] = 'Детали счета',
    ['bill_number'] = 'Счет #%s',
    ['amount_label'] = 'Сумма',
    ['amount_desc'] = 'Введите сумму',
    ['reason_label'] = 'Причина',
    ['reason_desc'] = 'Введите причину',
    ['amount'] = 'Сумма: $%s',
    ['amount_reason'] = 'Сумма: $%s - %s',
    ['amount_and_reason'] = 'Сумма: $%s - %s',
    ['reason'] = 'Причина: %s',
    ['bill_from'] = 'Счет от %s',
    ['standard_bill'] = 'Стандартный счет',
    ['check_bills'] = 'Проверить счета',
    ['check_bills_desc'] = 'Проверка текущих счетов',
    ['select_player_check'] = 'Выберите игрока для проверки',
    ['bills_status'] = 'Статус счетов',

    -------------------
    -- ГРУППОВЫЕ СЧЕТА
    -------------------
    ['group_billing'] = 'Групповая счет',
    ['group_bill'] = 'Групповой счет',
    ['group_bill_desc'] = 'Создайте общий счет между несколькими людьми',
    ['group_bill_suffix'] = 'Групповой счет',
    ['group_bill_split_equally'] = 'Равное разделение',
    ['individual_bill'] = 'Индивидуальный счет',
    ['individual_bill_desc'] = 'Создать счет для одного человека',
    
    -- Варианты разделения
    ['split_type'] = 'Тип разделения',
    ['split_equal'] = 'Равное разделение',
    ['split_percentage'] = 'Разделение по процентам',
    ['split_amount'] = 'Фиксированное разделение суммы',
    ['total_amount'] = 'Общая сумма',
    ['enter_percentages'] = 'Введите проценты',
    ['enter_amounts'] = 'Введите суммы',
    ['percentage_not_100'] = 'Сумма процентов должна составлять 100%',
    ['amounts_not_total'] = 'Сумма должна быть равна общей сумме',
    ['percentage_split'] = 'Разделение по процентам',
    ['custom_split'] = 'Произвольное разделение',
    ['equal_split'] = 'Равное разделение',
    ['remaining_percentage'] = '%s - %d%% осталось',
    ['remaining_amount'] = '%s - $%s осталось',
    ['enter_percentage_per_player'] = 'Введите процент для каждого игрока',
    ['enter_amount_per_player'] = 'Введите сумму для каждого игрока',
    -- Рассрочка платежа - Меню и уведомления
    ['pay_installments'] = 'Оплатить в рассрочку',
    ['pay_installments_desc'] = 'Разделить платёж на несколько недель',
    ['installment_setup'] = 'Настройка рассрочки',
    ['number_of_payments'] = 'Количество платежей',
    ['max_5_payments'] = 'Максимум 5 платежей (1 раз в неделю)',
    ['confirm_installment_plan'] = 'Подтвердить план рассрочки',
    ['payment_plan'] = 'План платежей: %s',  -- 1 argument
    ['installment_status'] = 'Осталось %d платежей из %d\nСумма платежа: $%s', -- 3 arguments
    ['installment_details'] = 'План рассрочки на %d платежей\nСумма платежа: $%s\nОбщая сумма: $%s', -- 3 arguments
    ['payment_plan_created'] = 'План рассрочки успешно создан',
    ['bill_accepted_with_installments'] = 'Счёт принят с оплатой в рассрочку',

    -- Меню рассрочки
    ['installment_payments'] = 'Платежи в рассрочку',
    ['view_payment_plans'] = 'Просмотр активных планов рассрочки',
    ['my_payment_plans'] = 'Мои планы рассрочки',
    ['payment_plan'] = 'План рассрочки: %s',
    ['no_installment_payments'] = 'Нет платежей в рассрочку',
    ['no_active_payment_plans'] = 'У вас нет активных планов рассрочки',
    ['total_remaining'] = 'Осталось к оплате',

    -- Уведомления об автоматических платежах
    ['installment_payment'] = 'Платёж по рассрочке',
    ['payment_processed'] = 'Автоматически списано $%s',
    ['payment_failed'] = 'Ошибка платежа',
    ['insufficient_funds_installment'] = 'Недостаточно средств для платежа по рассрочке',
    
    -------------------
    -- СЧЕТА КОМПАНИИ
    -------------------
    ['new_society_bill'] = 'Новый счет компании',
    ['society'] = 'Компания',
    ['standard_bill'] = 'Стандартный счет',
    ['standard_bill_desc'] = 'Создать одноразовый счет',
    ['select_template'] = 'Выберите шаблон или создайте произвольный счет',
    ['custom_bill'] = 'Произвольный счет',
    ['society_payment'] = 'Платеж компании',
    ['confirm_society_bill'] = 'Сумма: $%s\nПричина: %s',
    ['society_bill'] = 'Компания',

    -------------------
    -- РЕГУЛЯРНЫЕ СЧЕТА
    -------------------
    ['recurring_bill'] = 'Регулярный счет',
    ['recurring_bill_desc'] = 'Создать ежемесячный/регулярный счет',
    ['recurring_bill_number'] = 'Регулярный счет #%s',
    ['new_recurring_bill'] = 'Новый регулярный счет',
    ['recurring_payment'] = 'Регулярный платеж',
    ['recurring_payment_suffix'] = '(Регулярный платеж)',
    ['no_recurring_bills'] = 'Нет регулярных счетов',
    ['no_recurring_bills_desc'] = 'У вас нет регулярных счетов',
    ['bill_interval'] = 'Интервал',
    
    -- Настройки регулярных счетов
    ['subscription_type'] = 'Тип подписки',
    ['custom_subscription'] = 'Произвольная подписка',
    ['select_subscription_template'] = 'Выберите шаблон или создайте произвольную подписку',
    ['interval_days'] = 'Интервал (дни)',
    ['interval_days_desc'] = 'Количество дней между каждым платежом',
    ['interval_days_format'] = '%d дней',
    ['recurring_reason_desc'] = 'Введите причину для регулярной оплаты',
    ['confirm_recurring_bill'] = 'Регулярный счет на $%s каждые %d дней за: %s',
    ['accept_recurring_payment'] = 'Принять регулярный платеж в размере $%s каждые %d дней',

    -------------------
    -- ПЛАТЕЖИ
    -------------------
    -- Методы оплаты
    ['payment_method'] = 'Метод оплаты: %s',
    ['cash'] = 'Наличные',
    ['bank'] = 'Банк',
    ['pay_cash'] = 'Оплатить наличными',
    ['pay_bank'] = 'Оплатить через банк',
    ['pay_amount_cash'] = 'Оплатить $%s наличными',
    ['pay_amount_bank'] = 'Оплатить $%s через банк',
    ['pay_amount'] = 'Оплатить $%s',
    
    -- Предварительные платежи
    ['advance_payment'] = 'Предварительный платеж',
    ['pay_advance'] = 'Оплатить заранее',
    ['pay_advance_desc'] = 'Оплатить несколько взносов заранее',
    ['payment_amount'] = 'Сумма платежа',
    ['payment_amount_desc'] = 'Введите сумму каждого платежа',
    ['amount_per_payment'] = 'Сумма за платеж',
    ['confirm_advance_payment'] = 'Всего к оплате: $%s за %d платежей на %s',
    ['payment_confirmation'] = 'Подтверждение платежа',

    -- Счетчики и суммы
    ['payment_count'] = 'Количество платежей: %d',
    ['payments_count'] = 'Количество платежей',
    ['payments_count_desc'] = '%d платеж(ей)',
    ['payment_count_desc'] = 'Выберите количество платежей для внесения заранее',
    ['payments_count_label'] = 'Количество платежей',
    ['total_to_pay'] = 'Всего к оплате: $%s',
    
    -- История и подтверждения
    ['payment_history'] = 'История платежей',
    ['payment_history_desc'] = 'Посмотреть историю платежей',
    ['payment_history_title'] = 'История платежей',
    ['confirm_payment'] = 'Подтвердить платеж',
    ['payment_received'] = 'Вы получили $%s от %s',
    ['payment_made'] = 'Вы заплатили $%s %s',
    ['payment_made_society'] = 'Вы заплатили $%s компании %s',
    ['payment_made_player'] = 'Вы заплатили $%s игроку %s',
    ['bill_paid_amount'] = 'Счет на $%s оплачен',
    ['payment_amount'] = 'Платеж в размере $%s',

    -------------------
    -- СТАТУСЫ И ВРЕМЯ
    -------------------
    ['status'] = 'Статус',
    ['status_label'] = 'Статус',
    ['active'] = 'Активный',
    ['inactive'] = 'Неактивный',
    ['pending'] = 'В ожидании',
    ['paid'] = 'Оплачено',
    ['deleted'] = 'Удалено',
    ['next_payment'] = 'Следующий платеж',
    ['next_payment_label'] = 'Следующий платеж',
    ['today'] = 'Сегодня',
    ['tomorrow'] = 'Завтра',
    ['days_remaining'] = 'Через %d дней',
    ['days_count'] = '%d дней',
    ['interval'] = '%d дней',
    ['interval_label'] = 'Интервал',
    ['in_days'] = 'Через %d дней',
    ['undefined'] = 'Неопределено',
    ['plural_s'] = 'ы',
    ['days'] = 'дней',

    -------------------
    -- ИСТОРИЯ
    -------------------
    ['from'] = 'От',
    ['to'] = 'К',
    ['type'] = 'Тип',
    ['type_label'] = 'Тип',
    ['from_label'] = 'От',
    ['to_label'] = 'К',
    ['personal'] = 'Личный',
    ['personal_bill'] = 'Личный',
    ['bill_history_title'] = '%s счет %s %s',
    ['no_history'] = 'Нет истории',
    ['no_history_desc'] = 'У вас нет истории счетов',
    ['no_payments'] = 'Нет платежей',
    ['no_payments_desc'] = 'Платежи еще не были произведены',
    ['no_bills'] = 'Нет счетов',
    ['no_bills_desc'] = 'Счета еще не были выставлены',
    
    -------------------
    -- ДЕЙСТВИЯ И КНОПКИ
    -------------------
    ['accept'] = 'Принять',
    ['refuse'] = 'Отказать',
    ['accept_bill'] = 'Принять счет',
    ['accept_bill_desc'] = 'Принять этот счет',
    ['accept_subscription'] = 'Принять подписку',
    ['refuse_bill'] = 'Отказать в счет',
    ['refuse_bill_desc'] = 'Отказать в данном счете',
    ['refuse_subscription'] = 'Отказать в подписке',
    ['accept_recurring_desc'] = 'Принять этот регулярный счет',
    ['refuse_recurring_desc'] = 'Отказать в этом регулярном счете',
    ['select_player'] = 'Выбрать игрока',
    ['select_players'] = 'Выбрать игроков',
    ['select_min_players'] = 'Выберите не менее 2 игроков',
    ['select_billing_type'] = 'Тип биллинга',
    ['confirmation'] = 'Подтверждение',
    ['delete_bill'] = 'Удалить счет',
    ['cancel_subscription'] = 'Отменить подписку',
    ['cancel_subscription_desc'] = 'Отменить эту подписку',
    ['confirm_delete_bill'] = 'Вы уверены, что хотите удалить этот счет?',
    ['confirm_cancel_subscription'] = 'Вы уверены, что хотите отменить эту подписку?',
    ['unknown_player'] = 'Неизвестный',
    ['close'] = 'Закрыть',
    ['info'] = 'Информация',
    ['click_to_export'] = 'Нажмите на счет, чтобы просмотреть его',

    -------------------
    -- УВЕДОМЛЕНИЯ И ОШИБКИ
    -------------------
    -- Успехи
    ['success'] = 'Успех',
    ['bills_created'] = 'Счета были созданы',
    ['bill_accepted'] = 'Счет принят',
    ['bill_accepted_desc'] = 'Вы приняли счет',
    ['bill_accepted_by_receiver'] = 'Счет принят',
    ['recurring_bill_accepted'] = 'Регулярный счет принят',
    ['recurring_bill_setup'] = 'Регулярная оплата была настроена',
    ['recurring_setup_success'] = 'Регулярные платежи настроены',
    ['bill_request_sent'] = 'Запрос счета отправлен',
    ['recurring_bill_request_sent'] = 'Запрос на регулярный счет отправлен',
    ['bill_deleted'] = 'Счет успешно удален',
    ['subscription_cancelled'] = 'Подписка отменена',

    -- Ошибки
    ['error'] = 'Ошибка',
    ['insufficient_rights'] = 'У вас недостаточно прав',
    ['cannot_load_data'] = 'Не удается загрузить ваши данные',
    ['no_nearby_players'] = 'Нет игроков поблизости',
    ['need_multiple_players'] = 'Необходимо как минимум 2 игрока поблизости для создания группового счета',
    ['invalid_amount'] = 'Сумма должна быть больше 0',
    ['invalid_interval'] = 'Недопустимый интервал (1-365 дней)',
    ['insufficient_funds'] = 'Недостаточно средств (не хватает $%s)',
    ['bill_already_paid'] = 'Этот счет не существует или уже был оплачен',
    ['bill_inactive'] = 'Этот счет больше не активен',
    ['bill_refused'] = 'Счет отклонен',
    ['bill_refused_desc'] = 'Вы отклонили счет',
    ['bill_refused_by_receiver'] = 'Получатель отклонил счет',
    ['bill_expired'] = 'Счет истек',
    ['bill_expired_desc'] = 'Счет истек',
    ['bill_deleted_amount'] = 'Счет на $%s был удален',
    ['recurring_cancelled'] = 'Регулярный счет был отменен из-за неактивности',
    ['recurring_cancelled_inactivity'] = 'Подписка отменена из-за неактивности',
    ['player_disconnected_recurring'] = 'Игрок отключился, регулярный счет отменен',
    ['player_disconnected_bill'] = 'Игрок отключился, счет отменен',

    -------------------
    -- СООБЩЕНИЯ СИСТЕМЫ
    -------------------
    ['distance'] = '%d метров',
    ['version_read_error'] = '^1[illama_billing] Не удается прочитать версию в fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Не удается проверить версию на GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Ошибка чтения версии GitHub^7',
    ['new_version_available'] = '^3[illama_billing] Доступна новая версия!^7',
    ['current_version'] = '^3[illama_billing] Текущая версия: ^7%s',
    ['latest_version'] = '^3[illama_billing] Последняя версия: ^7%s',
    ['release_notes'] = '^3[illama_billing] Примечания к версии: ^7%s',
    ['changes_list'] = '^3[illama_billing] Изменения: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Скрипт обновлен (v%s)^7',

    -------------------
    -- СИСТЕМА ТЕГОВ
    -------------------
    ['filter_by_tags'] = 'Фильтр по тегам',
    ['filter_tags_desc'] = 'Фильтровать счета по тегам',
    ['manage_tags'] = 'Управление тегами',
    ['manage_tags_desc'] = 'Добавить или удалить теги для этого счёта',
    ['add_tag'] = 'Добавить тег',
    ['add_tag_desc'] = 'Введите новый тег для этого счёта',
    ['tag_placeholder'] = 'например: Важное, Личное, Работа',
    ['tag_added'] = 'Тег успешно добавлен',
    ['show_all'] = 'Показать все счета',
    ['show_all_desc'] = 'Убрать фильтры тегов',
    ['filter_by_tag_desc'] = 'Показать счета с этим тегом',
    ['current_filter'] = 'Текущий фильтр',
    ['filtered_by_tag'] = 'Показаны счета с тегом: %s',
    ['change_filter'] = 'Изменить фильтр',
    ['change_filter_desc'] = 'Выбрать другой тег для фильтрации',
    ['filtered_transaction_history'] = 'Отфильтрованная история транзакций',
    ['no_bills_found'] = 'Счета не найдены',
    ['no_bills_with_tag'] = 'Не найдено счетов с тегом: %s',
    ['bill_actions'] = 'Действия со счётом',
    ['no_tags'] = 'Нет тегов',
    ['no_tags_desc'] = 'К этому счёту не добавлено тегов',
    ['add_new_tag'] = 'Добавить новый тег',
    ['remove_tag_desc'] = 'Нажмите, чтобы удалить этот тег',
    ['tag_removed'] = 'Тег успешно удалён',
    ['tag_name'] = 'Название тега',
    ['tag_name_desc'] = 'Введите название нового тега',
    ['export_bill'] = 'Экспорт счёта',
    ['export_bill_desc'] = 'Экспортировать счёт как изображение'
}