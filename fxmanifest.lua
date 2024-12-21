fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Illama'
description 'Illama Billing est un script ESX de gestion des factures conçu pour une intégration facile et des interactions utilisateur optimisées.'
version '1.0.0'

dependencies {
    'es_extended',
    'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'shared/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
