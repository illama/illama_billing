Locales['es'] = {
    -------------------
    -- MENÚ PRINCIPAL
    -------------------
    ['billing_menu'] = 'Menú de Facturación',
    ['open_billing_menu'] = 'Abrir el menú de facturación',
    
    -- Secciones principales
    ['personal_bills'] = 'Facturas Personales',
    ['personal_bills_desc'] = 'Gestiona tus facturas personales',
    ['society_bills'] = 'Facturas de la Empresa',
    ['society_bills_desc'] = 'Gestiona las facturas de la empresa',
    ['my_bills'] = 'Mis Facturas',
    ['my_bills_desc'] = 'Ver facturas recibidas',
    ['recurring_bills'] = 'Facturas Recurrentes',
    ['recurring_bills_desc'] = 'Gestiona tus suscripciones y pagos recurrentes',
    ['transaction_history'] = 'Historial de Transacciones',
    ['transaction_history_desc'] = 'Ver todo el historial de facturas',
    ['my_recurring_bills'] = 'Mis Facturas Recurrentes',

    -------------------
    -- FACTURAS INDIVIDUALES
    -------------------
    ['new_bill'] = 'Nueva Factura',
    ['bill_type'] = 'Tipo de Factura',
    ['bill_details'] = 'Detalles de la Factura',
    ['bill_number'] = 'Factura #%s',
    ['amount_label'] = 'Cantidad',
    ['amount_desc'] = 'Ingresa la cantidad',
    ['reason_label'] = 'Razón',
    ['reason_desc'] = 'Ingresa la razón',
    ['amount'] = 'Cantidad: $%s',
    ['amount_reason'] = 'Cantidad: $%s - %s',
    ['amount_and_reason'] = 'Cantidad: $%s - %s',
    ['reason'] = 'Razón: %s',
    ['bill_from'] = 'Factura de %s',
    ['standard_bill'] = 'Factura Estándar',
    ['check_bills'] = 'Verificar Facturas',
    ['check_bills_desc'] = 'Verificar facturas en curso',
    ['select_player_check'] = 'Seleccionar un jugador para verificar',
    ['bills_status'] = 'Estado de las Facturas',

    -------------------
    -- FACTURAS EN GRUPO
    -------------------
    ['group_billing'] = 'Facturación en Grupo',
    ['group_bill'] = 'Factura en Grupo',
    ['group_bill_desc'] = 'Crea una factura compartida entre varias personas',
    ['group_bill_suffix'] = 'Factura en Grupo',
    ['group_bill_split_equally'] = 'División Igual',
    ['individual_bill'] = 'Factura Individual',
    ['individual_bill_desc'] = 'Crea una factura para una sola persona',
    
    -- Opciones de división
    ['split_type'] = 'Tipo de División',
    ['split_equal'] = 'División Igual',
    ['split_percentage'] = 'División por Porcentaje',
    ['split_amount'] = 'División por Cantidad Fija',
    ['total_amount'] = 'Total a Pagar',
    ['enter_percentages'] = 'Ingresa porcentajes',
    ['enter_amounts'] = 'Ingresa cantidades',
    ['percentage_not_100'] = 'La suma de los porcentajes debe ser igual al 100%',
    ['amounts_not_total'] = 'La suma de las cantidades debe ser igual al total a pagar',
    ['percentage_split'] = 'División por Porcentaje',
    ['custom_split'] = 'División Personalizada',
    ['equal_split'] = 'División Igual',
    ['remaining_percentage'] = '%s - %d%% restantes',
    ['remaining_amount'] = '%s - $%s restantes',
    ['enter_percentage_per_player'] = 'Ingresa el porcentaje para cada jugador',
    ['enter_amount_per_player'] = 'Ingresa la cantidad para cada jugador',

    -------------------
    -- FACTURAS DE LA EMPRESA
    -------------------
    ['new_society_bill'] = 'Nueva Factura de la Empresa',
    ['society'] = 'Empresa',
    ['standard_bill'] = 'Factura Estándar',
    ['standard_bill_desc'] = 'Crea una factura única',
    ['select_template'] = 'Elige una plantilla o crea una factura personalizada',
    ['custom_bill'] = 'Factura Personalizada',
    ['society_payment'] = 'Pago de la Empresa',
    ['confirm_society_bill'] = 'Cantidad: $%s\nRazón: %s',
    ['society_bill'] = 'Empresa',

    -------------------
    -- FACTURAS RECURRENTES
    -------------------
    ['recurring_bill'] = 'Factura Recurrente',
    ['recurring_bill_desc'] = 'Crea una factura mensual/recurrente',
    ['recurring_bill_number'] = 'Factura Recurrente #%s',
    ['new_recurring_bill'] = 'Nueva Factura Recurrente',
    ['recurring_payment'] = 'Pago Recurrente',
    ['recurring_payment_suffix'] = '(Pago Recurrente)',
    ['no_recurring_bills'] = 'No hay Facturas Recurrentes',
    ['no_recurring_bills_desc'] = 'No tienes facturas recurrentes',
    ['bill_interval'] = 'Intervalo',
    
    -- Configuraciones recurrentes
    ['subscription_type'] = 'Tipo de Suscripción',
    ['custom_subscription'] = 'Suscripción Personalizada',
    ['select_subscription_template'] = 'Elige una plantilla o crea una suscripción personalizada',
    ['interval_days'] = 'Intervalo (días)',
    ['interval_days_desc'] = 'Número de días entre cada pago',
    ['interval_days_format'] = '%d días',
    ['recurring_reason_desc'] = 'Ingresa la razón para la facturación recurrente',
    ['confirm_recurring_bill'] = 'Factura recurrente de $%s cada %d días por: %s',
    ['accept_recurring_payment'] = 'Aceptar pago recurrente de $%s cada %d días',

    -------------------
    -- PAGOS
    -------------------
    -- Métodos de pago
    ['payment_method'] = 'Método de Pago: %s',
    ['cash'] = 'Efectivo',
    ['bank'] = 'Banco',
    ['pay_cash'] = 'Pagar en efectivo',
    ['pay_bank'] = 'Pagar por banco',
    ['pay_amount_cash'] = 'Pagar $%s en efectivo',
    ['pay_amount_bank'] = 'Pagar $%s por banco',
    ['pay_amount'] = 'Pagar $%s',
    
    -- Pagos por adelantado
    ['advance_payment'] = 'Pago por Adelantado',
    ['pay_advance'] = 'Pagar por adelantado',
    ['pay_advance_desc'] = 'Paga varias cuotas por adelantado',
    ['payment_amount'] = 'Cantidad del Pago',
    ['payment_amount_desc'] = 'Ingresa la cantidad de cada pago',
    ['amount_per_payment'] = 'Cantidad por pago',
    ['confirm_advance_payment'] = 'Total a pagar: $%s por %d pagos a %s',
    ['payment_confirmation'] = 'Confirmación de Pago',

    -- Contadores y cantidades
    ['payment_count'] = 'Número de pagos: %d',
    ['payments_count'] = 'Número de pagos',
    ['payments_count_desc'] = '%d pago(s)',
    ['payment_count_desc'] = 'Elige el número de pagos a realizar por adelantado',
    ['payments_count_label'] = 'Número de pagos',
    ['total_to_pay'] = 'Total a pagar: $%s',
    
    -- Historial y confirmaciones
    ['payment_history'] = 'Historial de Pagos',
    ['payment_history_desc'] = 'Ver historial de pagos',
    ['payment_history_title'] = 'Historial de Pagos',
    ['confirm_payment'] = 'Confirmar Pago',
    ['payment_received'] = 'Recibiste $%s de %s',
    ['payment_made'] = 'Pagaste $%s a %s',
    ['payment_made_society'] = 'Pagaste $%s a %s',
    ['payment_made_player'] = 'Pagaste $%s a %s',
    ['bill_paid_amount'] = 'Factura de $%s pagada',
    ['payment_amount'] = 'Pago de $%s',

    -------------------
    -- ESTADOS Y TIEMPO
    -------------------
    ['status'] = 'Estado',
    ['status_label'] = 'Estado',
    ['active'] = 'Activo',
    ['inactive'] = 'Inactivo',
    ['pending'] = 'Pendiente',
    ['paid'] = 'Pagado',
    ['deleted'] = 'Eliminado',
    ['next_payment'] = 'Próximo Pago',
    ['next_payment_label'] = 'Próximo Pago',
    ['today'] = 'Hoy',
    ['tomorrow'] = 'Mañana',
    ['days_remaining'] = 'En %d días',
    ['days_count'] = '%d días',
    ['interval'] = '%d días',
    ['interval_label'] = 'Intervalo',
    ['in_days'] = 'En %d días',
    ['undefined'] = 'Indefinido',
    ['plural_s'] = 's',
    ['days'] = 'días',

    -------------------
    -- HISTORIAL
    -------------------
    ['from'] = 'De',
    ['to'] = 'A',
    ['type'] = 'Tipo',
    ['type_label'] = 'Tipo',
    ['from_label'] = 'De',
    ['to_label'] = 'A',
    ['personal'] = 'Personal',
    ['personal_bill'] = 'Personal',
    ['bill_history_title'] = 'Factura %s %s %s',
    ['no_history'] = 'Sin historial',
    ['no_history_desc'] = 'No tienes historial de facturas',
    ['no_payments'] = 'Sin pagos',
    ['no_payments_desc'] = 'No se ha realizado ningún pago aún',
    ['no_bills'] = 'Sin facturas',
    ['no_bills_desc'] = 'No se han emitido facturas aún',
    
    -------------------
    -- ACCIONES Y BOTONES
    -------------------
    ['accept'] = 'Aceptar',
    ['refuse'] = 'Rechazar',
    ['accept_bill'] = 'Aceptar la factura',
    ['accept_bill_desc'] = 'Aceptar esta factura',
    ['accept_subscription'] = 'Aceptar suscripción',
    ['refuse_bill'] = 'Rechazar la factura',
    ['refuse_bill_desc'] = 'Rechazar esta factura',
    ['refuse_subscription'] = 'Rechazar suscripción',
    ['accept_recurring_desc'] = 'Aceptar esta factura recurrente',
    ['refuse_recurring_desc'] = 'Rechazar esta factura recurrente',
    ['select_player'] = 'Seleccionar un jugador',
    ['select_players'] = 'Seleccionar jugadores',
    ['select_min_players'] = 'Seleccionar al menos 2 jugadores',
    ['select_billing_type'] = 'Tipo de Facturación',
    ['confirmation'] = 'Confirmación',
    ['delete_bill'] = 'Eliminar la factura',
    ['cancel_subscription'] = 'Cancelar suscripción',
    ['cancel_subscription_desc'] = 'Cancelar esta suscripción',
    ['confirm_delete_bill'] = '¿Estás seguro de que deseas eliminar esta factura?',
    ['confirm_cancel_subscription'] = '¿Estás seguro de que deseas cancelar esta suscripción?',
    ['unknown_player'] = 'Desconocido',

    -------------------
    -- NOTIFICACIONES Y ERRORES
    -------------------
    -- Éxitos
    ['success'] = 'Éxito',
    ['bills_created'] = 'Las facturas han sido creadas',
    ['bill_accepted'] = 'Factura aceptada',
    ['bill_accepted_desc'] = 'Has aceptado la factura',
    ['bill_accepted_by_receiver'] = 'Factura aceptada',
    ['recurring_bill_accepted'] = 'Factura recurrente aceptada',
    ['recurring_bill_setup'] = 'Se ha configurado la facturación recurrente',
    ['recurring_setup_success'] = 'La facturación recurrente ha sido configurada',
    ['bill_request_sent'] = 'Solicitud de factura enviada',
    ['recurring_bill_request_sent'] = 'Solicitud de factura recurrente enviada',
    ['bill_deleted'] = 'Factura eliminada con éxito',
    ['subscription_cancelled'] = 'Suscripción cancelada',

    -- Errores
    ['error'] = 'Error',
    ['insufficient_rights'] = 'No tienes derechos suficientes',
    ['cannot_load_data'] = 'No se puede cargar tus datos',
    ['no_nearby_players'] = 'No hay jugadores cerca',
    ['need_multiple_players'] = 'Se requieren al menos 2 jugadores cercanos para crear una factura en grupo',
    ['invalid_amount'] = 'La cantidad debe ser mayor que 0',
    ['invalid_interval'] = 'Intervalo no válido (1-365 días)',
    ['insufficient_funds'] = 'No tienes suficiente dinero (falta $%s)',
    ['bill_already_paid'] = 'Esta factura no existe o ya ha sido pagada',
    ['bill_inactive'] = 'Esta factura ya no está activa',
    ['bill_refused'] = 'Factura Rechazada',
    ['bill_refused_desc'] = 'Has rechazado la factura',
    ['bill_refused_by_receiver'] = 'El destinatario rechazó la factura',
    ['bill_expired'] = 'Factura Expirada',
    ['bill_expired_desc'] = 'La factura ha expirado',
    ['bill_deleted_amount'] = 'Se ha eliminado una factura de $%s',
    ['recurring_cancelled'] = 'Una factura recurrente ha sido cancelada debido a inactividad',
    ['recurring_cancelled_inactivity'] = 'La suscripción ha sido cancelada debido a inactividad',
    ['player_disconnected_recurring'] = 'El jugador se desconectó, factura recurrente cancelada',
    ['player_disconnected_bill'] = 'El jugador se desconectó, factura cancelada',

    -------------------
    -- MENSAJES DEL SISTEMA
    -------------------
    ['distance'] = '%d metros',
    ['version_read_error'] = '^1[illama_billing] No se puede leer la versión en fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] No se puede verificar la versión en GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Error al leer la versión de GitHub^7',
    ['new_version_available'] = '^3[illama_billing] ¡Una nueva versión está disponible!^7',
    ['current_version'] = '^3[illama_billing] Versión actual: ^7%s',
    ['latest_version'] = '^3[illama_billing] Última versión: ^7%s',
    ['release_notes'] = '^3[illama_billing] Notas de la versión: ^7%s',
    ['changes_list'] = '^3[illama_billing] Cambios: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] El script está actualizado (v%s)^7'
}