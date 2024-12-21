Config = {}
Config.OpenKey = 'F2'
Config.MaxBillAmount = 100000

-- Jobs autorisés à facturer et leurs grades minimum requis
Config.AllowedJobs = {
    ['police'] = {
        minGrade = 0,
        label = 'LSPD',
        maxAmount = 100000,
        templates = {
            {
                label = "Excès de vitesse léger",
                reason = "Excès de vitesse inférieur à 30km/h",
                amount = 750
            },
            {
                label = "Excès de vitesse grave",
                reason = "Excès de vitesse supérieur à 30km/h",
                amount = 1500
            },
            {
                label = "Stationnement gênant",
                reason = "Véhicule mal stationné",
                amount = 500
            },
            {
                label = "Refus d'obtempérer",
                reason = "Refus d'obtempérer à un contrôle de police",
                amount = 2500
            },
            {
                label = "Autre (personnalisé)",
                reason = "",
                amount = 0
            }
        }
    },
    ['ambulance'] = {
        minGrade = 0,
        label = 'E.M.S',
        maxAmount = 100000,
        templates = {
            {
                label = "MEURT",
                reason = "Refus d'obtsadsaempérer à un contrôle de police",
                amount = 2500
            },
            {
                label = "Autre (personnalisé)",
                reason = "",
                amount = 0
            }
        }
    }
}
