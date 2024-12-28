Config = {}
Config.OpenKey = 'F2'
Config.MaxBillAmount = 100000
Config.Locale = 'fr'

Config.AllowedJobs = {
    ['police'] = {
        minGrade = 0,
        label = 'LSPD',
        maxAmount = 100000,
        allowRecurring = true,
        allowGroup = false,
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
                interval = 30
            },
            {
                label = "Protection Mensuelle Premium",
                reason = "Service de protection mensuel - Forfait premium",
                amount = 10000,
                interval = 30
            },
            {
                label = "Autre (personnalisé)",
                reason = "",
                amount = 0,
                interval = 0
            }
        }
    },
    ['ambulance'] = {
        minGrade = 0,
        label = 'E.M.S',
        maxAmount = 100000,
        allowRecurring = true,
        allowGroup = true,
        allowCheck = true,
        recurringMaxAmount = 50000,
        templates = {
            {
                label = "Consultation médicale",
                reason = "Consultation médicale standard",
                amount = 2500
            },
            {
                label = "Autre (personnalisé)",
                reason = "",
                amount = 0
            }
        },
        recurringTemplates = {
            {
                label = "Assurance Santé Basic",
                reason = "Couverture médicale mensuelle - Formule Basic",
                amount = 3000,
                interval = 30
            },
            {
                label = "Assurance Santé Premium",
                reason = "Couverture médicale mensuelle - Formule Premium",
                amount = 6000,
                interval = 30
            },
            {
                label = "Surveillance Médicale Hebdomadaire",
                reason = "Suivi médical hebdomadaire",
                amount = 1500,
                interval = 7
            },
            {
                label = "Autre (personnalisé)",
                reason = "",
                amount = 0,
                interval = 0
            }
        }
    }
}