Locales['ru'] = {
    -------------------
    -- ГЛАВНОЕ МЕНЮ
    -------------------
    ['billing_menu'] = 'Меню Счетов',
    ['open_billing_menu'] = 'Открыть меню счетов',
    
    -- Основные разделы
    ['personal_bills'] = 'Личные Счета',
    ['personal_bills_desc'] = 'Управление личными счетами',
    ['society_bills'] = 'Счета Организации',
    ['society_bills_desc'] = 'Управление счетами организации',
    ['my_bills'] = 'Мои Счета',
    ['my_bills_desc'] = 'Просмотр полученных счетов',
    ['recurring_bills'] = 'Регулярные Платежи',
    ['recurring_bills_desc'] = 'Управление подписками и регулярными платежами',
    ['transaction_history'] = 'История Транзакций',
    ['transaction_history_desc'] = 'Просмотр истории всех счетов',

    -------------------
    -- ИНДИВИДУАЛЬНЫЕ СЧЕТА
    -------------------
    ['new_bill'] = 'Новый Счет',
    ['bill_type'] = 'Тип счета',
    ['bill_details'] = 'Детали счета',
    ['bill_number'] = 'Счет #%s',
    ['amount_label'] = 'Сумма',
    ['amount_desc'] = 'Введите сумму',
    ['reason_label'] = 'Причина',
    ['reason_desc'] = 'Введите причину',
    ['amount'] = 'Сумма: $%s',
    ['amount_reason'] = 'Сумма: $%s - %s',
    ['reason'] = 'Причина: %s',
    ['bill_from'] = 'Счет от %s',

    -------------------
    -- ГРУППОВЫЕ СЧЕТА
    -------------------
    ['group_billing'] = 'Групповой Счет',
    ['group_bill'] = 'Групповой Счет',
    ['group_bill_desc'] = 'Создать общий счет для нескольких человек',
    ['group_bill_suffix'] = 'Групповой Счет',
    ['group_bill_split_equally'] = 'Разделить поровну',
    ['individual_bill'] = 'Индивидуальный Счет',
    ['individual_bill_desc'] = 'Создать счет для одного человека',
    
    -- Варианты разделения
    ['split_type'] = 'Тип разделения',
    ['split_equal'] = 'Поровну',
    ['split_percentage'] = 'По процентам',
    ['split_amount'] = 'Фиксированными суммами',
    ['total_amount'] = 'Общая сумма',
    ['enter_percentages'] = 'Введите проценты',
    ['enter_amounts'] = 'Введите суммы',
    ['percentage_not_100'] = 'Сумма процентов должна быть равна 100%',
    ['amounts_not_total'] = 'Сумма долей должна равняться общей сумме',

    -------------------
    -- СЧЕТА ОРГАНИЗАЦИИ
    -------------------
    ['new_society_bill'] = 'Новый Счет Организации',
    ['society'] = 'Организация',
    ['standard_bill'] = 'Стандартный Счет',
    ['standard_bill_desc'] = 'Создать разовый счет',
    ['select_template'] = 'Выберите шаблон или создайте свой счет',
    ['custom_bill'] = 'Пользовательский Счет',
    ['society_payment'] = 'Платеж Организации',
    ['confirm_society_bill'] = 'Сумма: $%s\nПричина: %s',

    -------------------
    -- РЕГУЛЯРНЫЕ СЧЕТА
    -------------------
    ['recurring_bill'] = 'Регулярный Платеж',
    ['recurring_bill_desc'] = 'Создать ежемесячный/регулярный платеж',
    ['recurring_bill_number'] = 'Регулярный Платеж #%s',
    ['new_recurring_bill'] = 'Новый Регулярный Платеж',
    ['recurring_payment'] = 'Регулярный Платеж',
    ['recurring_payment_suffix'] = '(Регулярный Платеж)',
    
    -- Настройки регулярных платежей
    ['subscription_type'] = 'Тип подписки',
    ['custom_subscription'] = 'Своя Подписка',
    ['select_subscription_template'] = 'Выберите шаблон или создайте свою подписку',
    ['interval_days'] = 'Интервал (дней)',
    ['interval_days_desc'] = 'Количество дней между платежами',
    ['recurring_reason_desc'] = 'Введите причину регулярного платежа',
    ['confirm_recurring_bill'] = 'Регулярный платеж $%s каждые %d дней за: %s',

    -------------------
    -- ПЛАТЕЖИ
    -------------------
    -- Способы оплаты
    ['payment_method'] = 'Способ оплаты: %s',
    ['cash'] = 'Наличные',
    ['bank'] = 'Банк',
    ['pay_cash'] = 'Оплатить наличными',
    ['pay_bank'] = 'Оплатить через банк',
    ['pay_amount_cash'] = 'Оплатить $%s наличными',
    ['pay_amount_bank'] = 'Оплатить $%s через банк',
    
    -- Авансовые платежи
    ['advance_payment'] = 'Авансовый платеж',
    ['pay_advance'] = 'Оплатить авансом',
    ['pay_advance_desc'] = 'Оплатить несколько платежей заранее',
    ['payment_amount'] = 'Сумма за платеж',
    ['payment_amount_desc'] = 'Введите сумму за каждый платеж',
    ['amount_per_payment'] = 'Сумма за платеж',
    ['confirm_advance_payment'] = 'Итого к оплате: $%s за %d платежей через %s',

    -- Счетчики и суммы
    ['payment_count'] = 'Количество платежей: %d',
    ['payments_count'] = 'Количество платежей',
    ['payments_count_desc'] = '%d платеж%s',
    ['payment_count_desc'] = 'Выберите количество авансовых платежей',
    ['total_to_pay'] = 'Итого к оплате: $%s',
    
    -- История и подтверждения
    ['payment_history'] = 'История Платежей',
    ['payment_history_desc'] = 'Просмотр истории платежей',
    ['confirm_payment'] = 'Подтвердить Платеж',
    ['payment_received'] = 'Вы получили $%s от %s',
    ['payment_made'] = 'Вы заплатили $%s для %s',
    ['payment_made_society'] = 'Вы заплатили $%s для %s',
    ['payment_made_player'] = 'Вы заплатили $%s игроку %s',
    ['bill_paid_amount'] = 'Счет на $%s оплачен',

    -------------------
    -- СТАТУС И ВРЕМЯ
    -------------------
    ['status'] = 'Статус',
    ['active'] = 'Активен',
    ['inactive'] = 'Неактивен',
    ['next_payment'] = 'Следующий платеж',
    ['today'] = 'Сегодня',
    ['tomorrow'] = 'Завтра',
    ['days_remaining'] = 'Через %d дней',
    ['days_count'] = '%d дней',
    ['interval'] = '%d дней',
    ['in_days'] = 'Через %d дней',
    ['undefined'] = 'Не определено',
    ['plural_s'] = '',

    -------------------
    -- ИСТОРИЯ
    -------------------
    ['from'] = 'от',
    ['to'] = 'кому',
    ['type'] = 'Тип',
    ['personal'] = 'Личный',
    ['bill_history_title'] = '%s Счет %s %s',
    ['no_history'] = 'Нет истории',
    ['no_history_desc'] = 'У вас нет счетов в истории',
    ['no_payments'] = 'Нет платежей',
    ['no_payments_desc'] = 'Платежи еще не производились',
    ['no_bills'] = 'Нет счетов',
    ['no_bills_desc'] = 'Счета еще не создавались',
    
    -------------------
    -- ДЕЙСТВИЯ И КНОПКИ
    -------------------
    ['accept'] = 'Принять',
    ['refuse'] = 'Отклонить',
    ['accept_bill_desc'] = 'Принять этот счет',
    ['refuse_bill_desc'] = 'Отклонить этот счет',
    ['accept_recurring_desc'] = 'Принять этот регулярный платеж',
    ['refuse_recurring_desc'] = 'Отклонить этот регулярный платеж',
    ['select_player'] = 'Выбрать игрока',
    ['select_players'] = 'Выбрать игроков',
    ['select_min_players'] = 'Выберите минимум 2 игроков',
    ['select_billing_type'] = 'Тип счета',
    ['confirmation'] = 'Подтверждение',
    ['delete_bill'] = 'Удалить счет',
    ['cancel_subscription'] = 'Отменить подписку',
    ['cancel_subscription_desc'] = 'Отменить эту подписку',
    ['confirm_delete_bill'] = 'Вы уверены, что хотите удалить этот счет?',
    ['confirm_cancel_subscription'] = 'Вы уверены, что хотите отменить эту подписку?',

    -------------------
    -- УВЕДОМЛЕНИЯ И ОШИБКИ
    -------------------
    -- Успех
    ['success'] = 'Успешно',
    ['bills_created'] = 'Счета были созданы',
    ['bill_accepted'] = 'Счет принят',
    ['bill_accepted_desc'] = 'Вы приняли счет',
    ['bill_accepted_by_receiver'] = 'Счет принят',
    ['recurring_bill_accepted'] = 'Регулярный платеж принят',
    ['recurring_bill_setup'] = 'Регулярный платеж настроен',
    ['recurring_setup_success'] = 'Регулярный платеж настроен',
    ['bill_request_sent'] = 'Запрос на оплату отправлен',
    ['recurring_bill_request_sent'] = 'Запрос на регулярный платеж отправлен',
    ['bill_deleted'] = 'Счет успешно удален',
    ['subscription_cancelled'] = 'Подписка отменена',

    -- Ошибки
    ['error'] = 'Ошибка',
    ['insufficient_rights'] = 'Недостаточно прав',
    ['cannot_load_data'] = 'Невозможно загрузить ваши данные',
    ['no_nearby_players'] = 'Нет игроков поблизости',
    ['need_multiple_players'] = 'Нужно минимум 2 игрока поблизости для создания группового счета',
    ['invalid_amount'] = 'Сумма должна быть больше 0',
    ['invalid_interval'] = 'Неверный интервал (1-365 дней)',
    ['insufficient_funds'] = 'Недостаточно средств (не хватает $%s)',
    ['bill_already_paid'] = 'Этот счет не существует или уже оплачен',
    ['bill_inactive'] = 'Этот счет больше не активен',
    ['bill_refused'] = 'Счет Отклонен',
    ['bill_refused_desc'] = 'Вы отклонили счет',
    ['bill_refused_by_receiver'] = 'Получатель отклонил счет',
    ['bill_expired'] = 'Счет Просрочен',
    ['bill_expired_desc'] = 'Срок действия счета истек',
    ['bill_deleted_amount'] = 'Счет на сумму $%s был удален',
    ['recurring_cancelled'] = 'Регулярный платеж отменен из-за неактивности',
    ['recurring_cancelled_inactivity'] = 'Подписка отменена из-за неактивности',
    ['player_disconnected_recurring'] = 'Игрок отключился, регулярный платеж отменен',
    ['player_disconnected_bill'] = 'Игрок отключился, счет отменен',

    -------------------
    -- СИСТЕМНЫЕ СООБЩЕНИЯ
    -------------------
    ['distance'] = '%d метров',
    ['version_read_error'] = '^1[illama_billing] Невозможно прочитать версию из fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Невозможно проверить версию на GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Ошибка при чтении версии с GitHub^7',
    ['new_version_available'] = '^3[illama_billing] Доступна новая версия!^7',
    ['current_version'] = '^3[illama_billing] Текущая версия: ^7%s',
    ['latest_version'] = '^3[illama_billing] Последняя версия: ^7%s',
    ['release_notes'] = '^3[illama_billing] Примечания к выпуску: ^7%s',
    ['changes_list'] = '^3[illama_billing] Изменения: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Скрипт обновлен (v%s)^7',

    ['bill_type'] = 'Тип счета',
    ['standard_bill'] = 'Стандартный счет',
    ['recurring_bill'] = 'Периодический счет',
    ['bill_interval'] = 'Интервал',
    ['bills_status'] = 'Статус счетов',
    ['check_bills'] = 'Проверить счета',
    ['check_bills_desc'] = 'Проверить текущие счета',
    ['select_player_check'] = 'Выберите игрока для проверки',
    ['days'] = 'дней',
    ['status_label'] = 'Статус',
    ['type_label'] = 'Тип',
    ['from_label'] = 'От',
    ['to_label'] = 'Кому',
    ['society_bill'] = 'Корпоративный',
    ['personal_bill'] = 'Личный',
    ['pending'] = 'В ожидании',
    ['paid'] = 'Оплачено',
    ['deleted'] = 'Удалено',
}