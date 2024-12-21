Un script facile d'utilisation permettant de faire des facturations entre joueurs. Fonctionnant sous ESX 1.11.4 (minimum). 

Prérequis

- ESX Legacy installé et configuré.
- MySQL-Async pour la gestion des bases de données.
- Ox_lib pour les notifications et les interfaces.

Installation

- Téléchargez le script et placez-le dans votre dossier resources.
- Ajoutez la ressource à votre fichier server.cfg :
- ensure illama_billing

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

Utilisation
Commandes principales :

- Créer une facture personnelle : Utilisez l'option correspondante dans le menu (F2).
- Créer une facture d'entreprise : Accessible uniquement pour les joueurs avec le métier correspondant.
- Gérer les factures reçues : Consultez et payez vos factures via le menu.

Développé par Illama.
