Illama Billing

Illama Billing est un script ESX de gestion des factures conçu pour une intégration facile et des interactions utilisateur optimisées.
Fonctionnalités

    Création de factures personnelles ou pour une entreprise.
    Validation des factures avec confirmation par le destinataire.
    Paiement des factures en espèces ou via la banque.
    Notifications dynamiques pour les joueurs et les patrons d'entreprise.
    Gestion des permissions pour les factures d'entreprise (limité au grade "boss").
    Stockage sécurisé des factures dans MySQL.

Prérequis

    ESX Legacy installé et configuré.
    MySQL-Async pour la gestion des bases de données.
    Ox_lib pour les notifications et les interfaces.

Installation

    Téléchargez le script et placez-le dans votre dossier resources.
    Ajoutez la ressource à votre fichier server.cfg :

ensure illama_billing

Importez le fichier SQL dans votre base de données :

    CREATE TABLE `illama_bills` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `sender` VARCHAR(50),
        `sender_name` VARCHAR(100),
        `receiver` VARCHAR(50),
        `receiver_name` VARCHAR(100),
        `amount` DECIMAL(10, 2),
        `reason` TEXT,
        `type` ENUM('personal', 'society'),
        `society` VARCHAR(50) DEFAULT NULL,
        `status` ENUM('pending', 'paid') DEFAULT 'pending',
        `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    Redémarrez votre serveur.

Utilisation
Commandes principales :

    Créer une facture personnelle : Utilisez l'option correspondante dans le menu.
    Créer une facture d'entreprise : Accessible uniquement pour les joueurs avec le grade "boss".
    Gérer les factures reçues : Consultez et payez vos factures via le menu.

Notifications :

    Les joueurs sont notifiés en cas de création, acceptation, ou refus d'une facture.
    Les patrons reçoivent une notification lorsqu'une facture d'entreprise est payée.

Configuration

Vous pouvez personnaliser le montant maximum des factures dans le fichier de configuration :

Config = {
    MaxBillAmount = 10000 -- Montant maximum des factures
}

Crédits

Développé par Illama.
