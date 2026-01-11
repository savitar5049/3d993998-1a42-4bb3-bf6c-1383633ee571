fx_version 'bodacious'
author 'spoody'
description "Advanced FiveM cookies shop & job system!"

lua54 'yes'
game 'gta5'

shared_scripts {'@ox_lib/init.lua', 'configuration.lua'}

client_scripts {
    'source/client/job/*.lua',
    'source/client/player/*.lua',
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'source/server/*.lua'
}

ui_page 'web/web.html'

files {
    'web/web.html',
    'web/style.css',
    'web/cart.js',
    'web/script.js',
}

escrow_ignore 'configuration.lua'
dependency '/assetpacks'