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
    ['recurring_bills'] = 'Factures Récurrentes',
    ['recurring_bills_desc'] = 'Gérer vos abonnements et paiements récurrents',
    ['transaction_history'] = 'Historique des Transactions',
    ['transaction_history_desc'] = 'Voir l\'historique de toutes vos factures',

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
    ['reason'] = 'Raison: %s',
    ['bill_from'] = 'Facture de %s',

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

    -------------------
    -- FACTURES RÉCURRENTES
    -------------------
    ['recurring_bill'] = 'Facture Récurrente',
    ['recurring_bill_desc'] = 'Créer une facture mensuelle/récurrente',
    ['recurring_bill_number'] = 'Facture récurrente #%s',
    ['new_recurring_bill'] = 'Nouvelle Facture Récurrente',
    ['recurring_payment'] = 'Paiement récurrent',
    ['recurring_payment_suffix'] = '(Paiement récurrent)',
    
    -- Paramètres récurrents
    ['subscription_type'] = 'Type d\'abonnement',
    ['custom_subscription'] = 'Abonnement Personnalisé',
    ['select_subscription_template'] = 'Choisissez un modèle ou créez un abonnement personnalisé',
    ['interval_days'] = 'Intervalle (jours)',
    ['interval_days_desc'] = 'Nombre de jours entre chaque paiement',
    ['recurring_reason_desc'] = 'Entrez la raison de la facturation récurrente',
    ['confirm_recurring_bill'] = 'Facture récurrente de $%s tous les %d jours pour: %s',

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
    
    -- Paiements anticipés
    ['advance_payment'] = 'Paiement anticipé',
    ['pay_advance'] = 'Payer en avance',
    ['pay_advance_desc'] = 'Payer en avance plusieurs échéances',
    ['payment_amount'] = 'Montant par paiement',
    ['payment_amount_desc'] = 'Entrez le montant de chaque paiement',
    ['amount_per_payment'] = 'Montant par paiement',
    ['confirm_advance_payment'] = 'Total à payer: $%s pour %d paiements par %s',

    -- Compteurs et montants
    ['payment_count'] = 'Nombre de paiements: %d',
    ['payments_count'] = 'Nombre de paiements',
    ['payments_count_desc'] = '%d paiement%s',
    ['payment_count_desc'] = 'Choisissez le nombre de paiements à effectuer en avance',
    ['total_to_pay'] = 'Total à payer: $%s',
    
    -- Historique et confirmations
    ['payment_history'] = 'Historique des paiements',
    ['payment_history_desc'] = 'Voir l\'historique des paiements',
    ['confirm_payment'] = 'Confirmer le paiement',
    ['payment_received'] = 'Vous avez reçu $%s de %s',
    ['payment_made'] = 'Vous avez payé $%s à %s',
    ['payment_made_society'] = 'Vous avez payé $%s à %s',
    ['payment_made_player'] = 'Vous avez payé $%s à %s',
    ['bill_paid_amount'] = 'Facture de $%s payée',

    -------------------
    -- STATUTS ET TEMPS
    -------------------
    ['status'] = 'Statut',
    ['active'] = 'Actif',
    ['inactive'] = 'Inactif',
    ['next_payment'] = 'Prochain paiement',
    ['today'] = 'Aujourd\'hui',
    ['tomorrow'] = 'Demain',
    ['days_remaining'] = 'Dans %d jours',
    ['days_count'] = '%d jours',
    ['interval'] = '%d jours',
    ['in_days'] = 'Dans %d jours',
    ['undefined'] = 'Non défini',
    ['plural_s'] = 's',

    -------------------
    -- HISTORIQUE
    -------------------
    ['from'] = 'de',
    ['to'] = 'à',
    ['type'] = 'Type',
    ['personal'] = 'Personnel',
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
    ['accept_bill_desc'] = 'Accepter cette facture',
    ['refuse_bill_desc'] = 'Refuser cette facture',
    ['accept_recurring_desc'] = 'Accepter cette facture récurrente',
    ['refuse_recurring_desc'] = 'Refuser cette facture récurrente',
    ['select_player'] = 'Sélectionner un joueur',
    ['select_players'] = 'Sélectionner les joueurs',
    ['select_min_players'] = 'Sélectionnez au moins 2 joueurs',
    ['select_billing_type'] = 'Type de facture',
    ['confirmation'] = 'Confirmation',
    ['delete_bill'] = 'Supprimer la facture',
    ['cancel_subscription'] = 'Annuler l\'abonnement',
    ['cancel_subscription_desc'] = 'Annuler cet abonnement',
    ['confirm_delete_bill'] = 'Êtes-vous sûr de vouloir supprimer cette facture ?',
    ['confirm_cancel_subscription'] = 'Êtes-vous sûr de vouloir annuler cet abonnement ?',

    -------------------
    -- NOTIFICATIONS ET ERREURS
    -------------------
    -- Succès
    ['success'] = 'Succès',
    ['bills_created'] = 'Les factures ont été créées',
    ['bill_accepted'] = 'Facture acceptée',
    ['bill_accepted_desc'] = 'Vous avez accepté la facture',
    ['bill_accepted_by_receiver'] = 'Facture acceptée',
    ['recurring_bill_accepted'] = 'Facture récurrente acceptée',
    ['recurring_bill_setup'] = 'La facturation récurrente a été configurée',
    ['recurring_setup_success'] = 'La facturation récurrente a été mise en place',
    ['bill_request_sent'] = 'Demande de facture envoyée',
    ['recurring_bill_request_sent'] = 'Demande de facture récurrente envoyée',
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
    ['recurring_cancelled'] = 'Une facture récurrente a été annulée pour inactivité',
    ['recurring_cancelled_inactivity'] = 'L\'abonnement a été annulé pour inactivité',
    ['player_disconnected_recurring'] = 'Le joueur s\'est déconnecté, facture récurrente annulée',
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
    -- V.1.0.9
    -------------------
    ['bill_type'] = 'Type de facture',
    ['standard_bill'] = 'Facture standard', 
    ['recurring_bill'] = 'Facture récurrente',
    ['bill_interval'] = 'Intervalle',
    ['bills_status'] = 'État des factures',
    ['check_bills'] = 'Vérifier les factures',
    ['check_bills_desc'] = 'Vérifier les factures en cours',
    ['select_player_check'] = 'Choisir un joueur à vérifier',
    ['days'] = 'jours',
    ['status_label'] = 'Statut',
    ['type_label'] = 'Type',
    ['from_label'] = 'De',
    ['to_label'] = 'À',
    ['society_bill'] = 'Société',
    ['personal_bill'] = 'Personnel',
    ['pending'] = 'En attente',
    ['paid'] = 'Payée',
    ['deleted'] = 'Supprimée',
}