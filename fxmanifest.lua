fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Illama'
version '1.1.0'

dependencies {
    'es_extended',
    'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'shared/config.lua',
    'locales/shared.lua',
    'locales/ar.lua',
    'locales/ru.lua',
    'locales/zh.lua',
    'locales/es.lua',
    'locales/en.lua',
    'locales/fr.lua',
    'locales/it.lua'
}

client_scripts {
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
