fx_version 'bodacious'
games {'gta5'}
lua54 'yes'
author 'OffSey'
description 'LSPD Appointment System'
Discord 'https://discord.gg/SWDSeKksaR - Official discord'


files {
    'locales/*.json'
}

shared_scripts { 
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/cl_main.lua',
    'client/cl_editable.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'locales/*.lua'
}

server_exports {
    "webhooks"
}
