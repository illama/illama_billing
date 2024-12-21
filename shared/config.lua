Config = {}
Config.OpenKey = 'F2'
Config.MaxBillAmount = 100000

-- Jobs autorisés à facturer et leurs grades minimum requis
Config.AllowedJobs = {
    ['police'] = {
        minGrade = 0, -- 0 = tous les grades peuvent facturer
        label = 'LSPD',
        maxAmount = 100000 -- Montant maximum pour ce job (optionnel, utilise MaxBillAmount par défaut)
    },
    ['ambulance'] = {
        minGrade = 1, -- Grade 1 minimum pour facturer
        label = 'EMS',
        maxAmount = 50000
    },
    ['mechanic'] = {
        minGrade = 0,
        label = 'Mécano',
        maxAmount = 75000
    }
    -- Ajoutez d'autres jobs selon vos besoins
}
