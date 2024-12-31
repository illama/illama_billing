Locales['ar'] = {
    -------------------
    -- القائمة الرئيسية
    -------------------
    ['billing_menu'] = 'قائمة الفواتير',
    ['open_billing_menu'] = 'فتح قائمة الفواتير',
    
    -- الأقسام الرئيسية
    ['personal_bills'] = 'الفواتير الشخصية',
    ['personal_bills_desc'] = 'إدارة فواتيرك الشخصية',
    ['society_bills'] = 'فواتير الشركة',
    ['society_bills_desc'] = 'إدارة فواتير الشركة',
    ['my_bills'] = 'فواتيري',
    ['my_bills_desc'] = 'عرض الفواتير المستلمة',
    ['recurring_bills'] = 'الاشتراكات',
    ['recurring_bills_desc'] = 'إدارة اشتراكاتك',
    ['transaction_history'] = 'سجل المعاملات',
    ['transaction_history_desc'] = 'عرض سجل جميع فواتيرك',
    ['my_recurring_bills'] = 'اشتراكاتي',

    -------------------
    -- الفواتير الفردية
    -------------------
    ['new_bill'] = 'فاتورة جديدة',
    ['bill_type'] = 'نوع الفاتورة',
    ['bill_details'] = 'تفاصيل الفاتورة',
    ['bill_number'] = 'فاتورة #%s',
    ['amount_label'] = 'المبلغ',
    ['amount_desc'] = 'أدخل المبلغ',
    ['reason_label'] = 'السبب',
    ['reason_desc'] = 'أدخل السبب',
    ['amount'] = 'المبلغ: $%s',
    ['amount_reason'] = 'المبلغ: $%s - %s',
    ['amount_and_reason'] = 'المبلغ: $%s - %s',
    ['reason'] = 'السبب: %s',
    ['bill_from'] = 'فاتورة من %s',
    ['standard_bill'] = 'فاتورة قياسية',
    ['check_bills'] = 'التحقق من الفواتير',
    ['check_bills_desc'] = 'التحقق من الفواتير الحالية',
    ['select_player_check'] = 'اختر لاعباً للتحقق',
    ['bills_status'] = 'حالة الفواتير',

    -------------------
    -- فواتير المجموعة
    -------------------
    ['group_billing'] = 'فاتورة مجموعة',
    ['group_bill'] = 'فاتورة مجموعة',
    ['group_bill_desc'] = 'إنشاء فاتورة مشتركة بين عدة أشخاص',
    ['group_bill_suffix'] = 'فاتورة مجموعة',
    ['group_bill_split_equally'] = 'تقسيم متساوٍ',
    ['individual_bill'] = 'فاتورة فردية',
    ['individual_bill_desc'] = 'إنشاء فاتورة لشخص واحد',
    
    -- التقسيم
    ['split_type'] = 'نوع التقسيم',
    ['split_equal'] = 'تقسيم متساوٍ',
    ['split_percentage'] = 'تقسيم بالنسبة المئوية',
    ['split_amount'] = 'تقسيم بمبلغ ثابت',
    ['total_amount'] = 'المبلغ الإجمالي',
    ['enter_percentages'] = 'أدخل النسب المئوية',
    ['enter_amounts'] = 'أدخل المبالغ',
    ['percentage_not_100'] = 'يجب أن يكون مجموع النسب المئوية 100%',
    ['amounts_not_total'] = 'يجب أن يكون مجموع المبالغ مساوياً للمبلغ الإجمالي',
    ['percentage_split'] = 'تقسيم بنسبة %',
    ['custom_split'] = 'تقسيم مخصص',
    ['equal_split'] = 'تقسيم متساوٍ',
    ['remaining_percentage'] = '%s - %d%% متبقي',
    ['remaining_amount'] = '%s - $%s متبقي',
    ['enter_percentage_per_player'] = 'أدخل النسبة المئوية لكل لاعب',
    ['enter_amount_per_player'] = 'أدخل المبلغ لكل لاعب',

    -- الدفع بالأقساط - القوائم والإشعارات
    ['pay_installments'] = 'الدفع على أقساط',
    ['pay_installments_desc'] = 'تقسيط الدفع على عدة أسابيع',
    ['installment_setup'] = 'إعداد الدفع بالأقساط',
    ['number_of_payments'] = 'عدد الدفعات',
    ['max_5_payments'] = 'الحد الأقصى 5 دفعات (1 في الأسبوع)',
    ['confirm_installment_plan'] = 'تأكيد خطة الدفع',
    ['payment_plan'] = 'خطة الدفع: %s',
    ['installment_status'] = 'متبقي %d دفعات من %d\nمبلغ كل دفعة: $%s',
    ['installment_details'] = 'خطة دفع على %d دفعات\nمبلغ كل دفعة: $%s\nالمبلغ الإجمالي: $%s',
    ['payment_plan_created'] = 'تم إنشاء خطة الدفع بالأقساط بنجاح',
    ['bill_accepted_with_installments'] = 'تم قبول الفاتورة مع الدفع بالأقساط',

    -- قائمة الدفع بالأقساط
    ['installment_payments'] = 'المدفوعات بالأقساط',
    ['view_payment_plans'] = 'عرض خطط الدفع الحالية',
    ['my_payment_plans'] = 'خطط الدفع الخاصة بي',
    ['payment_plan'] = 'خطة الدفع: %s',
    ['no_installment_payments'] = 'لا توجد مدفوعات بالأقساط',
    ['no_active_payment_plans'] = 'ليس لديك خطط دفع نشطة',
    ['total_remaining'] = 'المبلغ المتبقي للدفع',
    ['allow_installments'] = 'السماح بالدفع بالأقساط',
    ['allow_installments_desc'] = 'السماح بالدفع بالأقساط لهذه الفاتورة',

    -- إشعارات الدفع التلقائي
    ['installment_payment'] = 'دفع القسط',
    ['payment_processed'] = 'تم خصم دفعة $%s تلقائياً',
    ['payment_failed'] = 'فشل الدفع',
    ['insufficient_funds_installment'] = 'رصيد غير كافٍ للدفع بالأقساط',

    -------------------
    -- فواتير الشركة
    -------------------
    ['new_society_bill'] = 'فاتورة شركة جديدة',
    ['society'] = 'شركة',
    ['standard_bill'] = 'فاتورة قياسية',
    ['standard_bill_desc'] = 'إنشاء فاتورة واحدة',
    ['select_template'] = 'اختر نموذجاً أو أنشئ فاتورة مخصصة',
    ['custom_bill'] = 'فاتورة مخصصة',
    ['society_payment'] = 'دفع الشركة',
    ['confirm_society_bill'] = 'المبلغ: $%s\nالسبب: %s',
    ['society_bill'] = 'شركة',

    -------------------
    -- الفواتير المتكررة
    -------------------
    ['recurring_bill'] = 'اشتراكات',
    ['recurring_bill_desc'] = 'إنشاء اشتراك',
    ['recurring_bill_number'] = 'اشتراك #%s',
    ['new_recurring_bill'] = 'اشتراك جديد',
    ['recurring_payment'] = 'دفع الاشتراك',
    ['recurring_payment_suffix'] = '(دفع الاشتراك)',
    ['no_recurring_bills'] = 'لا توجد اشتراكات',
    ['no_recurring_bills_desc'] = 'ليس لديك أي اشتراكات',
    ['bill_interval'] = 'الفترة',
    
    -- إعدادات متكررة
    ['subscription_type'] = 'نوع الاشتراك',
    ['custom_subscription'] = 'اشتراك مخصص',
    ['select_subscription_template'] = 'اختر نموذجاً أو أنشئ اشتراكاً مخصصاً',
    ['interval_days'] = 'الفترة (أيام)',
    ['interval_days_desc'] = 'عدد الأيام بين كل دفعة',
    ['interval_days_format'] = '%d أيام',
    ['recurring_reason_desc'] = 'أدخل سبب فوترة الاشتراك',
    ['confirm_recurring_bill'] = 'اشتراك بقيمة $%s كل %d أيام لـ: %s',
    ['accept_recurring_payment'] = 'قبول الاشتراك بقيمة $%s كل %d أيام',

    -------------------
    -- المدفوعات
    -------------------
    -- طرق الدفع
    ['payment_method'] = 'طريقة الدفع: %s',
    ['cash'] = 'نقداً',
    ['bank'] = 'بنك',
    ['pay_cash'] = 'الدفع نقداً',
    ['pay_bank'] = 'الدفع عبر البنك',
    ['pay_amount_cash'] = 'دفع $%s نقداً',
    ['pay_amount_bank'] = 'دفع $%s عبر البنك',
    ['pay_amount'] = 'دفع $%s',
    
    -- المدفوعات المقدمة
    ['advance_payment'] = 'دفع مقدم',
    ['pay_advance'] = 'الدفع مقدماً',
    ['pay_advance_desc'] = 'دفع عدة أقساط مقدماً',
    ['payment_amount'] = 'مبلغ كل دفعة',
    ['payment_amount_desc'] = 'أدخل مبلغ كل دفعة',
    ['amount_per_payment'] = 'المبلغ لكل دفعة',
    ['confirm_advance_payment'] = 'المبلغ الإجمالي للدفع: $%s لـ %d دفعات عبر %s',
    ['payment_confirmation'] = 'تأكيد الدفع',

    -- العدادات والمبالغ
    ['payment_count'] = 'عدد الدفعات: %d',
    ['payments_count'] = 'عدد الدفعات',
    ['payments_count_desc'] = '%d دفعة',
    ['payment_count_desc'] = 'اختر عدد الدفعات المراد دفعها مقدماً',
    ['payments_count_label'] = 'عدد الدفعات',
    ['total_to_pay'] = 'المبلغ الإجمالي للدفع: $%s',
    
    -- السجل والتأكيدات
    ['payment_history'] = 'سجل المدفوعات',
    ['payment_history_desc'] = 'عرض سجل المدفوعات',
    ['payment_history_title'] = 'سجل المدفوعات',
    ['confirm_payment'] = 'تأكيد الدفع',
    ['payment_received'] = 'استلمت $%s من %s',
    ['payment_made'] = 'دفعت $%s إلى %s',
    ['payment_made_society'] = 'دفعت $%s إلى %s',
    ['payment_made_player'] = 'دفعت $%s إلى %s',
    ['bill_paid_amount'] = 'تم دفع فاتورة بقيمة $%s',
    ['payment_amount'] = 'دفعة بقيمة $%s',

    -------------------
    -- الحالات والوقت
    -------------------
    ['status'] = 'الحالة',
    ['status_label'] = 'الحالة',
    ['active'] = 'نشط',
    ['inactive'] = 'غير نشط',
    ['pending'] = 'معلق',
    ['paid'] = 'مدفوع',
    ['deleted'] = 'محذوف',
    ['next_payment'] = 'الدفعة التالية',
    ['next_payment_label'] = 'الدفعة التالية',
    ['today'] = 'اليوم',
    ['tomorrow'] = 'غداً',
    ['days_remaining'] = 'خلال %d أيام',
    ['days_count'] = '%d أيام',
    ['interval'] = '%d أيام',
    ['interval_label'] = 'الفترة',
    ['in_days'] = 'خلال %d أيام',
    ['undefined'] = 'غير محدد',
    ['plural_s'] = '',
    ['days'] = 'أيام',

    -------------------
    -- السجل
    -------------------
    ['from'] = 'من',
    ['to'] = 'إلى',
    ['type'] = 'النوع',
    ['type_label'] = 'النوع',
    ['from_label'] = 'من',
    ['to_label'] = 'إلى',
    ['personal'] = 'شخصي',
    ['personal_bill'] = 'شخصي',
    ['bill_history_title'] = '%s فاتورة %s %s',
    ['no_history'] = 'لا يوجد سجل',
    ['no_history_desc'] = 'لا توجد فواتير في السجل',
    ['no_payments'] = 'لا توجد مدفوعات',
    ['no_payments_desc'] = 'لم يتم إجراء أي مدفوعات بعد',
    ['no_bills'] = 'لا توجد فواتير',
    ['no_bills_desc'] = 'لم يتم إجراء أي فواتير بعد',
    
    -------------------
    -- الإجراءات والأزرار
    -------------------
    ['accept'] = 'قبول',
    ['refuse'] = 'رفض',
    ['accept_bill'] = 'قبول الفاتورة',
    ['accept_bill_desc'] = 'قبول هذه الفاتورة',
    ['accept_subscription'] = 'قبول الاشتراك',
    ['refuse_bill'] = 'رفض الفاتورة',
    ['refuse_bill_desc'] = 'رفض هذه الفاتورة',
    ['refuse_subscription'] = 'رفض الاشتراك',
    ['accept_recurring_desc'] = 'قبول هذا الاشتراك',
    ['refuse_recurring_desc'] = 'رفض هذا الاشتراك',
    ['select_player'] = 'اختيار لاعب',
    ['select_players'] = 'اختيار اللاعبين',
    ['select_min_players'] = 'اختر لاعبين على الأقل',
    ['select_billing_type'] = 'نوع الفاتورة',
    ['confirmation'] = 'تأكيد',
    ['delete_bill'] = 'حذف الفاتورة',
    ['delete_bill_desc'] = 'سيتم طلب تأكيد الحذف.',
    ['cancel_subscription'] = 'إلغاء الاشتراك',
    ['cancel_subscription_desc'] = 'إلغاء هذا الاشتراك',
    ['confirm_delete_bill'] = 'هل أنت متأكد من رغبتك في حذف هذه الفاتورة؟',
    ['confirm_cancel_subscription'] = 'هل أنت متأكد من رغبتك في إلغاء هذا الاشتراك؟',
    ['unknown_player'] = 'مجهول',
    ['close'] = 'إغلاق',
    ['info'] = 'معلومات',
    ['click_to_export'] = 'انقر على فاتورة لعرضها',
    ['require_signature'] = 'التوقيع مطلوب',
    ['require_signature_desc'] = 'طلب توقيع لهذه الفاتورة',
    ['signature_required'] = 'التوقيع مطلوب',
    ['enter_signature'] = 'توقيعك',
    ['signature_desc'] = 'الرجاء التوقيع لتأكيد الفاتورة',
    ['signature_placeholder'] = 'توقيعك هنا',
    ['signature'] = 'التوقيع',
    ['not_signed'] = 'غير موقع',
    ['signed_by'] = 'موقع من قبل',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- الإشعارات والأخطاء
    -------------------
    -- النجاح
    ['success'] = 'نجاح',
    ['bills_created'] = 'تم إنشاء الفواتير',
    ['bill_accepted'] = 'تم قبول الفاتورة',
    ['bill_accepted_desc'] = 'لقد قبلت الفاتورة',
    ['bill_accepted_by_receiver'] = 'تم قبول الفاتورة',
    ['recurring_bill_accepted'] = 'تم قبول الاشتراك',
    ['recurring_bill_setup'] = 'تم إعداد فوترة الاشتراك',
    ['recurring_setup_success'] = 'تم إنشاء الاشتراك',
    ['bill_request_sent'] = 'تم إرسال طلب الفاتورة',
    ['recurring_bill_request_sent'] = 'تم إرسال طلب فاتورة الاشتراك',
    ['bill_deleted'] = 'تم حذف الفاتورة بنجاح',
    ['subscription_cancelled'] = 'تم إلغاء الاشتراك',

    -- الأخطاء
    ['error'] = 'خطأ',
    ['insufficient_rights'] = 'ليس لديك الصلاحيات الكافية',
    ['cannot_load_data'] = 'تعذر تحميل بياناتك',
    ['no_nearby_players'] = 'لا يوجد لاعبون في المنطقة المجاورة',
    ['need_multiple_players'] = 'يجب وجود لاعبين على الأقل في المنطقة المجاورة لإنشاء فاتورة مجموعة',
    ['invalid_amount'] = 'يجب أن يكون المبلغ أكبر من 0',
    ['invalid_interval'] = 'فترة غير صالحة (1-365 يوم)',
    ['insufficient_funds'] = 'ليس لديك مال كافٍ (ينقص $%s)',
    ['bill_already_paid'] = 'هذه الفاتورة غير موجودة أو تم دفعها بالفعل',
    ['bill_inactive'] = 'هذه الفاتورة لم تعد نشطة',
    ['bill_refused'] = 'تم رفض الفاتورة',
    ['bill_refused_desc'] = 'لقد رفضت الفاتورة',
    ['bill_refused_by_receiver'] = 'رفض المستلم الفاتورة',
    ['bill_expired'] = 'الفاتورة منتهية الصلاحية',
    ['bill_expired_desc'] = 'انتهت صلاحية الفاتورة',
    ['bill_deleted_amount'] = 'تم حذف فاتورة بقيمة $%s',
    ['recurring_cancelled'] = 'تم إلغاء اشتراك لعدم النشاط',
    ['recurring_cancelled_inactivity'] = 'تم إلغاء الاشتراك لعدم النشاط',
    ['player_disconnected_recurring'] = 'انقطع اتصال اللاعب، تم إلغاء فاتورة الاشتراك',
    ['player_disconnected_bill'] = 'انقطع اتصال اللاعب، تم إلغاء الفاتورة',
    ['invalid_description'] = 'يمكن أن يحتوي الوصف على أحرف ومسافات فقط',

    -------------------
    -- رسائل النظام
    -------------------
    ['distance'] = '%d متر',
    ['version_read_error'] = '^1[illama_billing] تعذر قراءة الإصدار من fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] تعذر التحقق من الإصدار على GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] خطأ في قراءة إصدار GitHub^7',
    ['new_version_available'] = '^3[illama_billing] يتوفر إصدار جديد!^7',
    ['current_version'] = '^3[illama_billing] الإصدار الحالي: ^7%s',
    ['latest_version'] = '^3[illama_billing] أحدث إصدار: ^7%s',
    ['release_notes'] = '^3[illama_billing] ملاحظات الإصدار: ^7%s',
    ['changes_list'] = '^3[illama_billing] التغييرات: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] البرنامج النصي محدث (v%s)^7',
    ['system_disabled_title'] = 'نظام الفواتير معطل',
    ['system_disabled_desc'] = 'النظام معطل بسبب خطأ في التكوين',
    ['system_error'] = 'خطأ في النظام',
    ['system_disabled_contact_admin'] = 'نظام الفواتير معطل.\nاتصل بالمسؤول',
    ['feature_disabled'] = 'هذه الميزة معطلة',

    -------------------
    -- نظام العلامات
    -------------------
    ['filter_by_tags'] = 'تصفية حسب العلامات',
    ['filter_tags_desc'] = 'تصفية الفواتير حسب العلامات',
    ['manage_tags'] = 'إدارة العلامات',
    ['manage_tags_desc'] = 'إضافة أو إزالة علامات لهذه الفاتورة',
    ['add_tag'] = 'إضافة علامة',
    ['add_tag_desc'] = 'أدخل علامة جديدة لهذه الفاتورة',
    ['tag_placeholder'] = 'مثال: مهم، شخصي، عمل',
    ['tag_added'] = 'تمت إضافة العلامة بنجاح',
    ['show_all'] = 'عرض جميع الفواتير',
    ['show_all_desc'] = 'إزالة تصفية العلامات',
    ['filter_by_tag_desc'] = 'عرض الفواتير بهذه العلامة',
    ['current_filter'] = 'التصفية الحالية',
    ['filtered_by_tag'] = 'عرض الفواتير المعلمة بـ: %s',
    ['change_filter'] = 'تغيير التصفية',
    ['change_filter_desc'] = 'اختيار علامة أخرى للتصفية',
    ['filtered_transaction_history'] = 'سجل المعاملات المصفى',
    ['no_bills_found'] = 'لم يتم العثور على فواتير',
    ['no_bills_with_tag'] = 'لم يتم العثور على فواتير بالعلامة: %s',
    ['bill_actions'] = 'إجراءات الفاتورة',
    ['no_tags'] = 'لا توجد علامات',
    ['no_tags_desc'] = 'لم تتم إضافة أي علامات لهذه الفاتورة',
    ['add_new_tag'] = 'إضافة علامة جديدة',
    ['remove_tag_desc'] = 'انقر لإزالة هذه العلامة',
    ['tag_removed'] = 'تمت إزالة العلامة بنجاح',
    ['tag_name'] = 'اسم العلامة',
    ['tag_name_desc'] = 'أدخل اسم العلامة الجديدة',
    ['export_bill'] = 'تصدير الفاتورة',
    ['export_bill_desc'] = 'تصدير الفاتورة كصورة',

    -------------------
    -- الأمان
    -------------------
    ['billing_system_error'] = 'خطأ - نظام الفواتير',
    ['script_disabled_wrong_name'] = 'تم تعطيل البرنامج النصي لأن اسم المورد غير صحيح!',
    ['expected_name'] = 'الاسم المتوقع: ^3%s^7',
    ['current_name'] = 'الاسم الحالي: ^3%s^7',
    ['rename_folder_instruction'] = 'يرجى إعادة تسمية المجلد لإعادة تفعيل البرنامج النصي.',
    ['contact_support'] = 'اتصل بالدعم إذا كنت بحاجة إلى مساعدة.',
    ['invalid_resource_name'] = 'اسم المورد غير صالح!',
    ['manifest_version'] = 'إصدار الملف التعريفي: %s',
    ['script_disabled_security'] = 'تم تعطيل البرنامج النصي لأسباب أمنية.',

    ['webhook_bot_name'] = 'نظام الفواتير',
    ['webhook_footer'] = 'تم الإرسال في %s',
    
    -- Webhooks - العناوين
    ['webhook_bill_created_title'] = '📥 فاتورة جديدة',
    ['webhook_bill_paid_title'] = '💰 تم دفع الفاتورة',
    ['webhook_bill_deleted_title'] = '🗑️ تم حذف الفاتورة',
    ['webhook_recurring_created_title'] = '🔄 فاتورة متكررة جديدة',
    ['webhook_recurring_payment_title'] = '💳 دفع متكرر',
    ['webhook_recurring_cancelled_title'] = '⛔ تم إلغاء الاشتراك',
    ['webhook_installment_created_title'] = '📋 خطة دفع جديدة',
    ['webhook_installment_payment_title'] = '💸 دفع بالأقساط',
    
    -- Webhooks - الأوصاف
    ['webhook_bill_created_desc'] = 'تم إنشاء فاتورة بقيمة $%s بواسطة %s لـ %s',
    ['webhook_bill_paid_desc'] = 'تم دفع فاتورة بقيمة $%s بواسطة %s',
    ['webhook_bill_deleted_desc'] = 'تم حذف فاتورة بقيمة $%s بواسطة %s',
    ['webhook_recurring_created_desc'] = 'تم إنشاء اشتراك بقيمة $%s لـ %s (%s أيام)',
    ['webhook_recurring_payment_desc'] = 'تم إنشاء دفع متكرر بقيمة $%s لـ %s',
    ['webhook_recurring_cancelled_desc'] = 'تم إلغاء اشتراك بقيمة $%s بواسطة %s',
    ['webhook_installment_created_desc'] = 'تم إنشاء خطة دفع بقيمة $%s لـ %s (%s دفعات)',
    ['webhook_installment_payment_desc'] = 'تم إجراء دفع بالأقساط بقيمة $%s بواسطة %s',
    
    -- Webhooks - الحقول
    ['webhook_amount'] = 'المبلغ',
    ['webhook_reason'] = 'السبب',
    ['webhook_payment_method'] = 'طريقة الدفع',
    ['webhook_payment_bank'] = 'بنك',
    ['webhook_payment_cash'] = 'نقداً',
    ['webhook_bill_id'] = 'رقم الفاتورة',
    ['webhook_amount_per_payment'] = 'المبلغ لكل دفعة',
    ['webhook_total_payments'] = 'عدد الدفعات',
    ['webhook_remaining_payments'] = 'الدفعات المتبقية',
    ['webhook_total_amount'] = 'المبلغ الإجمالي',
    ['webhook_next_payment'] = 'الدفعة التالية',
    ['webhook_interval'] = 'الفترة',
    ['webhook_days_count'] = '%s أيام',
    ['webhook_type'] = 'النوع',
    ['webhook_type_personal'] = 'شخصي',
    ['webhook_script_start_title'] = '🚀 تم تشغيل البرنامج النصي',
    ['webhook_script_start_desc'] = 'تم تشغيل نظام الفواتير بنجاح',
    ['webhook_version'] = 'الإصدار',
    ['webhook_framework'] = 'الإطار'
}