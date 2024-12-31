Locales['it'] = {
    -------------------
    -- MENU PRINCIPALE
    -------------------
    ['billing_menu'] = 'Menu Fatturazione',
    ['open_billing_menu'] = 'Apri il menu fatturazione',
    
    -- Sezioni principali
    ['personal_bills'] = 'Fatture Personali',
    ['personal_bills_desc'] = 'Gestisci le tue fatture personali',
    ['society_bills'] = 'Fatture Aziendali',
    ['society_bills_desc'] = 'Gestisci le fatture aziendali',
    ['my_bills'] = 'Le Mie Fatture',
    ['my_bills_desc'] = 'Visualizza le fatture ricevute',
    ['recurring_bills'] = 'Abbonamenti',
    ['recurring_bills_desc'] = 'Gestisci i tuoi abbonamenti',
    ['transaction_history'] = 'Cronologia Transazioni',
    ['transaction_history_desc'] = 'Visualizza la cronologia di tutte le tue fatture',
    ['my_recurring_bills'] = 'I miei abbonamenti',

    -------------------
    -- FATTURE INDIVIDUALI
    -------------------
    ['new_bill'] = 'Nuova Fattura',
    ['bill_type'] = 'Tipo di fattura',
    ['bill_details'] = 'Dettagli della fattura',
    ['bill_number'] = 'Fattura #%s',
    ['amount_label'] = 'Importo',
    ['amount_desc'] = 'Inserisci l\'importo',
    ['reason_label'] = 'Causale',
    ['reason_desc'] = 'Inserisci la causale',
    ['amount'] = 'Importo: $%s',
    ['amount_reason'] = 'Importo: $%s - %s',
    ['amount_and_reason'] = 'Importo: $%s - %s',
    ['reason'] = 'Causale: %s',
    ['bill_from'] = 'Fattura da %s',
    ['standard_bill'] = 'Fattura standard',
    ['check_bills'] = 'Controlla fatture',
    ['check_bills_desc'] = 'Controlla le fatture in corso',
    ['select_player_check'] = 'Scegli un giocatore da controllare',
    ['bills_status'] = 'Stato delle fatture',

    -------------------
    -- FATTURE DI GRUPPO
    -------------------
    ['group_billing'] = 'Fatturazione di gruppo',
    ['group_bill'] = 'Fattura di gruppo',
    ['group_bill_desc'] = 'Crea una fattura condivisa tra più persone',
    ['group_bill_suffix'] = 'Fattura di gruppo',
    ['group_bill_split_equally'] = 'Divisione equa',
    ['individual_bill'] = 'Fattura individuale',
    ['individual_bill_desc'] = 'Crea una fattura per una sola persona',
    
    -- Ripartizione
    ['split_type'] = 'Tipo di ripartizione',
    ['split_equal'] = 'Ripartizione equa',
    ['split_percentage'] = 'Ripartizione percentuale',
    ['split_amount'] = 'Ripartizione importo fisso',
    ['total_amount'] = 'Importo totale',
    ['enter_percentages'] = 'Inserisci le percentuali',
    ['enter_amounts'] = 'Inserisci gli importi',
    ['percentage_not_100'] = 'La somma delle percentuali deve essere uguale al 100%',
    ['amounts_not_total'] = 'La somma degli importi deve essere uguale all\'importo totale',
    ['percentage_split'] = 'Ripartizione in %',
    ['custom_split'] = 'Ripartizione personalizzata',
    ['equal_split'] = 'Ripartizione equa',
    ['remaining_percentage'] = '%s - %d%% rimanente',
    ['remaining_amount'] = '%s - $%s rimanente',
    ['enter_percentage_per_player'] = 'Inserisci la percentuale per ogni giocatore',
    ['enter_amount_per_player'] = 'Inserisci l\'importo per ogni giocatore',

    -- Pagamento rateale - Menu e notifiche
    ['pay_installments'] = 'Paga a rate',
    ['pay_installments_desc'] = 'Dilaziona il pagamento su più settimane',
    ['installment_setup'] = 'Configurazione pagamento rateale',
    ['number_of_payments'] = 'Numero di pagamenti',
    ['max_5_payments'] = 'Massimo 5 pagamenti (1 a settimana)',
    ['confirm_installment_plan'] = 'Conferma piano di pagamento',
    ['payment_plan'] = 'Piano di pagamento: %s',
    ['installment_status'] = 'Restano %d pagamenti su %d\nImporto per rata: $%s',
    ['installment_details'] = 'Piano di pagamento in %d rate\nImporto per rata: $%s\nImporto totale: $%s',
    ['payment_plan_created'] = 'Piano di pagamento rateale creato con successo',
    ['bill_accepted_with_installments'] = 'La fattura è stata accettata con pagamento rateale',

    -- Menu dei pagamenti rateali
    ['installment_payments'] = 'Pagamenti rateali',
    ['view_payment_plans'] = 'Visualizza i miei piani di pagamento in corso',
    ['my_payment_plans'] = 'I miei pagamenti rateali',
    ['payment_plan'] = 'Piano di pagamento: %s',
    ['no_installment_payments'] = 'Nessun pagamento rateale',
    ['no_active_payment_plans'] = 'Non hai alcun piano di pagamento attivo',
    ['total_remaining'] = 'Importo rimanente da pagare',
    ['allow_installments'] = 'Consenti pagamenti rateali',
    ['allow_installments_desc'] = 'Consenti pagamenti rateali per questa fattura',

    -- Notifiche di pagamento automatico
    ['installment_payment'] = 'Pagamento rateale',
    ['payment_processed'] = 'Pagamento di $%s addebitato automaticamente',
    ['payment_failed'] = 'Pagamento fallito',
    ['insufficient_funds_installment'] = 'Fondi insufficienti per il pagamento rateale',

    -------------------
    -- FATTURE AZIENDALI
    -------------------
    ['new_society_bill'] = 'Nuova Fattura Aziendale',
    ['society'] = 'Azienda',
    ['standard_bill'] = 'Fattura Standard',
    ['standard_bill_desc'] = 'Crea una fattura singola',
    ['select_template'] = 'Scegli un modello o crea una fattura personalizzata',
    ['custom_bill'] = 'Fattura Personalizzata',
    ['society_payment'] = 'Pagamento Aziendale',
    ['confirm_society_bill'] = 'Importo: $%s\nCausale: %s',
    ['society_bill'] = 'Azienda',

    -------------------
    -- FATTURE RICORRENTI
    -------------------
    ['recurring_bill'] = 'Abbonamenti',
    ['recurring_bill_desc'] = 'Crea un abbonamento',
    ['recurring_bill_number'] = 'Abbonamento #%s',
    ['new_recurring_bill'] = 'Nuovo abbonamento',
    ['recurring_payment'] = 'Pagamento dell\'abbonamento',
    ['recurring_payment_suffix'] = '(Pagamento dell\'abbonamento)',
    ['no_recurring_bills'] = 'Nessun abbonamento',
    ['no_recurring_bills_desc'] = 'Non hai alcun abbonamento',
    ['bill_interval'] = 'Intervallo',
    
    -- Parametri ricorrenti
    ['subscription_type'] = 'Tipo di abbonamento',
    ['custom_subscription'] = 'Abbonamento Personalizzato',
    ['select_subscription_template'] = 'Scegli un modello o crea un abbonamento personalizzato',
    ['interval_days'] = 'Intervallo (giorni)',
    ['interval_days_desc'] = 'Numero di giorni tra ogni pagamento',
    ['interval_days_format'] = '%d giorni',
    ['recurring_reason_desc'] = 'Inserisci la causale della fatturazione dell\'abbonamento',
    ['confirm_recurring_bill'] = 'Abbonamento di $%s ogni %d giorni per: %s',
    ['accept_recurring_payment'] = 'Accetta l\'abbonamento di $%s ogni %d giorni',

    -------------------
    -- PAGAMENTI
    -------------------
    -- Modalità di pagamento
    ['payment_method'] = 'Modalità di pagamento: %s',
    ['cash'] = 'Contanti',
    ['bank'] = 'Banca',
    ['pay_cash'] = 'Paga in contanti',
    ['pay_bank'] = 'Paga con banca',
    ['pay_amount_cash'] = 'Paga $%s in contanti',
    ['pay_amount_bank'] = 'Paga $%s con banca',
    ['pay_amount'] = 'Paga $%s',
    
    -- Pagamenti anticipati
    ['advance_payment'] = 'Pagamento anticipato',
    ['pay_advance'] = 'Paga in anticipo',
    ['pay_advance_desc'] = 'Paga in anticipo più rate',
    ['payment_amount'] = 'Importo per pagamento',
    ['payment_amount_desc'] = 'Inserisci l\'importo di ogni pagamento',
    ['amount_per_payment'] = 'Importo per pagamento',
    ['confirm_advance_payment'] = 'Totale da pagare: $%s per %d pagamenti tramite %s',
    ['payment_confirmation'] = 'Conferma del pagamento',

    -- Contatori e importi
    ['payment_count'] = 'Numero di pagamenti: %d',
    ['payments_count'] = 'Numero di pagamenti',
    ['payments_count_desc'] = '%d pagament%s',
    ['payment_count_desc'] = 'Scegli il numero di pagamenti da effettuare in anticipo',
    ['payments_count_label'] = 'Numero di pagamenti',
    ['total_to_pay'] = 'Totale da pagare: $%s',
    
    -- Cronologia e conferme
    ['payment_history'] = 'Cronologia pagamenti',
    ['payment_history_desc'] = 'Visualizza la cronologia dei pagamenti',
    ['payment_history_title'] = 'Cronologia pagamenti',
    ['confirm_payment'] = 'Conferma pagamento',
    ['payment_received'] = 'Hai ricevuto $%s da %s',
    ['payment_made'] = 'Hai pagato $%s a %s',
    ['payment_made_society'] = 'Hai pagato $%s a %s',
    ['payment_made_player'] = 'Hai pagato $%s a %s',
    ['bill_paid_amount'] = 'Fattura di $%s pagata',
    ['payment_amount'] = 'Pagamento di $%s',

    -------------------
    -- STATI E TEMPI
    -------------------
    ['status'] = 'Stato',
    ['status_label'] = 'Stato',
    ['active'] = 'Attivo',
    ['inactive'] = 'Inattivo',
    ['pending'] = 'In attesa',
    ['paid'] = 'Pagata',
    ['deleted'] = 'Eliminata',
    ['next_payment'] = 'Prossimo pagamento',
    ['next_payment_label'] = 'Prossimo pagamento',
    ['today'] = 'Oggi',
    ['tomorrow'] = 'Domani',
    ['days_remaining'] = 'Tra %d giorni',
    ['days_count'] = '%d giorni',
    ['interval'] = '%d giorni',
    ['interval_label'] = 'Intervallo',
    ['in_days'] = 'Tra %d giorni',
    ['undefined'] = 'Non definito',
    ['plural_s'] = 'i',
    ['days'] = 'giorni',

    -------------------
    -- CRONOLOGIA
    -------------------
    ['from'] = 'da',
    ['to'] = 'a',
    ['type'] = 'Tipo',
    ['type_label'] = 'Tipo',
    ['from_label'] = 'Da',
    ['to_label'] = 'A',
    ['personal'] = 'Personale',
    ['personal_bill'] = 'Personale',
    ['bill_history_title'] = '%s Fattura %s %s',
    ['no_history'] = 'Nessuna cronologia',
    ['no_history_desc'] = 'Non hai alcuna fattura nella cronologia',
    ['no_payments'] = 'Nessun pagamento',
    ['no_payments_desc'] = 'Nessun pagamento è stato ancora effettuato',
    ['no_bills'] = 'Nessuna fattura',
    ['no_bills_desc'] = 'Nessuna fattura è stata ancora effettuata',
    
    -------------------
    -- AZIONI E PULSANTI
    -------------------
    ['accept'] = 'Accetta',
    ['refuse'] = 'Rifiuta',
    ['accept_bill'] = 'Accetta la fattura',
    ['accept_bill_desc'] = 'Accetta questa fattura',
    ['accept_subscription'] = 'Accetta l\'abbonamento',
    ['refuse_bill'] = 'Rifiuta la fattura',
    ['refuse_bill_desc'] = 'Rifiuta questa fattura',
    ['refuse_subscription'] = 'Rifiuta l\'abbonamento',
    ['accept_recurring_desc'] = 'Accetta questo abbonamento',
    ['refuse_recurring_desc'] = 'Rifiuta questo abbonamento',
    ['select_player'] = 'Seleziona un giocatore',
    ['select_players'] = 'Seleziona i giocatori',
    ['select_min_players'] = 'Seleziona almeno 2 giocatori',
    ['select_billing_type'] = 'Tipo di fattura',
    ['confirmation'] = 'Conferma',
    ['delete_bill'] = 'Elimina la fattura',
    ['delete_bill_desc'] = 'Verrà richiesta una conferma di eliminazione.',
    ['cancel_subscription'] = 'Annulla l\'abbonamento',
    ['cancel_subscription_desc'] = 'Annulla questo abbonamento',
    ['confirm_delete_bill'] = 'Sei sicuro di voler eliminare questa fattura?',
    ['confirm_cancel_subscription'] = 'Sei sicuro di voler annullare questo abbonamento?',
    ['unknown_player'] = 'Sconosciuto',
    ['close'] = 'Chiudi',
    ['info'] = 'Informazione',
    ['click_to_export'] = 'Clicca su una fattura per visualizzarla',
    ['require_signature'] = 'Firma richiesta',
    ['require_signature_desc'] = 'Richiedi una firma per questa fattura',
    ['signature_required'] = 'Firma richiesta',
    ['enter_signature'] = 'La tua firma',
    ['signature_desc'] = 'Per favore firma per confermare la fattura',
    ['signature_placeholder'] = 'La tua firma qui',
    ['signature'] = 'Firma',
    ['not_signed'] = 'Non firmato',
    ['signed_by'] = 'Firmato da',
    ['accept'] = 'Accetta',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- NOTIFICHE ED ERRORI
    -------------------
    -- Successo
    ['success'] = 'Successo',
    ['bills_created'] = 'Le fatture sono state create',
    ['bill_accepted'] = 'Fattura accettata',
    ['bill_accepted_desc'] = 'Hai accettato la fattura',
    ['bill_accepted_by_receiver'] = 'Fattura accettata',
    ['recurring_bill_accepted'] = 'Abbonamento accettato',
    ['recurring_bill_setup'] = 'La fatturazione dell\'abbonamento è stata configurata',
    ['recurring_setup_success'] = 'L\'abbonamento è stato impostato',
    ['bill_request_sent'] = 'Richiesta di fattura inviata',
    ['recurring_bill_request_sent'] = 'Richiesta di fattura di abbonamento inviata',
    ['bill_deleted'] = 'Fattura eliminata con successo',
    ['subscription_cancelled'] = 'Abbonamento annullato',

    -- Errori
    ['error'] = 'Errore',
    ['insufficient_rights'] = 'Non hai i diritti necessari',
    ['cannot_load_data'] = 'Impossibile caricare i tuoi dati',
    ['no_nearby_players'] = 'Nessun giocatore nelle vicinanze',
    ['need_multiple_players'] = 'Servono almeno 2 giocatori nelle vicinanze per creare una fattura di gruppo',
    ['invalid_amount'] = 'L\'importo deve essere superiore a 0',
    ['invalid_interval'] = 'Intervallo non valido (1-365 giorni)',
    ['insufficient_funds'] = 'Non hai abbastanza soldi (mancano $%s)',
    ['bill_already_paid'] = 'Questa fattura non esiste o è già stata pagata',
    ['bill_inactive'] = 'Questa fattura non è più attiva',
    ['bill_refused'] = 'Fattura Rifiutata',
    ['bill_refused_desc'] = 'Hai rifiutato la fattura',
    ['bill_refused_by_receiver'] = 'Il destinatario ha rifiutato la fattura',
    ['bill_expired'] = 'Fattura Scaduta',
    ['bill_expired_desc'] = 'La fattura è scaduta',
    ['bill_deleted_amount'] = 'Una fattura di $%s è stata eliminata',
    ['recurring_cancelled'] = 'Un abbonamento è stato annullato per inattività',
    ['recurring_cancelled_inactivity'] = 'L\'abbonamento è stato annullato per inattività',
    ['player_disconnected_recurring'] = 'Il giocatore si è disconnesso, abbonamento annullato',
    ['player_disconnected_bill'] = 'Il giocatore si è disconnesso, fattura annullata',
    ['invalid_description'] = 'La descrizione può contenere solo lettere e spazi',

    -------------------
    -- MESSAGGI DI SISTEMA
    -------------------
    ['distance'] = '%d metri',
    ['version_read_error'] = '^1[illama_billing] Impossibile leggere la versione nel fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Impossibile verificare la versione su GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Errore durante la lettura della versione GitHub^7',
    ['new_version_available'] = '^3[illama_billing] Una nuova versione è disponibile!^7',
    ['current_version'] = '^3[illama_billing] Versione attuale: ^7%s',
    ['latest_version'] = '^3[illama_billing] Ultima versione: ^7%s',
    ['release_notes'] = '^3[illama_billing] Note di rilascio: ^7%s',
    ['changes_list'] = '^3[illama_billing] Modifiche: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Lo script è aggiornato (v%s)^7',
    ['system_disabled_title'] = 'Sistema di Fatturazione Disattivato',
    ['system_disabled_desc'] = 'Il sistema è disattivato a causa di un errore di configurazione',
    ['system_error'] = 'Errore di Sistema',
    ['system_disabled_contact_admin'] = 'Il sistema di fatturazione è disattivato.\nContatta un amministratore',
    ['feature_disabled'] = 'Questa funzionalità è disattivata',

    -------------------
    -- SISTEMA TAG
    -------------------
    ['filter_by_tags'] = 'Filtra per etichette',
    ['filter_tags_desc'] = 'Filtra le fatture per etichette',
    ['manage_tags'] = 'Gestisci etichette',
    ['manage_tags_desc'] = 'Aggiungi o rimuovi etichette per questa fattura',
    ['add_tag'] = 'Aggiungi etichetta',
    ['add_tag_desc'] = 'Inserisci una nuova etichetta per questa fattura',
    ['tag_placeholder'] = 'es: Importante, Personale, Lavoro',
    ['tag_added'] = 'Etichetta aggiunta con successo',
    ['show_all'] = 'Mostra tutte le fatture',
    ['show_all_desc'] = 'Rimuovi i filtri delle etichette',
    ['filter_by_tag_desc'] = 'Mostra le fatture con questa etichetta',
    ['current_filter'] = 'Filtro attuale',
    ['filtered_by_tag'] = 'Visualizzazione delle fatture etichettate: %s',
    ['change_filter'] = 'Cambia filtro',
    ['change_filter_desc'] = 'Seleziona un\'altra etichetta per filtrare',
    ['filtered_transaction_history'] = 'Cronologia transazioni filtrata',
    ['no_bills_found'] = 'Nessuna fattura trovata',
    ['no_bills_with_tag'] = 'Nessuna fattura trovata con l\'etichetta: %s',
    ['bill_actions'] = 'Azioni fattura',
    ['no_tags'] = 'Nessuna etichetta',
    ['no_tags_desc'] = 'Nessuna etichetta è stata aggiunta a questa fattura',
    ['add_new_tag'] = 'Aggiungi una nuova etichetta',
    ['remove_tag_desc'] = 'Clicca per rimuovere questa etichetta',
    ['tag_removed'] = 'Etichetta rimossa con successo',
    ['tag_name'] = 'Nome etichetta',
    ['tag_name_desc'] = 'Inserisci il nome della nuova etichetta',
    ['export_bill'] = 'Esporta fattura',
    ['export_bill_desc'] = 'Crea un\'esportazione in immagine della fattura',

    -------------------
    -- SICUREZZA
    -------------------
    ['billing_system_error'] = 'ERRORE - SISTEMA DI FATTURAZIONE',
    ['error'] = 'ERRORE',
    ['script_disabled_wrong_name'] = 'Lo script è disattivato perché il nome della risorsa non è corretto!',
    ['expected_name'] = 'Nome previsto: ^3%s^7',
    ['current_name'] = 'Nome attuale: ^3%s^7',
    ['rename_folder_instruction'] = 'Rinomina la cartella per riattivare lo script.',
    ['contact_support'] = 'Contatta il supporto se hai bisogno di aiuto.',
    ['invalid_resource_name'] = 'Nome risorsa non valido!',
    ['manifest_version'] = 'Versione del manifest: %s',
    ['script_disabled_security'] = 'Lo script è disattivato per motivi di sicurezza.',

    ['webhook_bot_name'] = 'Sistema di Fatturazione',
    ['webhook_footer'] = 'Inviato il %s',
    
    -- Webhooks - Titoli
    ['webhook_bill_created_title'] = '📥 Nuova Fattura',
    ['webhook_bill_paid_title'] = '💰 Fattura Pagata',
    ['webhook_bill_deleted_title'] = '🗑️ Fattura Eliminata',
    ['webhook_recurring_created_title'] = '🔄 Nuova Fattura Ricorrente',
    ['webhook_recurring_payment_title'] = '💳 Pagamento Ricorrente',
    ['webhook_recurring_cancelled_title'] = '⛔ Abbonamento Annullato',
    ['webhook_installment_created_title'] = '📋 Nuovo Piano di Pagamento',
    ['webhook_installment_payment_title'] = '💸 Pagamento Rateale',
    
    -- Webhooks - Descrizioni
    ['webhook_bill_created_desc'] = 'Una fattura di $%s è stata creata da %s per %s',
    ['webhook_bill_paid_desc'] = 'Una fattura di $%s è stata pagata da %s',
    ['webhook_bill_deleted_desc'] = 'Una fattura di $%s è stata eliminata da %s',
    ['webhook_recurring_created_desc'] = 'Un abbonamento di $%s è stato creato per %s (%s giorni)',
    ['webhook_recurring_payment_desc'] = 'Un pagamento ricorrente di $%s è stato creato per %s',
    ['webhook_recurring_cancelled_desc'] = 'Un abbonamento di $%s è stato annullato da %s',
    ['webhook_installment_created_desc'] = 'Un piano di pagamento di $%s è stato creato per %s (%s pagamenti)',
    ['webhook_installment_payment_desc'] = 'Un pagamento rateale di $%s è stato effettuato da %s',
    
    -- Webhooks - Campi
    ['webhook_amount'] = 'Importo',
    ['webhook_reason'] = 'Causale',
    ['webhook_payment_method'] = 'Metodo di pagamento',
    ['webhook_payment_bank'] = 'Banca',
    ['webhook_payment_cash'] = 'Contanti',
    ['webhook_bill_id'] = 'ID Fattura',
    ['webhook_amount_per_payment'] = 'Importo per pagamento',
    ['webhook_total_payments'] = 'Numero di pagamenti',
    ['webhook_remaining_payments'] = 'Pagamenti rimanenti',
    ['webhook_total_amount'] = 'Importo totale',
    ['webhook_next_payment'] = 'Prossimo pagamento',
    ['webhook_interval'] = 'Intervallo',
    ['webhook_days_count'] = '%s giorni',
    ['webhook_type'] = 'Tipo',
    ['webhook_type_personal'] = 'Personale',
    ['webhook_script_start_title'] = '🚀 Script Avviato',
    ['webhook_script_start_desc'] = 'Il sistema di fatturazione è stato avviato con successo',
    ['webhook_version'] = 'Versione',
    ['webhook_framework'] = 'Framework',
}