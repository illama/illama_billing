fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Illama'
version '2.0.7'

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
    'locales/de.lua',
    'locales/en.lua',
    'locales/es.lua',
    'locales/fr.lua',
    'locales/it.lua',
    'locales/ja.lua',
    'locales/ko.lua',
    'locales/nl.lua',
    'locales/pt.lua',
    'locales/ru.lua',
    'locales/sr.lua',
    'locales/sv.lua',
    'locales/zh.lua'
}

client_scripts {
    'client/main.lua',
    'client/menu.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/bill_display.html'

files {
    'html/bill_display.html'
}