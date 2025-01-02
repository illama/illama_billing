Config = {}
Config.OpenKey = 'F2'
Config.MaxBillAmount = 100000
Config.Locale = 'en'
Config.Debug = false

Config.Webhooks = {
    enabled = true,
    standard = {
        script_start = {
            enabled = true,
            url = "YOUR_WEBHOOK_URL",
            color = 3066993
        },
        bill_created = {
            enabled = true,
            url = "YOUR_WEBHOOK_URL",
            color = 3066993
        },
        bill_paid = {
            enabled = true,
            url = "YOUR_WEBHOOK_URL",
            color = 15105570
        },
        bill_deleted = {
            enabled = true,
            url = "YOUR_WEBHOOK_URL",
            color = 15158332
        }
    }
}

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
        },
        webhooks = {
            bill_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 3447003
            },
            bill_paid = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 3066993
            },
            bill_deleted = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 15158332
            },
            recurring_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 10181046
            },
            recurring_payment = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 15105570
            },
            installment_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 3447003
            },
            installment_payment = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 10181046
            },
            logo = "YOUR_IMAGE_URL"
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
        },
        webhooks = {
            bill_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 15158332
            },
            bill_paid = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 3066993
            },
            bill_deleted = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 15158332
            },
            recurring_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 10181046
            },
            recurring_payment = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 15105570
            },
            installment_created = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 3447003
            },
            installment_payment = {
                enabled = true,
                url = "YOUR_WEBHOOK_URL",
                color = 10181046
            },
            logo = "YOUR_IMAGE_URL"
        }
    }
}