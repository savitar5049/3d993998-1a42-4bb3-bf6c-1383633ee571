--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
games        { 'rdr3', 'gta5' }
this_is_a_map 'yes'

-- Hello Dumpers if you would like to purchase this asset join https://discord.gg/ccore

--[[ Resource Information ]]--
name         'core'
author       'Core'
description 'Core Coinshop'

ui_page 'dist/index.html'
files {'dist/index.html', 'dist/assets/**'}

shared_scripts {
    'configurations/config.lua',
}

client_scripts {
    'client/**/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'configurations/server-config.lua',
    'server/**/*.lua'
}

escrow_ignore {
    'configurations/*.lua'
}
dependency '/assetpacks'