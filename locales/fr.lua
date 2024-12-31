Locales['fr'] = {
    -------------------
    -- MENU PRINCIPAL
    -------------------
    ['billing_menu'] = 'Menu Facturation',
    ['open_billing_menu'] = 'Ouvrir le menu de facturation',
    
    -- Sections principales
    ['personal_bills'] = 'Factures Personnelles',
    ['personal_bills_desc'] = 'Gérer vos factures personnelles',
    ['society_bills'] = 'Factures Entreprise',
    ['society_bills_desc'] = 'Gérer les factures d\'entreprise',
    ['my_bills'] = 'Mes Factures',
    ['my_bills_desc'] = 'Voir les factures reçues',
    ['recurring_bills'] = 'Abonnements',
    ['recurring_bills_desc'] = 'Gérer vos abonnements',
    ['transaction_history'] = 'Historique des Transactions',
    ['transaction_history_desc'] = 'Voir l\'historique de toutes vos factures',
    ['my_recurring_bills'] = 'Mes abonnements',

    -------------------
    -- FACTURES INDIVIDUELLES
    -------------------
    ['new_bill'] = 'Nouvelle Facture',
    ['bill_type'] = 'Type de facture',
    ['bill_details'] = 'Détails de la facture',
    ['bill_number'] = 'Facture #%s',
    ['amount_label'] = 'Montant',
    ['amount_desc'] = 'Entrez le montant',
    ['reason_label'] = 'Raison',
    ['reason_desc'] = 'Entrez la raison',
    ['amount'] = 'Montant: $%s',
    ['amount_reason'] = 'Montant: $%s - %s',
    ['amount_and_reason'] = 'Montant: $%s - %s',
    ['reason'] = 'Raison: %s',
    ['bill_from'] = 'Facture de %s',
    ['standard_bill'] = 'Facture standard',
    ['check_bills'] = 'Vérifier les factures',
    ['check_bills_desc'] = 'Vérifier les factures en cours',
    ['select_player_check'] = 'Choisir un joueur à vérifier',
    ['bills_status'] = 'État des factures',

    -------------------
    -- FACTURES DE GROUPE
    -------------------
    ['group_billing'] = 'Facture de groupe',
    ['group_bill'] = 'Facture de groupe',
    ['group_bill_desc'] = 'Créer une facture partagée entre plusieurs personnes',
    ['group_bill_suffix'] = 'Facture de groupe',
    ['group_bill_split_equally'] = 'Répartition égale',
    ['individual_bill'] = 'Facture individuelle',
    ['individual_bill_desc'] = 'Créer une facture pour une seule personne',
    
    -- Répartition
    ['split_type'] = 'Type de répartition',
    ['split_equal'] = 'Répartition égale',
    ['split_percentage'] = 'Répartition en pourcentage',
    ['split_amount'] = 'Répartition en montant fixe',
    ['total_amount'] = 'Montant total',
    ['enter_percentages'] = 'Entrez les pourcentages',
    ['enter_amounts'] = 'Entrez les montants',
    ['percentage_not_100'] = 'La somme des pourcentages doit être égale à 100%',
    ['amounts_not_total'] = 'La somme des montants doit être égale au montant total',
    ['percentage_split'] = 'Répartition en %',
    ['custom_split'] = 'Répartition personnalisée',
    ['equal_split'] = 'Répartition égale',
    ['remaining_percentage'] = '%s - %d%% restant',
    ['remaining_amount'] = '%s - $%s restant',
    ['enter_percentage_per_player'] = 'Entrez le pourcentage pour chaque joueur',
    ['enter_amount_per_player'] = 'Entrez le montant pour chaque joueur',

    -- Paiement échelonné - Menus et notifications
    ['pay_installments'] = 'Payer en plusieurs fois',
    ['pay_installments_desc'] = 'Échelonner le paiement sur plusieurs semaines',
    ['installment_setup'] = 'Configuration du paiement échelonné',
    ['number_of_payments'] = 'Nombre de paiements',
    ['max_5_payments'] = 'Maximum 5 paiements (1 par semaine)',
    ['confirm_installment_plan'] = 'Confirmer le plan de paiement',
    ['payment_plan'] = 'Plan de paiement: %s',  -- 1 argument
    ['installment_status'] = 'Reste %d paiements sur %d\nMontant par paiement: $%s', -- 3 arguments
    ['installment_details'] = 'Plan de paiement en %d fois\nMontant par paiement: $%s\nMontant total: $%s', -- 3 arguments
    ['payment_plan_created'] = 'Plan de paiement échelonné créé avec succès',
    ['bill_accepted_with_installments'] = 'La facture a été acceptée avec un paiement échelonné',

    -- Menu des paiements échelonnés
    ['installment_payments'] = 'Paiements échelonnés',
    ['view_payment_plans'] = 'Voir mes plans de paiement en cours',
    ['my_payment_plans'] = 'Mes paiements échelonnés',
    ['payment_plan'] = 'Plan de paiement: %s',
    ['no_installment_payments'] = 'Aucun paiement échelonné',
    ['no_active_payment_plans'] = 'Vous n\'avez aucun plan de paiement actif',
    ['total_remaining'] = 'Montant restant à payer',
    ['allow_installments'] = 'Autoriser les paiements échelonnés',
    ['allow_installments_desc'] = 'Autoriser les paiements échelonnés pour cette facture',

    -- Notifications de paiement automatique
    ['installment_payment'] = 'Paiement échelonné',
    ['payment_processed'] = 'Paiement de $%s prélevé automatiquement',
    ['payment_failed'] = 'Échec du paiement',
    ['insufficient_funds_installment'] = 'Fonds insuffisants pour le paiement échelonné',

    -------------------
    -- FACTURES SOCIÉTÉ
    -------------------
    ['new_society_bill'] = 'Nouvelle Facture Société',
    ['society'] = 'Société',
    ['standard_bill'] = 'Facture Standard',
    ['standard_bill_desc'] = 'Créer une facture unique',
    ['select_template'] = 'Choisissez un modèle ou créez une facture personnalisée',
    ['custom_bill'] = 'Facture Personnalisée',
    ['society_payment'] = 'Paiement Société',
    ['confirm_society_bill'] = 'Montant: $%s\nRaison: %s',
    ['society_bill'] = 'Société',

    -------------------
    -- FACTURES RÉCURRENTES
    -------------------
    ['recurring_bill'] = 'Abonnements',
    ['recurring_bill_desc'] = 'Créer un abonnement',
    ['recurring_bill_number'] = 'Abonnement #%s',
    ['new_recurring_bill'] = 'Nouvel abonnement',
    ['recurring_payment'] = 'Paiement de l\'abonnement',
    ['recurring_payment_suffix'] = '(Paiement de l\'abonnement)',
    ['no_recurring_bills'] = 'Aucun abonnement',
    ['no_recurring_bills_desc'] = 'Vous n\'avez aucun abonnement',
    ['bill_interval'] = 'Intervalle',
    
    -- Paramètres récurrents
    ['subscription_type'] = 'Type d\'abonnement',
    ['custom_subscription'] = 'Abonnement Personnalisé',
    ['select_subscription_template'] = 'Choisissez un modèle ou créez un abonnement personnalisé',
    ['interval_days'] = 'Intervalle (jours)',
    ['interval_days_desc'] = 'Nombre de jours entre chaque paiement',
    ['interval_days_format'] = '%d jours',
    ['recurring_reason_desc'] = 'Entrez la raison de la facturation de l\'abonnement',
    ['confirm_recurring_bill'] = 'Abonnement de $%s tous les %d jours pour: %s',
    ['accept_recurring_payment'] = 'Accepter l\'abonnement de $%s tous les %d jours',

    -------------------
    -- PAIEMENTS
    -------------------
    -- Modes de paiement
    ['payment_method'] = 'Mode de paiement: %s',
    ['cash'] = 'Espèces',
    ['bank'] = 'Banque',
    ['pay_cash'] = 'Payer en espèces',
    ['pay_bank'] = 'Payer par banque',
    ['pay_amount_cash'] = 'Payer $%s en espèces',
    ['pay_amount_bank'] = 'Payer $%s par banque',
    ['pay_amount'] = 'Payer $%s',
    
    -- Paiements anticipés
    ['advance_payment'] = 'Paiement anticipé',
    ['pay_advance'] = 'Payer en avance',
    ['pay_advance_desc'] = 'Payer en avance plusieurs échéances',
    ['payment_amount'] = 'Montant par paiement',
    ['payment_amount_desc'] = 'Entrez le montant de chaque paiement',
    ['amount_per_payment'] = 'Montant par paiement',
    ['confirm_advance_payment'] = 'Total à payer: $%s pour %d paiements par %s',
    ['payment_confirmation'] = 'Confirmation du paiement',

    -- Compteurs et montants
    ['payment_count'] = 'Nombre de paiements: %d',
    ['payments_count'] = 'Nombre de paiements',
    ['payments_count_desc'] = '%d paiement%s',
    ['payment_count_desc'] = 'Choisissez le nombre de paiements à effectuer en avance',
    ['payments_count_label'] = 'Nombre de paiements',
    ['total_to_pay'] = 'Total à payer: $%s',
    
    -- Historique et confirmations
    ['payment_history'] = 'Historique des paiements',
    ['payment_history_desc'] = 'Voir l\'historique des paiements',
    ['payment_history_title'] = 'Historique des paiements',
    ['confirm_payment'] = 'Confirmer le paiement',
    ['payment_received'] = 'Vous avez reçu $%s de %s',
    ['payment_made'] = 'Vous avez payé $%s à %s',
    ['payment_made_society'] = 'Vous avez payé $%s à %s',
    ['payment_made_player'] = 'Vous avez payé $%s à %s',
    ['bill_paid_amount'] = 'Facture de $%s payée',
    ['payment_amount'] = 'Paiement de $%s',

    -------------------
    -- STATUTS ET TEMPS
    -------------------
    ['status'] = 'Statut',
    ['status_label'] = 'Statut',
    ['active'] = 'Actif',
    ['inactive'] = 'Inactif',
    ['pending'] = 'En attente',
    ['paid'] = 'Payée',
    ['deleted'] = 'Supprimée',
    ['next_payment'] = 'Prochain paiement',
    ['next_payment_label'] = 'Prochain paiement',
    ['today'] = 'Aujourd\'hui',
    ['tomorrow'] = 'Demain',
    ['days_remaining'] = 'Dans %d jours',
    ['days_count'] = '%d jours',
    ['interval'] = '%d jours',
    ['interval_label'] = 'Intervalle',
    ['in_days'] = 'Dans %d jours',
    ['undefined'] = 'Non défini',
    ['plural_s'] = 's',
    ['days'] = 'jours',

    -------------------
    -- HISTORIQUE
    -------------------
    ['from'] = 'de',
    ['to'] = 'à',
    ['type'] = 'Type',
    ['type_label'] = 'Type',
    ['from_label'] = 'De',
    ['to_label'] = 'À',
    ['personal'] = 'Personnel',
    ['personal_bill'] = 'Personnel',
    ['bill_history_title'] = '%s Facture %s %s',
    ['no_history'] = 'Aucun historique',
    ['no_history_desc'] = 'Vous n\'avez aucune facture dans l\'historique',
    ['no_payments'] = 'Aucun paiement',
    ['no_payments_desc'] = 'Aucun paiement n\'a encore été effectué',
    ['no_bills'] = 'Aucune facture',
    ['no_bills_desc'] = 'Aucun facture n\'a encore été effectuée',
    
    -------------------
    -- ACTIONS ET BOUTONS
    -------------------
    ['accept'] = 'Accepter',
    ['refuse'] = 'Refuser',
    ['accept_bill'] = 'Accepter la facture',
    ['accept_bill_desc'] = 'Accepter cette facture',
    ['accept_subscription'] = 'Accepter l\'abonnement',
    ['refuse_bill'] = 'Refuser la facture',
    ['refuse_bill_desc'] = 'Refuser cette facture',
    ['refuse_subscription'] = 'Refuser l\'abonnement',
    ['accept_recurring_desc'] = 'Accepter cet abonnement',
    ['refuse_recurring_desc'] = 'Refuser cet abonnement',
    ['select_player'] = 'Sélectionner un joueur',
    ['select_players'] = 'Sélectionner les joueurs',
    ['select_min_players'] = 'Sélectionnez au moins 2 joueurs',
    ['select_billing_type'] = 'Type de facture',
    ['confirmation'] = 'Confirmation',
    ['delete_bill'] = 'Supprimer la facture',
    ['delete_bill_desc'] = 'Une confirmation de suppression sera demandée.',
    ['cancel_subscription'] = 'Annuler l\'abonnement',
    ['cancel_subscription_desc'] = 'Annuler cet abonnement',
    ['confirm_delete_bill'] = 'Êtes-vous sûr de vouloir supprimer cette facture ?',
    ['confirm_cancel_subscription'] = 'Êtes-vous sûr de vouloir annuler cet abonnement ?',
    ['unknown_player'] = 'Inconnu',
    ['close'] = 'Fermer',
    ['info'] = 'Information',
    ['click_to_export'] = 'Clic sur une facture pour la visualiser',
    ['require_signature'] = 'Signature requise',
    ['require_signature_desc'] = 'Demander une signature pour cette facture',
    ['signature_required'] = 'Signature requise',
    ['enter_signature'] = 'Votre signature',
    ['signature_desc'] = 'Veuillez signer pour confirmer la facture',
    ['signature_placeholder'] = 'Votre signature ici',
    ['signature'] = 'Signature',
    ['not_signed'] = 'Non signé',
    ['accept'] = 'Accepter',
    ['separator_bills_management'] = '━━━━━━━━━━━━━━━━━━━━━━━━',
    ['separator_history'] = '━━━━━━━━━━━━━━━━━━━━━━━━',

    -------------------
    -- NOTIFICATIONS ET ERREURS
    -------------------
    -- Succès
    ['success'] = 'Succès',
    ['bills_created'] = 'Les factures ont été créées',
    ['bill_accepted'] = 'Facture acceptée',
    ['bill_accepted_desc'] = 'Vous avez accepté la facture',
    ['bill_accepted_by_receiver'] = 'Facture acceptée',
    ['recurring_bill_accepted'] = 'Abonnement acceptée',
    ['recurring_bill_setup'] = 'La facturation de l\'abonnement a été configurée',
    ['recurring_setup_success'] = 'L\'abonnement a été mit en place',
    ['bill_request_sent'] = 'Demande de facture envoyée',
    ['recurring_bill_request_sent'] = 'Demande de facture d\'abonnement envoyée',
    ['bill_deleted'] = 'Facture supprimée avec succès',
    ['subscription_cancelled'] = 'Abonnement annulé',

    -- Erreurs
    ['error'] = 'Erreur',
    ['insufficient_rights'] = 'Vous n\'avez pas les droits nécessaires',
    ['cannot_load_data'] = 'Impossible de charger vos données',
    ['no_nearby_players'] = 'Aucun joueur à proximité',
    ['need_multiple_players'] = 'Il faut au moins 2 joueurs à proximité pour créer une facture de groupe',
    ['invalid_amount'] = 'Le montant doit être supérieur à 0',
    ['invalid_interval'] = 'Intervalle invalide (1-365 jours)',
    ['insufficient_funds'] = 'Vous n\'avez pas assez d\'argent (manque $%s)',
    ['bill_already_paid'] = 'Cette facture n\'existe pas ou a déjà été payée',
    ['bill_inactive'] = 'Cette facture n\'est plus active',
    ['bill_refused'] = 'Facture Refusée',
    ['bill_refused_desc'] = 'Vous avez refusé la facture',
    ['bill_refused_by_receiver'] = 'Le destinataire a refusé la facture',
    ['bill_expired'] = 'Facture Expirée',
    ['bill_expired_desc'] = 'La facture a expiré',
    ['bill_deleted_amount'] = 'Une facture de $%s a été supprimée',
    ['recurring_cancelled'] = 'Un abonnement a été annulé pour inactivité',
    ['recurring_cancelled_inactivity'] = 'L\'abonnement a été annulé pour inactivité',
    ['player_disconnected_recurring'] = 'Le joueur s\'est déconnecté, facture d\'abonnement annulé',
    ['player_disconnected_bill'] = 'Le joueur s\'est déconnecté, facture annulée',

    -------------------
    -- SYSTEM MESSAGES
    -------------------
    ['distance'] = '%d mètres',
    ['version_read_error'] = '^1[illama_billing] Impossible de lire la version dans le fxmanifest.lua^7',
    ['github_check_error'] = '^1[illama_billing] Impossible de vérifier la version sur GitHub^7',
    ['github_version_read_error'] = '^1[illama_billing] Erreur lors de la lecture de la version GitHub^7',
    ['new_version_available'] = '^3[illama_billing] Une nouvelle version est disponible!^7',
    ['current_version'] = '^3[illama_billing] Version actuelle: ^7%s',
    ['latest_version'] = '^3[illama_billing] Dernière version: ^7%s',
    ['release_notes'] = '^3[illama_billing] Notes de mise à jour: ^7%s',
    ['changes_list'] = '^3[illama_billing] Changements: \n^7%s',
    ['script_up_to_date'] = '^2[illama_billing] Le script est à jour (v%s)^7',


    -------------------
    -- TAG SYSTEM
    -------------------
    ['filter_by_tags'] = 'Filtrer par étiquettes',
    ['filter_tags_desc'] = 'Filtrer les factures par étiquettes',
    ['manage_tags'] = 'Gérer les étiquettes',
    ['manage_tags_desc'] = 'Ajouter ou supprimer des étiquettes pour cette facture',
    ['add_tag'] = 'Ajouter une étiquette',
    ['add_tag_desc'] = 'Entrez une nouvelle étiquette pour cette facture',
    ['tag_placeholder'] = 'ex: Important, Personnel, Travail',
    ['tag_added'] = 'Étiquette ajoutée avec succès',
    ['show_all'] = 'Afficher toutes les factures',
    ['show_all_desc'] = 'Supprimer les filtres d\'étiquettes',
    ['filter_by_tag_desc'] = 'Afficher les factures avec cette étiquette',
    ['current_filter'] = 'Filtre actuel',
    ['filtered_by_tag'] = 'Affichage des factures étiquetées : %s',
    ['change_filter'] = 'Changer de filtre',
    ['change_filter_desc'] = 'Sélectionner une autre étiquette pour filtrer',
    ['filtered_transaction_history'] = 'Historique des transactions filtré',
    ['no_bills_found'] = 'Aucune facture trouvée',
    ['no_bills_with_tag'] = 'Aucune facture trouvée avec l\'étiquette : %s',
    ['bill_actions'] = 'Actions de la facture',
    ['no_tags'] = 'Aucune étiquette',
    ['no_tags_desc'] = 'Aucune étiquette n\'a été ajoutée à cette facture',
    ['add_new_tag'] = 'Ajouter une nouvelle étiquette',
    ['remove_tag_desc'] = 'Cliquez pour supprimer cette étiquette',
    ['tag_removed'] = 'Étiquette supprimée avec succès',
    ['tag_name'] = 'Nom de l\'étiquette',
    ['tag_name_desc'] = 'Entrez le nom de la nouvelle étiquette',
    ['export_bill'] = 'Exporter la facture',
    ['export_bill_desc'] = 'Faire une exportation en image de la facture',
}
