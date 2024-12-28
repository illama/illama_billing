---

# Illama Billing - FiveM Script

---

## 🇬🇧 **English Version**

### 📋 **Overview**

Illama Billing is a secure and efficient billing script for FiveM, designed to simplify the management of personal and job-related bills. It supports advanced features such as recurring payments, group billing, and real-time notifications, ensuring a seamless experience for players and server administrators.

---

### 🌟 **Features**

#### 🎛️ **Bill Management**
1. **Personal Bills**:  
   - Manage pending personal bills.  
   - Actions: Pay, delete, or view bill details.  

2. **Job-Related Bills**:  
   - Create or manage bills linked to your job.  
   - Supports standard and recurring bills.  
   - Allows **group billing** for configured jobs.  

3. **Complete History**:  
   - Search all your past transactions, whether personal or job-related.  

---

#### 💡 **Bill Creation**
1. **New Bills**:  
   - Fully customizable (amount, reason).  
   - Ideal for one-time or unique bills.  

2. **Recurring Bills**:  
   - Set up subscriptions (monthly, weekly) with customizable intervals.

3. **Group Billing**:  
   - Available for **personal bills** and **configured jobs**.  
   - Choose from three distribution methods:  
     - **Equal distribution**: The total amount is evenly split among group members.  
     - **Fixed amount per member**: Each group member is billed the same fixed amount.  
     - **Percentage-based distribution**: The total amount is divided based on specified percentages.

4. **Preconfigured Templates**:  
   - Example: Minor speeding violations ($750 for police).  

---

#### 💸 **Payments and Actions**
1. **Payment Options**:  
   - 💵 Pay in cash.  
   - 🏦 Pay via bank transfer.  

2. **Recurring Payment Management**:  
   - Cancel or configure advance payments.  
   - View detailed payment history.  

---

### 🛠️ **Advanced Features**

#### ⚙️ **Technical Details**
- **Player Selection**:  
  - Identify nearby players and issue bills to them.  
- **Permission Verification**:  
  - Limit access to features based on job and grade.

#### 🌐 **Multi-Language Support**
- Supports over **five languages**, configurable via localization files.

#### ⚡ **Performance**
- Optimized to run at **0.00ms**, ensuring minimal impact on server performance.

---

### 🛡️ **Job Support**

#### 👮 **Police**
Example configuration:
```lua
['police'] = {
    minGrade = 0,
    label = 'LSPD',
    maxAmount = 100000,
    allowRecurring = true,
    allowGroup = true,
    allowCheck = true,
    recurringMaxAmount = 50000,
    templates = {
        {
            label = "Minor Speeding Violation",
            reason = "Speeding less than 30km/h above the limit",
            amount = 750
        },
        {
            label = "Other (customized)",
            reason = "",
            amount = 0
        }
    },
    recurringTemplates = {
        {
            label = "Standard Monthly Protection",
            reason = "Monthly protection service - Standard package",
            amount = 5000,
            interval = 30 -- Every 30 days
        },
        {
            label = "Premium Monthly Protection",
            reason = "Monthly protection service - Premium package",
            amount = 10000,
            interval = 30
        },
        {
            label = "Other (customized)", -- Always keep this option
            reason = "",
            amount = 0,
            interval = 0
        }
    }
}
```

---

### 📂 **Data Management**

1. **SQL Integration**:  
   - **Required**: Import the SQL file located at `Install/sql.sql` into your database.  
   - Includes all necessary tables for smooth script functionality.

2. **Easy Configuration**:  
   - Add new jobs, templates, or recurring options as per your server's needs.

---

### 🤝 **Dependencies**

