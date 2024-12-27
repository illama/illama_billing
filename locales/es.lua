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
    ['recurring_bills'] = 'Facturas Recurrentes',
    ['recurring_bills_desc'] = 'Gestionar tus suscripciones y pagos recurrentes',
    ['transaction_history'] = 'Historial de Transacciones',
    ['transaction_history_desc'] = 'Ver historial de todas tus facturas',

    -------------------
    -- FACTURAS INDIVIDUALES
    -------------------
    ['new_bill'] = 'Nueva Factura',
    ['bill_type'] = 'Tipo de factura',
    ['bill_details'] = 'Detalles de la factura',
    ['bill_number'] = 'Factura #%s',
    ['amount_label'] = 'Cantidad',
    ['amount_desc'] = 'Ingrese la cantidad',
    ['reason_label'] = 'Motivo',
    ['reason_desc'] = 'Ingrese el motivo',
    ['amount'] = 'Cantidad: $%s',
    ['amount_reason'] = 'Cantidad: $%s - %s',
    ['reason'] = 'Motivo: %s',
    ['bill_from'] = 'Factura de %s',

    -------------------
    -- FACTURAS GRUPALES
    -------------------
    ['group_billing'] = 'Facturación Grupal',
    ['group_bill'] = 'Factura Grupal',
    ['group_bill_desc'] = 'Crear una factura compartida entre varias personas',
    ['group_bill_suffix'] = 'Factura Grupal',
    ['group_bill_split_equally'] = 'Dividir equitativamente',
    ['individual_bill'] = 'Factura Individual',
    ['individual_bill_desc'] = 'Crear una factura para una sola persona',
    
    -- Opciones de división
    ['split_type'] = 'Tipo de división',
    ['split_equal'] = 'División Equitativa',
    ['split_percentage'] = 'División por Porcentaje',
    ['split_amount'] = 'División por Monto Fijo',
    ['total_amount'] = 'Monto Total',
    ['enter_percentages'] = 'Ingrese los porcentajes',
    ['enter_amounts'] = 'Ingrese los montos',
    ['percentage_not_100'] = 'Los porcentajes deben sumar 100%',
    ['amounts_not_total'] = 'Los montos deben sumar el monto total',

    -------------------
    -- FACTURAS DE EMPRESA
    -------------------
    ['new_society_bill'] = 'Nueva Factura de Empresa',
    ['society'] = 'Empresa',
    ['standard_bill'] = 'Factura Estándar',
    ['standard_bill_desc'] = 'Crear una factura única',
    ['select_template'] = 'Elija una plantilla o cree una factura personalizada',
    ['custom_bill'] = 'Factura Personalizada',
    ['society_payment'] = 'Pago de Empresa',
    ['confirm_society_bill'] = 'Cantidad: $%s\nMotivo: %s',

    -------------------
    -- FACTURAS RECURRENTES
    -------------------
    ['recurring_bill'] = 'Factura Recurrente',
    ['recurring_bill_desc'] = 'Crear una factura mensual/recurrente',
    ['recurring_bill_number'] = 'Factura Recurrente #%s',
    ['new_recurring_bill'] = 'Nueva Factura Recurrente',
    ['recurring_payment'] = 'Pago Recurrente',
    ['recurring_payment_suffix'] = '(Pago Recurrente)',
    
    -- Configuración recurrente
    ['subscription_type'] = 'Tipo de Suscripción',
    ['custom_subscription'] = 'Suscripción Personalizada',
    ['select_subscription_template'] = 'Elija una plantilla o cree una suscripción personalizada',
    ['interval_days'] = 'Intervalo (días)',
    ['interval_days_desc'] = 'Número de días entre cada pago',
    ['recurring_reason_desc'] = 'Ingrese el motivo de la facturación recurrente',
    ['confirm_recurring_bill'] = 'Factura recurrente de $%s cada %d días por: %s',

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
    
    -- Pagos anticipados
    ['advance_payment'] = 'Pago Anticipado',
    ['pay_advance'] = 'Pagar por adelantado',
    ['pay_advance_desc'] = 'Pagar varios plazos por adelantado',
    ['payment_amount'] = 'Monto por pago',
    ['payment_amount_desc'] = 'Ingrese el monto de cada pago',
    ['amount_per_payment'] = 'Monto por pago',
    ['confirm_advance_payment'] = 'Total a pagar: $%s por %d pagos mediante %s',

    -- Contadores y montos
    ['payment_count'] = 'Número de pagos: %d',
    ['payments_count'] = 'Número de pagos',
    ['payments_count_desc'] = '%d pago%s',
    ['payment_count_desc'] = 'Elija el número de pagos a realizar por adelantado',
    ['total_to_pay'] = 'Total a pagar: $%s',
    
    -- Historial y confirmaciones
    ['payment_history'] = 'Historial de Pagos',
    ['payment_history_desc'] = 'Ver historial de pagos',
    ['confirm_payment'] = 'Confirmar Pago',
    ['payment_received'] = 'Has recibido $%s de %s',
    ['payment_made'] = 'Has pagado $%s a %s',
    ['payment_made_society'] = 'Has pagado $%s a %s',
    ['payment_made_player'] = 'Has pagado $%s a %s',
    ['bill_paid_amount'] = 'Factura de $%s pagada',

    -------------------
    -- ESTADO Y TIEMPO
    -------------------
    ['status'] = 'Estado',
    ['active'] = 'Activo',
    ['inactive'] = 'Inactivo',
    ['next_payment'] = 'Próximo pago',
    ['today'] = 'Hoy',
    ['tomorrow'] = 'Mañana',
    ['days_remaining'] = 'En %d días',
    ['days_count'] = '%d días',
    ['interval'] = '%d días',
    ['in_days'] = 'En %d días',
    ['undefined'] = 'No definido',
    ['plural_s'] = 's',

    -------------------
    -- HISTORIAL
    -------------------
    ['from'] = 'de',
    ['to'] = 'a',
    ['type'] = 'Tipo',
    ['personal'] = 'Personal',
    ['bill_history_title'] = '%s Factura %s %s',
    ['no_history'] = 'Sin historial',
    ['no_history_desc'] = 'No tienes facturas en el historial',
    ['no_payments'] = 'Sin pagos',
    ['no_payments_desc'] = 'Aún no se han realizado pagos',
    ['no_bills'] = 'Sin facturas',
    ['no_bills_desc'] = 'Aún no se han realizado facturas',
    
    -------------------
    -- ACCIONES Y BOTONES
    -------------------
    ['accept'] = 'Aceptar',
    ['refuse'] = 'Rechazar',
    ['accept_bill_desc'] = 'Aceptar esta factura',
    ['refuse_bill_desc'] = 'Rechazar esta factura',
    ['accept_recurring_desc'] = 'Aceptar esta factura recurrente',
    ['refuse_recurring_desc'] = 'Rechazar esta factura recurrente',
    ['select_player'] = 'Seleccionar jugador',
    ['select_players'] = 'Seleccionar jugadores',
    ['select_min_players'] = 'Selecciona al menos 2 jugadores',
    ['select_billing_type'] = 'Tipo de facturación',
    ['confirmation'] = 'Confirmación',
    ['delete_bill'] = 'Eliminar factura',
    ['cancel_subscription'] = 'Cancelar suscripción',
    ['cancel_subscription_desc'] = 'Cancelar esta suscripción',
    ['confirm_delete_bill'] = '¿Estás seguro de que quieres eliminar esta factura?',
    ['confirm_cancel_subscription'] = '¿Estás seguro de que quieres cancelar esta suscripción?',

    -------------------
    -- NOTIFICACIONES Y ERRORES
    -------------------
    -- Éxito
    ['success'] = 'Éxito',
    ['bills_created'] = 'Las facturas han sido creadas',
    ['bill_accepted'] = 'Factura aceptada',
    ['bill_accepted_desc'] = 'Has aceptado la factura',
    ['bill_accepted_by_receiver'] = 'Factura aceptada',
    ['recurring_bill_accepted'] = 'Factura recurrente aceptada',
    ['recurring_bill_setup'] = 'La facturación recurrente ha sido configurada',
    ['recurring_setup_success'] = 'La facturación recurrente ha sido configurada',
    ['bill_request_sent'] = 'Solicitud de factura enviada',
    ['recurring_bill_request_sent'] = 'Solicitud de factura recurrente enviada',
    ['bill_deleted'] = 'Factura eliminada con éxito',
    ['subscription_cancelled'] = 'Suscripción cancelada',

    -- Errores
    ['error'] = 'Error',
    ['insufficient_rights'] = 'No tienes los derechos necesarios',
    ['cannot_load_data'] = 'No se pueden cargar tus datos',
    ['no_nearby_players'] = 'No hay jugadores cercanos',
    ['need_multiple_players'] = 'Se necesitan al menos 2 jugadores cercanos para crear una factura grupal',
    ['invalid_amount'] = 'El monto debe ser mayor que 0',
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
    ['recurring_cancelled'] = 'Una factura recurrente ha sido cancelada por inactividad',
    ['recurring_cancelled_inactivity'] = 'La suscripción ha sido cancelada por inactividad',
    ['player_disconnected_recurring'] = 'El jugador se ha desconectado, factura recurrente cancelada',
    ['player_disconnected_bill'] = 'El jugador se ha desconectado, factura cancelada',

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
}