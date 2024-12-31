Locales['it'] = {
    -------------------
    -- MENU PRINCIPALE
    -------------------
    ['billing_menu'] = 'Menu Fatture',
    ['open_billing_menu'] = 'Apri il menu delle fatture',
    
    -- Sezioni principali
    ['personal_bills'] = 'Fatture Personali',
    ['personal_bills_desc'] = 'Crea fatture personali',
    ['society_bills'] = 'Fatture Aziendali',
    ['society_bills_desc'] = 'Crea fatture aziendali',
    ['my_bills'] = 'Le Mie Fatture',
    ['my_bills_desc'] = 'Visualizza le fatture ricevute',
    ['recurring_bills'] = 'Fatture Ricorrenti',
    ['recurring_bills_desc'] = 'Gestisci abbonamenti e pagamenti ricorrenti',
    ['transaction_history'] = 'Storico Transazioni',
    ['transaction_history_desc'] = 'Visualizza lo storico delle fatture',
    ['my_recurring_bills'] = 'Le Mie Fatture Ricorrenti',

    -------------------
    -- FATTURE INDIVIDUALI
    -------------------
    ['new_bill'] = 'Nuova Fattura',
    ['bill_type'] = 'Tipo di Fattura',
    ['bill_details'] = 'Dettagli della Fattura',
    ['bill_number'] = 'Fattura n.%s',
    ['amount_label'] = 'Importo',
    ['amount_desc'] = 'Inserisci l\'importo',
    ['reason_label'] = 'Motivo',
    ['reason_desc'] = 'Inserisci il motivo',
    ['amount'] = 'Importo: €%s',
    ['amount_reason'] = 'Importo: €%s - %s',
    ['amount_and_reason'] = 'Importo: €%s - %s',
    ['reason'] = 'Motivo: %s',
    ['bill_from'] = 'Fattura da %s',
    ['standard_bill'] = 'Fattura Standard',
    ['check_bills'] = 'Verifica Fatture',
    ['check_bills_desc'] = 'Controlla le fatture in corso',
    ['select_player_check'] = 'Seleziona un giocatore per controllare',
    ['bills_status'] = 'Stato Fatture',

    -------------------
    -- FATTURE DI GRUPPO
    -------------------
    ['group_billing'] = 'Fatturazione di Gruppo',
    ['group_bill'] = 'Fattura di Gruppo',
    ['group_bill_desc'] = 'Crea una fattura condivisa tra più persone',
    ['group_bill_suffix'] = 'Fattura di Gruppo',
    ['group_bill_split_equally'] = 'Divisione Equa',
    ['individual_bill'] = 'Fattura Individuale',
    ['individual_bill_desc'] = 'Crea una fattura per una singola persona',
    
    -- Opzioni di divisione
    ['split_type'] = 'Tipo di Divisione',
    ['split_equal'] = 'Divisione Equa',
    ['split_percentage'] = 'Divisione Percentuale',
    ['split_amount'] = 'Divisione Importo Fisso',
    ['total_amount'] = 'Importo Totale',
    ['enter_percentages'] = 'Inserisci le percentuali',
    ['enter_amounts'] = 'Inserisci gli importi',
    ['percentage_not_100'] = 'La somma delle percentuali deve essere pari al 100%',
    ['amounts_not_total'] = 'La somma degli importi deve essere pari all\'importo totale',
    ['percentage_split'] = 'Divisione Percentuale',
    ['custom_split'] = 'Divisione Personalizzata',
    ['equal_split'] = 'Divisione Equa',
    ['remaining_percentage'] = '%s - %d%% rimanenti',
    ['remaining_amount'] = '%s - €%s rimanenti',
    ['enter_percentage_per_player'] = 'Inserisci la percentuale per ogni giocatore',
    ['enter_amount_per_player'] = 'Inserisci l\'importo per ogni giocatore',
    -- Pagamento rateale - Menu e notifiche
    ['pay_installments'] = 'Paga a rate',
    ['pay_installments_desc'] = 'Dividi il pagamento in più settimane',
    ['installment_setup'] = 'Configurazione pagamento rateale',
    ['number_of_payments'] = 'Numero di rate',
    ['max_5_payments'] = 'Massimo 5 rate (1 a settimana)',
    ['confirm_installment_plan'] = 'Conferma piano di pagamento',
    ['payment_plan'] = 'Piano di pagamento: %s',
    ['installment_status'] = 'Restano %d rate su %d\nImporto per rata: $%s',
    ['installment_details'] = 'Piano di pagamento in %d rate\nImporto per rata: $%s\nImporto totale: $%s',
    ['payment_plan_created'] = 'Piano di pagamento rateale creato con successo',
    ['bill_accepted_with_installments'] = 'Fattura accettata con pagamento rateale',
    ['allow_installments'] = 'Consentire pagamenti rateali',
    ['allow_installments_desc'] = 'Consentire pagamenti rateali per questa fattura',

    -- Menu dei pagamenti rateali
    ['installment_payments'] = 'Pagamenti rateali',
    ['view_payment_plans'] = 'Visualizza i miei piani di pagamento attivi',
    ['my_payment_plans'] = 'I miei pagamenti rateali',
    ['payment_plan'] = 'Piano di pagamento: %s',
    ['no_installment_payments'] = 'Nessun pagamento rateale',
    ['no_active_payment_plans'] = 'Non hai piani di pagamento attivi',
    ['total_remaining'] = 'Importo totale rimanente',

    -- Notifiche di pagamento automatico
    ['installment_payment'] = 'Pagamento rateale',
    ['payment_processed'] = 'Pagamento di $%s elaborato automaticamente',
    ['payment_failed'] = 'Pagamento fallito',
    ['insufficient_funds_installment'] = 'Fondi insufficienti per il pagamento rateale',
    
    -------------------
    -- FATTURE AZIENDALI
    -------------------
    ['new_society_bill'] = 'Nuova Fattura Aziendale',
    ['society'] = 'Azienda',
    ['standard_bill'] = 'Fattura Standard',
    ['standard_bill_desc'] = 'Crea una fattura una tantum',
    ['select_template'] = 'Scegli un modello o crea una fattura personalizzata',
    ['custom_bill'] = 'Fattura Personalizzata',
    ['society_payment'] = 'Pagamento Aziendale',
    ['confirm_society_bill'] = 'Importo: €%s\nMotivo: %s',
    ['society_bill'] = 'Azienda',

    -------------------
    -- FATTURE RICORRENTI
    -------------------
    ['recurring_bill'] = 'Fattura Ricorrente',
    ['recurring_bill_desc'] = 'Crea una fattura mensile/ricorrente',
    ['recurring_bill_number'] = 'Fattura Ricorrente n.%s',
    ['new_recurring_bill'] = 'Nuova Fattura Ricorrente',
    ['recurring_payment'] = 'Pagamento Ricorrente',
    ['recurring_payment_suffix'] = '(Pagamento Ricorrente)',
    ['no_recurring_bills'] = 'Nessuna Fattura Ricorrente',
    ['no_recurring_bills_desc'] = 'Non hai fatture ricorrenti',
    ['bill_interval'] = 'Intervallo',
    
    -- Impostazioni ricorrenti
    ['subscription_type'] = 'Tipo di Abbonamento',
    ['custom_subscription'] = 'Abbonamento Personalizzato',
    ['select_subscription_template'] = 'Scegli un modello o crea un abbonamento personalizzato',
    ['interval_days'] = 'Intervallo (giorni)',
    ['interval_days_desc'] = 'Numero di giorni tra ogni pagamento',
    ['interval_days_format'] = '%d giorni',
    ['recurring_reason_desc'] = 'Inserisci il motivo della fatturazione ricorrente',
    ['confirm_recurring_bill'] = 'Fattura ricorrente di €%s ogni %d giorni per: %s',
    ['accept_recurring_payment'] = 'Accetta il pagamento ricorrente di €%s ogni %d giorni',

    -------------------
    -- PAGAMENTI
    -------------------
    -- Metodi di pagamento
    ['payment_method'] = 'Metodo di Pagamento: %s',
    ['cash'] = 'Contanti',
    ['bank'] = 'Banca',
    ['pay_cash'] = 'Paga in contanti',
    ['pay_bank'] = 'Paga tramite banca',
    ['pay_amount_cash'] = 'Paga €%s in contanti',
    ['pay_amount_bank'] = 'Paga €%s tramite banca',
    ['pay_amount'] = 'Paga €%s',
    
    -- Pagamenti anticipati
    ['advance_payment'] = 'Pagamento Anticipato',
    ['pay_advance'] = 'Paga in anticipo',
    ['pay_advance_desc'] = 'Paga diverse rate in anticipo',
    ['payment_amount'] = 'Importo Pagamento',
    ['payment_amount_desc'] = 'Inserisci l\'importo di ogni pagamento',
    ['amount_per_payment'] = 'Importo per pagamento',
    ['confirm_advance_payment'] = 'Totale da pagare: €%s per %d pagamenti di %s',
    ['payment_confirmation'] = 'Conferma Pagamento',

    -------------------
    -- STATI E TEMPI
    -------------------
    ['status'] = 'Stato',
    ['active'] = 'Attivo',
    ['inactive'] = 'Inattivo',
    ['pending'] = 'In attesa',
    ['paid'] = 'Pagato',
    ['deleted'] = 'Eliminato',

    -------------------
    -- STORICO E CONFERME
    -------------------
    ['payment_history'] = 'Storico Pagamenti',
    ['payment_history_desc'] = 'Visualizza lo storico dei pagamenti',
    ['payment_history_title'] = 'Storico Pagamenti',
    ['confirm_payment'] = 'Conferma Pagamento',
    ['payment_received'] = 'Hai ricevuto €%s da %s',
    ['payment_made'] = 'Hai pagato €%s a %s',
    ['payment_made_society'] = 'Hai pagato €%s alla società %s',
    ['payment_made_player'] = 'Hai pagato €%s al giocatore %s',
    ['bill_paid_amount'] = 'Fattura di €%s pagata',
    ['payment_amount'] = 'Pagamento di €%s',

    -------------------
    -- STATI E TEMPI
    -------------------
    ['next_payment'] = 'Prossimo Pagamento',
    ['next_payment_label'] = 'Prossimo Pagamento',
    ['today'] = 'Oggi',
    ['tomorrow'] = 'Domani',
    ['days_remaining'] = 'Tra %d giorni',
    ['days_count'] = '%d giorni',
    ['interval'] = '%d giorni',
    ['interval_label'] = 'Intervallo',
    ['in_days'] = 'In %d giorni',
    ['undefined'] = 'Non definito',
    ['plural_s'] = '',
    ['days'] = 'giorni',

    -------------------
    -- STORICO
    -------------------
    ['from'] = 'Da',
    ['to'] = 'A',
    ['type'] = 'Tipo',
    ['type_label'] = 'Tipo',
    ['from_label'] = 'Da',
    ['to_label'] = 'A',
    ['personal'] = 'Personale',
    ['personal_bill'] = 'Personale',
    ['bill_history_title'] = '%s Fattura %s %s',
    ['no_history'] = 'Nessuno storico',
    ['no_history_desc'] = 'Non hai fatture nello storico',
    ['no_payments'] = 'Nessun pagamento',
    ['no_payments_desc'] = 'Non è stato ancora effettuato alcun pagamento',
    ['no_bills'] = 'Nessuna fattura',
    ['no_bills_desc'] = 'Non sono state emesse fatture',

    -------------------
    -- AZIONI E PULSANTI
    -------------------
    ['accept'] = 'Accetta',
    ['refuse'] = 'Rifiuta',
    ['accept_bill'] = 'Accetta la fattura',
    ['accept_bill_desc'] = 'Accetta questa fattura',
    ['accept_subscription'] = 'Accetta abbonamento',
    ['refuse_bill'] = 'Rifiuta la fattura',
    ['refuse_bill_desc'] = 'Rifiuta questa fattura',
    ['refuse_subscription'] = 'Rifiuta abbonamento',
    ['accept_recurring_desc'] = 'Accetta questa fattura ricorrente',
    ['refuse_recurring_desc'] = 'Rifiuta questa fattura ricorrente',
    ['select_player'] = 'Seleziona un giocatore',
    ['select_players'] = 'Seleziona i giocatori',
    ['select_min_players'] = 'Seleziona almeno 2 giocatori',
    ['select_billing_type'] = 'Tipo di fatturazione',
    ['confirmation'] = 'Conferma',
    ['delete_bill'] = 'Elimina la fattura',
    ['delete_bill_desc'] = 'Verrà richiesta una conferma di eliminazione.',
    ['cancel_subscription'] = 'Annulla abbonamento',
    ['cancel_subscription_desc'] = 'Annulla questo abbonamento',
    ['confirm_delete_bill'] = 'Sei sicuro di voler eliminare questa fattura?',
    ['confirm_cancel_subscription'] = 'Sei sicuro di voler annullare questo abbonamento?',
    ['unknown_player'] = 'Sconosciuto',
    ['close'] = 'Chiudi',
    ['info'] = 'Informazioni',
    ['click_to_export'] = 'Clicca su una fattura per visualizzarla',
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
    ['recurring_bill_accepted'] = 'Fattura ricorrente accettata',
    ['recurring_bill_setup'] = 'Fattura ricorrente configurata',
    ['recurring_setup_success'] = 'La fatturazione ricorrente è stata configurata',
    ['bill_request_sent'] = 'Richiesta di fattura inviata',
    ['recurring_bill_request_sent'] = 'Richiesta di fattura ricorrente inviata',
    ['bill_deleted'] = 'Fattura eliminata con successo',
    ['subscription_cancelled'] = 'Abbonamento annullato',

    -- Errori
    ['error'] = 'Errore',
    ['insufficient_rights'] = 'Non hai i diritti sufficienti',
    ['cannot_load_data'] = 'Impossibile caricare i tuoi dati',
    ['no_nearby_players'] = 'Nessun giocatore nelle vicinanze',
    ['need_multiple_players'] = 'Sono richiesti almeno 2 giocatori nelle vicinanze per creare una fattura di gruppo',
    ['invalid_amount'] = 'L\'importo deve essere maggiore di 0',
    ['invalid_interval'] = 'Intervallo non valido (1-365 giorni)',
    ['insufficient_funds'] = 'Non hai abbastanza denaro (mancano €%s)',
    ['bill_already_paid'] = 'Questa fattura non esiste o è già stata pagata',
    ['bill_inactive'] = 'Questa fattura non è più attiva',
    ['bill_refused'] = 'Fattura rifiutata',
    ['bill_refused_desc'] = 'Hai rifiutato la fattura',
    ['bill_refused_by_receiver'] = 'Il destinatario ha rifiutato la fattura',
    ['bill_expired'] = 'Fattura Scaduta',
    ['bill_expired_desc'] = 'La fattura è scaduta',
    ['bill_deleted_amount'] = 'Una fattura di €%s è stata eliminata',
    ['recurring_cancelled'] = 'Una fattura ricorrente è stata annullata a causa dell\'inattività',
    ['recurring_cancelled_inactivity'] = 'L\'abbonamento è stato annullato a causa dell\'inattività',
    ['player_disconnected_recurring'] = 'Il giocatore si è disconnesso, fattura ricorrente annullata',
    ['player_disconnected_bill'] = 'Il giocatore si è disconnesso, fattura annullata',

    -------------------
    -- MESSAGGI DI SISTEMA
    -------------------
    ['distance'] = '%d metri',
    ['version_read_error'] = '^1[illama_billing] Impossibile leggere la versione in fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Impossibile verificare la versione su GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Errore nella lettura della versione su GitHub^7',
    ['new_version_available'] = '^3[illama_billing] Una nuova versione è disponibile!^7',
    ['current_version'] = '^3[illama_billing] Versione attuale: ^7%s',
    ['latest_version'] = '^3[illama_billing] Ultima versione: ^7%s',
    ['release_notes'] = '^3[illama_billing] Note di rilascio: ^7%s',
    ['changes_list'] = '^3[illama_billing] Modifiche: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Lo script è aggiornato (v%s)^7',
    ['system_disabled_title'] = 'Sistema di Fatturazione Disattivato',
    ['system_disabled_desc'] = 'Il sistema è disattivato a causa di un errore di configurazione',
    ['system_error'] = 'Errore di Sistema',
    ['system_disabled_contact_admin'] = 'Il sistema di fatturazione è disattivato.\nContattare un amministratore',
    ['feature_disabled'] = 'Questa funzionalità è disattivata',

    -------------------
    -- SISTEMA DI ETICHETTE
    -------------------
    ['filter_by_tags'] = 'Filtra per Etichette',
    ['filter_tags_desc'] = 'Filtra le fatture per etichette',
    ['manage_tags'] = 'Gestisci Etichette',
    ['manage_tags_desc'] = 'Aggiungi o rimuovi etichette per questa fattura',
    ['add_tag'] = 'Aggiungi Etichetta',
    ['add_tag_desc'] = 'Inserisci una nuova etichetta per questa fattura',
    ['tag_placeholder'] = 'es: Importante, Personale, Lavoro',
    ['tag_added'] = 'Etichetta aggiunta con successo',
    ['show_all'] = 'Mostra Tutte le Fatture',
    ['show_all_desc'] = 'Rimuovi i filtri delle etichette',
    ['filter_by_tag_desc'] = 'Mostra fatture con questa etichetta',
    ['current_filter'] = 'Filtro Attuale',
    ['filtered_by_tag'] = 'Visualizzazione fatture etichettate con: %s',
    ['change_filter'] = 'Cambia Filtro',
    ['change_filter_desc'] = 'Seleziona un\'altra etichetta per filtrare',
    ['filtered_transaction_history'] = 'Cronologia Transazioni Filtrata',
    ['no_bills_found'] = 'Nessuna Fattura Trovata',
    ['no_bills_with_tag'] = 'Nessuna fattura trovata con l\'etichetta: %s',
    ['bill_actions'] = 'Azioni Fattura',
    ['no_tags'] = 'Nessuna Etichetta',
    ['no_tags_desc'] = 'Nessuna etichetta è stata aggiunta a questa fattura',
    ['add_new_tag'] = 'Aggiungi Nuova Etichetta',
    ['remove_tag_desc'] = 'Clicca per rimuovere questa etichetta',
    ['tag_removed'] = 'Etichetta rimossa con successo',
    ['tag_name'] = 'Nome Etichetta',
    ['tag_name_desc'] = 'Inserisci il nome della nuova etichetta',
    ['export_bill'] = 'Esporta Fattura',
    ['export_bill_desc'] = 'Esporta fattura come immagine',

    -------------------
    -- SICUREZZA
    -------------------
    ['billing_system_error'] = 'ERRORE - SISTEMA DI FATTURAZIONE',
    ['error'] = 'ERRORE',
    ['script_disabled_wrong_name'] = 'Lo script è disabilitato perché il nome della risorsa non è corretto!',
    ['expected_name'] = 'Nome previsto: ^3%s^7',
    ['current_name'] = 'Nome attuale: ^3%s^7',
    ['rename_folder_instruction'] = 'Rinominare la cartella per riattivare lo script.',
    ['contact_support'] = 'Contatta il supporto se hai bisogno di aiuto.',
    ['invalid_resource_name'] = 'Nome risorsa non valido!',
    ['manifest_version'] = 'Versione manifest: %s',
    ['script_disabled_security'] = 'Script disabilitato per motivi di sicurezza.',
}