Before starting the script, ensure the following dependencies are installed and loaded:  
1. **[OX Lib](https://github.com/overextended/ox_lib)**: For notifications and context menus.  
2. **[ES Extended](https://github.com/esx-framework/es_extended)**: Base framework for ESX.  

Both dependencies must be started **before** loading the Illama Billing script.

---

### 🛠️ **Installation Guide**

1. **Download the script release** directly from the GitHub Releases page. **Do not use git clone**, as the script will not work properly without the release version.
2. Place the script in your `resources` folder.  
3. Import the SQL file into your database (`Install/sql.sql`).  
4. Add the following to your `server.cfg`:  
   ```plaintext
   ensure ox_lib
   ensure es_extended
   ensure illama_billing
   ```
5. Start your server and enjoy!  

---

### 🤝 **Support & Community**

- **Contact**: Illama on Discord for any issues or questions.  
- **Join the Community**: Get updates, support, and access to future features.  

---

Voici la version complète en français du README pour **Illama Billing - Script FiveM** :

---

# Illama Billing - Script FiveM

---

## 🇫🇷 **Version Française**

### 📋 **Présentation**

Illama Billing est un script de facturation sécurisé et performant pour FiveM, conçu pour simplifier la gestion des factures personnelles et professionnelles. Il prend en charge des fonctionnalités avancées telles que les paiements récurrents, les factures de groupe et les notifications en temps réel, offrant une expérience fluide pour les joueurs et les administrateurs de serveurs.

---

### 🌟 **Fonctionnalités**

#### 🎛️ **Gestion des factures**
1. **Factures personnelles** :  
   - Gérez vos factures personnelles en attente.  
   - Actions : payer, supprimer ou consulter les détails des factures.  

2. **Factures d’entreprise** :  
   - Créez ou gérez des factures liées à votre métier.  
   - Prend en charge les factures standards et récurrentes.  
   - Permet la **facturation de groupe** pour les métiers configurés.  

3. **Historique complet** :  
   - Recherchez toutes vos transactions passées, qu'elles soient personnelles ou professionnelles.  

---

#### 💡 **Création de factures**
1. **Nouvelles factures** :  
   - Entièrement personnalisable (montant, raison).  
   - Idéal pour des factures uniques ou spécifiques.  

2. **Factures récurrentes** :  
   - Configurez des abonnements (mensuels, hebdomadaires) avec des intervalles personnalisés.

3. **Factures de groupe** :  
   - Disponible pour les **factures personnelles** et les **métiers configurés**.  
   - Trois modes de répartition disponibles :  
     - **Répartition égale** : Le montant total est divisé équitablement entre les membres du groupe.  
     - **Montant fixe** : Chaque membre reçoit une facture du même montant.  
     - **Répartition par pourcentage** : Le montant total est réparti selon des pourcentages définis.

4. **Modèles prédéfinis** :  
   - Exemple : Excès de vitesse léger (750 $ pour la police).  

---

#### 💸 **Paiements et actions**
1. **Options de paiement** :  
   - 💵 Payer en espèces.  
   - 🏦 Payer via une banque.  

2. **Gestion des paiements récurrents** :  
   - Annulez ou configurez des paiements anticipés.  
   - Consultez l’historique détaillé des paiements.  

---

### 🛠️ **Fonctionnalités avancées**

#### ⚙️ **Détails techniques**
- **Sélection des joueurs** :  
  - Identifiez les joueurs proches et émettez des factures.  
- **Vérification des permissions** :  
  - Limitez l’accès aux fonctionnalités en fonction du métier et du grade.

#### 🌐 **Support multilingue**
- Supporte plus de **cinq langues**, configurable via des fichiers de localisation. 

#### ⚡ **Performance**
- Optimisé pour fonctionner à **0.00ms**, minimisant l’impact sur les performances du serveur.

---

### 🛡️ **Support métier**

#### 👮 **Police**
Exemple de configuration :
```lua
['police'] = {
    minGrade = 0,
    label = 'LSPD',
    maxAmount = 100000,
    allowRecurring = true,
    allowGroup = true,
    allowCheck = true,
    recurringMaxAmount = 50000,
    templates = {
        {
            label = "Excès de vitesse léger",
            reason = "Excès de vitesse inférieur à 30km/h",
            amount = 750
        },
        {
            label = "Autre (personnalisé)",
            reason = "",
            amount = 0
        }
    },
    recurringTemplates = {
        {
            label = "Protection Mensuelle Standard",
            reason = "Service de protection mensuel - Forfait standard",
            amount = 5000,
            interval = 30 -- Tous les 30 jours
        },
        {
            label = "Protection Mensuelle Premium",
            reason = "Service de protection mensuel - Forfait premium",
            amount = 10000,
            interval = 30
        },
        {
            label = "Autre (personnalisé)", -- Toujours garder cette option
            reason = "",
            amount = 0,
            interval = 0
        }
    }
}
```

---

### 📂 **Gestion des données**

1. **Intégration SQL** :  
   - **Obligatoire** : Importez le fichier SQL situé dans `Install/sql.sql` dans votre base de données.  
   - Inclut toutes les tables nécessaires au bon fonctionnement du script.

2. **Configuration simple** :  
   - Ajoutez de nouveaux métiers, modèles ou options récurrentes en fonction des besoins de votre serveur.

---

### 🤝 **Dépendances**

Avant de démarrer le script, assurez-vous que les dépendances suivantes sont installées et chargées :  
1. **[OX Lib](https://github.com/overextended/ox_lib)** : Pour les notifications et les menus contextuels.  
2. **[ES Extended](https://github.com/esx-framework/es_extended)** : Framework de base pour ESX.  

Ces dépendances doivent être démarrées **avant** de charger le script Illama Billing.

---

### 🛠️ **Guide d’installation**

1. **Téléchargez** directement la **release** du script depuis la page GitHub Releases. **Ne pas utiliser git clone**, car le script ne fonctionnera pas correctement sans la version de release.
2. Placez le script dans votre dossier `resources`.  
3. Importez le fichier SQL dans votre base de données (`Install/sql.sql`).  
4. Ajoutez les lignes suivantes dans votre `server.cfg` :  
   ```plaintext
   ensure ox_lib
   ensure es_extended
   ensure illama_billing
   ```
5. Lancez votre serveur et profitez-en !

---

### 🤝 **Support et communauté**

- **Contact** : Illama sur Discord pour toute question ou problème.  
- **Rejoignez la communauté** : Bénéficiez des mises à jour, du support et des fonctionnalités futures.  

---
