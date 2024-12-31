Locales['es'] = {
    -------------------
    -- MENÚ PRINCIPAL
    -------------------
    ['billing_menu'] = 'Menú de Facturación',
    ['open_billing_menu'] = 'Abrir menú de facturación',
    
    -- Secciones principales
    ['personal_bills'] = 'Facturas Personales',
    ['personal_bills_desc'] = 'Gestionar tus facturas personales',
    ['society_bills'] = 'Facturas de Empresa',
    ['society_bills_desc'] = 'Gestionar facturas de empresa',
    ['my_bills'] = 'Mis Facturas',
    ['my_bills_desc'] = 'Ver facturas recibidas',
    ['recurring_bills'] = 'Suscripciones',
    ['recurring_bills_desc'] = 'Gestionar tus suscripciones',
    ['transaction_history'] = 'Historial de Transacciones',
    ['transaction_history_desc'] = 'Ver historial de todas tus facturas',
    ['my_recurring_bills'] = 'Mis suscripciones',

    -------------------
    -- FACTURAS INDIVIDUALES
    -------------------
    ['new_bill'] = 'Nueva Factura',
    ['bill_type'] = 'Tipo de factura',
    ['bill_details'] = 'Detalles de la factura',
    ['bill_number'] = 'Factura #%s',
    ['amount_label'] = 'Importe',
    ['amount_desc'] = 'Ingresa el importe',
    ['reason_label'] = 'Motivo',
    ['reason_desc'] = 'Ingresa el motivo',
    ['amount'] = 'Importe: $%s',
    ['amount_reason'] = 'Importe: $%s - %s',
    ['amount_and_reason'] = 'Importe: $%s - %s',
    ['reason'] = 'Motivo: %s',
    ['bill_from'] = 'Factura de %s',
    ['standard_bill'] = 'Factura estándar',
    ['check_bills'] = 'Revisar facturas',
    ['check_bills_desc'] = 'Revisar facturas actuales',
    ['select_player_check'] = 'Seleccionar jugador a revisar',
    ['bills_status'] = 'Estado de facturas',

    -------------------
    -- FACTURAS GRUPALES
    -------------------
    ['group_billing'] = 'Factura grupal',
    ['group_bill'] = 'Factura grupal',
    ['group_bill_desc'] = 'Crear una factura compartida entre varias personas',
    ['group_bill_suffix'] = 'Factura grupal',
    ['group_bill_split_equally'] = 'División equitativa',
    ['individual_bill'] = 'Factura individual',
    ['individual_bill_desc'] = 'Crear una factura para una sola persona',
    
    -- División
    ['split_type'] = 'Tipo de división',
    ['split_equal'] = 'División equitativa',
    ['split_percentage'] = 'División por porcentaje',
    ['split_amount'] = 'División por monto fijo',
    ['total_amount'] = 'Importe total',
    ['enter_percentages'] = 'Ingresa los porcentajes',
    ['enter_amounts'] = 'Ingresa los importes',
    ['percentage_not_100'] = 'La suma de porcentajes debe ser igual a 100%',
    ['amounts_not_total'] = 'La suma de importes debe ser igual al importe total',
    ['percentage_split'] = 'División por %',
    ['custom_split'] = 'División personalizada',
    ['equal_split'] = 'División equitativa',
    ['remaining_percentage'] = '%s - %d%% restante',
    ['remaining_amount'] = '%s - $%s restante',
    ['enter_percentage_per_player'] = 'Ingresa el porcentaje para cada jugador',
    ['enter_amount_per_player'] = 'Ingresa el importe para cada jugador',

    -- Pago en cuotas - Menús y notificaciones
    ['pay_installments'] = 'Pagar en cuotas',
    ['pay_installments_desc'] = 'Dividir el pago en varias semanas',
    ['installment_setup'] = 'Configuración de pago en cuotas',
    ['number_of_payments'] = 'Número de pagos',
    ['max_5_payments'] = 'Máximo 5 pagos (1 por semana)',
    ['confirm_installment_plan'] = 'Confirmar plan de pago',
    ['payment_plan'] = 'Plan de pago: %s',  -- 1 argumento
    ['installment_status'] = '%d pagos restantes de %d\nImporte por pago: $%s', -- 3 argumentos
    ['installment_details'] = 'Plan de pago en %d cuotas\nImporte por pago: $%s\nImporte total: $%s', -- 3 argumentos
    ['payment_plan_created'] = 'Plan de pago en cuotas creado exitosamente',
    ['bill_accepted_with_installments'] = 'La factura ha sido aceptada con pago en cuotas',

    -- Menú de pagos en cuotas
    ['installment_payments'] = 'Pagos en cuotas',
    ['view_payment_plans'] = 'Ver mis planes de pago actuales',
    ['my_payment_plans'] = 'Mis pagos en cuotas',
    ['payment_plan'] = 'Plan de pago: %s',
    ['no_installment_payments'] = 'Sin pagos en cuotas',
    ['no_active_payment_plans'] = 'No tienes planes de pago activos',
    ['total_remaining'] = 'Importe restante por pagar',
    ['allow_installments'] = 'Permitir pagos en cuotas',
    ['allow_installments_desc'] = 'Permitir pagos en cuotas para esta factura',

    -- Notificaciones de pago automático
    ['installment_payment'] = 'Pago en cuotas',
    ['payment_processed'] = 'Pago de $%s deducido automáticamente',
    ['payment_failed'] = 'Pago fallido',
    ['insufficient_funds_installment'] = 'Fondos insuficientes para el pago en cuotas',

    -------------------
    -- FACTURAS DE EMPRESA
    -------------------
    ['new_society_bill'] = 'Nueva Factura de Empresa',
    ['society'] = 'Empresa',
    ['standard_bill'] = 'Factura Estándar',
    ['standard_bill_desc'] = 'Crear una factura única',
    ['select_template'] = 'Elige una plantilla o crea una factura personalizada',
    ['custom_bill'] = 'Factura Personalizada',
    ['society_payment'] = 'Pago de Empresa',
    ['confirm_society_bill'] = 'Importe: $%s\nMotivo: %s',
    ['society_bill'] = 'Empresa',

    -------------------
    -- FACTURAS RECURRENTES
    -------------------
    ['recurring_bill'] = 'Suscripciones',
    ['recurring_bill_desc'] = 'Crear una suscripción',
    ['recurring_bill_number'] = 'Suscripción #%s',
    ['new_recurring_bill'] = 'Nueva suscripción',
    ['recurring_payment'] = 'Pago de suscripción',
    ['recurring_payment_suffix'] = '(Pago de suscripción)',
    ['no_recurring_bills'] = 'Sin suscripciones',
    ['no_recurring_bills_desc'] = 'No tienes suscripciones',
    ['bill_interval'] = 'Intervalo',
    
    -- Configuración recurrente
    ['subscription_type'] = 'Tipo de suscripción',
    ['custom_subscription'] = 'Suscripción Personalizada',
    ['select_subscription_template'] = 'Elige una plantilla o crea una suscripción personalizada',
    ['interval_days'] = 'Intervalo (días)',
    ['interval_days_desc'] = 'Número de días entre cada pago',
    ['interval_days_format'] = '%d días',
    ['recurring_reason_desc'] = 'Ingresa el motivo de la facturación de la suscripción',
    ['confirm_recurring_bill'] = 'Suscripción de $%s cada %d días para: %s',
    ['accept_recurring_payment'] = 'Aceptar suscripción de $%s cada %d días',

    -------------------
    -- PAGOS
    -------------------
    -- Métodos de pago
    ['payment_method'] = 'Método de pago: %s',
    ['cash'] = 'Efectivo',
    ['bank'] = 'Banco',
    ['pay_cash'] = 'Pagar en efectivo',
    ['pay_bank'] = 'Pagar por banco',
    ['pay_amount_cash'] = 'Pagar $%s en efectivo',
    ['pay_amount_bank'] = 'Pagar $%s por banco',
    ['pay_amount'] = 'Pagar $%s',
    
    -- Pagos anticipados
    ['advance_payment'] = 'Pago anticipado',
    ['pay_advance'] = 'Pagar por adelantado',
    ['pay_advance_desc'] = 'Pagar varias cuotas por adelantado',
    ['payment_amount'] = 'Importe por pago',
    ['payment_amount_desc'] = 'Ingresa el importe de cada pago',
    ['amount_per_payment'] = 'Importe por pago',
    ['confirm_advance_payment'] = 'Total a pagar: $%s por %d pagos mediante %s',
    ['payment_confirmation'] = 'Confirmación de pago',

    -- Contadores e importes
    ['payment_count'] = 'Número de pagos: %d',
    ['payments_count'] = 'Número de pagos',
    ['payments_count_desc'] = '%d pago%s',
    ['payment_count_desc'] = 'Elige el número de pagos a realizar por adelantado',
    ['payments_count_label'] = 'Número de pagos',
    ['total_to_pay'] = 'Total a pagar: $%s',
    
    -- Historial y confirmaciones
    ['payment_history'] = 'Historial de pagos',
    ['payment_history_desc'] = 'Ver historial de pagos',
    ['payment_history_title'] = 'Historial de Pagos',
    ['confirm_payment'] = 'Confirmar pago',
    ['payment_received'] = 'Has recibido $%s de %s',
    ['payment_made'] = 'Has pagado $%s a %s',
    ['payment_made_society'] = 'Has pagado $%s a %s',
    ['payment_made_player'] = 'Has pagado $%s a %s',
    ['bill_paid_amount'] = 'Factura de $%s pagada',
    ['payment_amount'] = 'Pago de $%s',

    -------------------
    -- ESTADO Y TIEMPO
    -------------------
    ['status'] = 'Estado',
    ['status_label'] = 'Estado',
    ['active'] = 'Activo',
    ['inactive'] = 'Inactivo',
    ['pending'] = 'Pendiente',
    ['paid'] = 'Pagado',
    ['deleted'] = 'Eliminado',
    ['next_payment'] = 'Próximo pago',
    ['next_payment_label'] = 'Próximo pago',
    ['today'] = 'Hoy',
    ['tomorrow'] = 'Mañana',
    ['days_remaining'] = 'En %d días',
    ['days_count'] = '%d días',
    ['interval'] = '%d días',
    ['interval_label'] = 'Intervalo',
    ['in_days'] = 'En %d días',
    ['undefined'] = 'No definido',
    ['plural_s'] = 's',
    ['days'] = 'días',

    -------------------
    -- HISTORIAL
    -------------------
    ['from'] = 'de',
    ['to'] = 'a',
    ['type'] = 'Tipo',
    ['type_label'] = 'Tipo',
    ['from_label'] = 'De',
    ['to_label'] = 'A',
    ['personal'] = 'Personal',
    ['personal_bill'] = 'Personal',
    ['bill_history_title'] = '%s Factura %s %s',
    ['no_history'] = 'Sin historial',
    ['no_history_desc'] = 'No tienes facturas en el historial',
    ['no_payments'] = 'Sin pagos',
    ['no_payments_desc'] = 'No se han realizado pagos aún',
    ['no_bills'] = 'Sin facturas',
    ['no_bills_desc'] = 'No se han realizado facturas aún',
    
    -------------------
    -- ACCIONES Y BOTONES
    -------------------
    ['accept'] = 'Aceptar',
    ['refuse'] = 'Rechazar',
    ['accept_bill'] = 'Aceptar factura',
    ['accept_bill_desc'] = 'Aceptar esta factura',
    ['accept_subscription'] = 'Aceptar suscripción',
    ['refuse_bill'] = 'Rechazar factura',
    ['refuse_bill_desc'] = 'Rechazar esta factura',
    ['refuse_subscription'] = 'Rechazar suscripción',
    ['accept_recurring_desc'] = 'Aceptar esta suscripción',
    ['refuse_recurring_desc'] = 'Rechazar esta suscripción',
    ['select_player'] = 'Seleccionar jugador',
    ['select_players'] = 'Seleccionar jugadores',
    ['select_min_players'] = 'Selecciona al menos 2 jugadores',
    ['select_billing_type'] = 'Tipo de factura',
    ['confirmation'] = 'Confirmación',
    ['delete_bill'] = 'Eliminar factura',
    ['delete_bill_desc'] = 'Se solicitará confirmación de eliminación.',
    ['cancel_subscription'] = 'Cancelar suscripción',
    ['cancel_subscription_desc'] = 'Cancelar esta suscripción',
    ['confirm_delete_bill'] = '¿Estás seguro de que deseas eliminar esta factura?',
    ['confirm_cancel_subscription'] = '¿Estás seguro de que deseas cancelar esta suscripción?',
    ['unknown_player'] = 'Desconocido',
    ['close'] = 'Cerrar',
    ['info'] = 'Información',
    ['click_to_export'] = 'Haz clic en una factura para verla',
    ['require_signature'] = 'Firma requerida',
    ['require_signature_desc'] = 'Solicitar una firma para esta factura',
    ['signature_required'] = 'Firma requerida',
    ['enter_signature'] = 'Tu firma',
    ['signature_desc'] = 'Por favor firma para confirmar la factura',
    ['signature_placeholder'] = 'Tu firma aquí',
    ['signature'] = 'Firma',
    ['not_signed'] = 'Sin firmar',
    ['signed_by'] = 'Firmado por',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- NOTIFICACIONES Y ERRORES
    -------------------
    -- Éxito
    ['success'] = 'Éxito',
    ['bills_created'] = 'Las facturas han sido creadas',
    ['bill_accepted'] = 'Factura aceptada',
    ['bill_accepted_desc'] = 'Has aceptado la factura',
    ['bill_accepted_by_receiver'] = 'Factura aceptada',
    ['recurring_bill_accepted'] = 'Suscripción aceptada',
    ['recurring_bill_setup'] = 'La facturación de la suscripción ha sido configurada',
    ['recurring_setup_success'] = 'La suscripción ha sido configurada',
    ['bill_request_sent'] = 'Solicitud de factura enviada',
    ['recurring_bill_request_sent'] = 'Solicitud de factura de suscripción enviada',
    ['bill_deleted'] = 'Factura eliminada exitosamente',
    ['subscription_cancelled'] = 'Suscripción cancelada',

    -- Errores
    ['error'] = 'Error',
    ['insufficient_rights'] = 'No tienes los derechos necesarios',
    ['cannot_load_data'] = 'No se pueden cargar tus datos',
    ['no_nearby_players'] = 'No hay jugadores cerca',
    ['need_multiple_players'] = 'Se necesitan al menos 2 jugadores cerca para crear una factura grupal',
    ['invalid_amount'] = 'El importe debe ser mayor a 0',
    ['invalid_interval'] = 'Intervalo inválido (1-365 días)',
    ['insufficient_funds'] = 'No tienes suficiente dinero (faltan $%s)',
    ['bill_already_paid'] = 'Esta factura no existe o ya ha sido pagada',
    ['bill_inactive'] = 'Esta factura ya no está activa',
    ['bill_refused'] = 'Factura Rechazada',
    ['bill_refused_desc'] = 'Has rechazado la factura',
    ['bill_refused_by_receiver'] = 'El destinatario ha rechazado la factura',
    ['bill_expired'] = 'Factura Vencida',
    ['bill_expired_desc'] = 'La factura ha vencido',
    ['bill_deleted_amount'] = 'Una factura de $%s ha sido eliminada',
    ['recurring_cancelled'] = 'Una suscripción ha sido cancelada por inactividad',
    ['recurring_cancelled_inactivity'] = 'La suscripción ha sido cancelada por inactividad',
    ['player_disconnected_recurring'] = 'Jugador desconectado, factura de suscripción cancelada',
    ['player_disconnected_bill'] = 'Jugador desconectado, factura cancelada',
    ['invalid_description'] = 'La descripción solo puede contener letras y espacios',

    -------------------
    -- MENSAJES DEL SISTEMA
    -------------------
    ['distance'] = '%d metros',
    ['version_read_error'] = '^1[illama_billing] No se puede leer la versión desde fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] No se puede verificar la versión en GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Error al leer la versión de GitHub^7',
    ['new_version_available'] = '^3[illama_billing] ¡Una nueva versión está disponible!^7',
    ['current_version'] = '^3[illama_billing] Versión actual: ^7%s',
    ['latest_version'] = '^3[illama_billing] Última versión: ^7%s',
    ['release_notes'] = '^3[illama_billing] Notas de la versión: ^7%s',
    ['changes_list'] = '^3[illama_billing] Cambios: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] El script está actualizado (v%s)^7',
    ['system_disabled_title'] = 'Sistema de Facturación Desactivado',
    ['system_disabled_desc'] = 'El sistema está desactivado debido a un error de configuración',
    ['system_error'] = 'Error del Sistema',
    ['system_disabled_contact_admin'] = 'El sistema de facturación está desactivado.\nContacta a un administrador',
    ['feature_disabled'] = 'Esta función está desactivada',

    -------------------
    -- SISTEMA DE ETIQUETAS
    -------------------
    ['filter_by_tags'] = 'Filtrar por etiquetas',
    ['filter_tags_desc'] = 'Filtrar facturas por etiquetas',
    ['manage_tags'] = 'Gestionar etiquetas',
    ['manage_tags_desc'] = 'Añadir o eliminar etiquetas para esta factura',
    ['add_tag'] = 'Añadir etiqueta',
    ['add_tag_desc'] = 'Ingresa una nueva etiqueta para esta factura',
    ['tag_placeholder'] = 'ej: Importante, Personal, Trabajo',
    ['tag_added'] = 'Etiqueta añadida exitosamente',
    ['show_all'] = 'Mostrar todas las facturas',
    ['show_all_desc'] = 'Eliminar filtros de etiquetas',
    ['filter_by_tag_desc'] = 'Mostrar facturas con esta etiqueta',
    ['current_filter'] = 'Filtro actual',
    ['filtered_by_tag'] = 'Mostrando facturas etiquetadas con: %s',
    ['change_filter'] = 'Cambiar filtro',
    ['change_filter_desc'] = 'Seleccionar otra etiqueta para filtrar',
    ['filtered_transaction_history'] = 'Historial de transacciones filtrado',
    ['no_bills_found'] = 'No se encontraron facturas',
    ['no_bills_with_tag'] = 'No se encontraron facturas con la etiqueta: %s',
    ['bill_actions'] = 'Acciones de la factura',
    ['no_tags'] = 'Sin etiquetas',
    ['no_tags_desc'] = 'No se han añadido etiquetas a esta factura',
    ['add_new_tag'] = 'Añadir nueva etiqueta',
    ['remove_tag_desc'] = 'Haz clic para eliminar esta etiqueta',
    ['tag_removed'] = 'Etiqueta eliminada exitosamente',
    ['tag_name'] = 'Nombre de la etiqueta',
    ['tag_name_desc'] = 'Ingresa el nombre de la nueva etiqueta',
    ['export_bill'] = 'Exportar factura',
    ['export_bill_desc'] = 'Exportar factura como imagen',

    -------------------
    -- SEGURIDAD
    -------------------
    ['billing_system_error'] = 'ERROR - SISTEMA DE FACTURACIÓN',
    ['error'] = 'ERROR',
    ['script_disabled_wrong_name'] = '¡El script está desactivado porque el nombre del recurso es incorrecto!',
    ['expected_name'] = 'Nombre esperado: ^3%s^7',
    ['current_name'] = 'Nombre actual: ^3%s^7',
    ['rename_folder_instruction'] = 'Por favor renombra la carpeta para reactivar el script.',
    ['contact_support'] = 'Contacta al soporte si necesitas ayuda.',
    ['invalid_resource_name'] = '¡Nombre de recurso inválido!',
    ['manifest_version'] = 'Versión del manifiesto: %s',
    ['script_disabled_security'] = 'El script está desactivado por razones de seguridad.',

    ['webhook_bot_name'] = 'Sistema de Facturación',
    ['webhook_footer'] = 'Enviado el %s',
    
    -- Webhooks - Títulos
    ['webhook_bill_created_title'] = '📥 Nueva Factura',
    ['webhook_bill_paid_title'] = '💰 Factura Pagada',
    ['webhook_bill_deleted_title'] = '🗑️ Factura Eliminada',
    ['webhook_recurring_created_title'] = '🔄 Nueva Factura Recurrente',
    ['webhook_recurring_payment_title'] = '💳 Pago Recurrente',
    ['webhook_recurring_cancelled_title'] = '⛔ Suscripción Cancelada',
    ['webhook_installment_created_title'] = '📋 Nuevo Plan de Pago',
    ['webhook_installment_payment_title'] = '💸 Pago en Cuotas',
    
    -- Webhooks - Descripciones
    ['webhook_bill_created_desc'] = 'Una factura de $%s ha sido creada por %s para %s',
    ['webhook_bill_paid_desc'] = 'Una factura de $%s ha sido pagada por %s',
    ['webhook_bill_deleted_desc'] = 'Una factura de $%s ha sido eliminada por %s',
    ['webhook_recurring_created_desc'] = 'Una suscripción de $%s ha sido creada para %s (%s días)',
    ['webhook_recurring_payment_desc'] = 'Un pago recurrente de $%s ha sido creado para %s',
    ['webhook_recurring_cancelled_desc'] = 'Una suscripción de $%s ha sido cancelada por %s',
    ['webhook_installment_created_desc'] = 'Un plan de pago de $%s ha sido creado para %s (%s pagos)',
    ['webhook_installment_payment_desc'] = 'Un pago en cuotas de $%s ha sido realizado por %s',
    
    -- Webhooks - Campos
    ['webhook_amount'] = 'Importe',
    ['webhook_reason'] = 'Motivo',
    ['webhook_payment_method'] = 'Método de pago',
    ['webhook_payment_bank'] = 'Banco',
    ['webhook_payment_cash'] = 'Efectivo',
    ['webhook_bill_id'] = 'ID de Factura',
    ['webhook_amount_per_payment'] = 'Importe por pago',
    ['webhook_total_payments'] = 'Número de pagos',
    ['webhook_remaining_payments'] = 'Pagos restantes',
    ['webhook_total_amount'] = 'Importe total',
    ['webhook_next_payment'] = 'Próximo pago',
    ['webhook_interval'] = 'Intervalo',
    ['webhook_days_count'] = '%s días',
    ['webhook_type'] = 'Tipo',
    ['webhook_type_personal'] = 'Personal',
    ['webhook_script_start_title'] = '🚀 Script Iniciado',
    ['webhook_script_start_desc'] = 'El sistema de facturación se ha iniciado exitosamente',
    ['webhook_version'] = 'Versión',
    ['webhook_framework'] = 'Framework'
}