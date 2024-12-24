------------------- FR -------------------
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
- Créer une facture personnelle : Utilisez l'option correspondante dans le menu (F2).
- Créer une facture d'entreprise : Accessible uniquement pour les joueurs avec le métier correspondant.
- Gérer les factures reçues : Consultez et payez vos factures via le menu.

Crédits
- Développé par Illama.

------------------- EN -------------------
An easy-to-use script for invoicing between players. Running under ESX 1.11.4 (minimum). 

Prerequisites
- ESX Legacy installed and configured.
- MySQL-Async for database management.
- Ox_lib for notifications and interfaces.

Facility
- Download the script and place it in your resources folder.
- Add the resource to your server.cfg file:
- ensure illama_billing

Import the SQL file into your database:

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

Use
- Create a personal invoice: Use the corresponding option in the menu (F2).
- Create a company invoice: Accessible only to players with the corresponding profession.
- Manage received invoices: View and pay your invoices via the menu.

Credits
- Developed by Illama.
