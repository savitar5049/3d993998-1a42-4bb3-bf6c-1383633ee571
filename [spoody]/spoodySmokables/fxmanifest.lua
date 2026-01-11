fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'Spoody'
description 'Usable cookies/vapes for spoodyCookies and any configurable item!'

shared_scripts {
    '@ox_lib/init.lua',
    'configuration.lua',
}

client_script 'source/client.lua'
server_script 'source/server.lua'

escrow_ignore 'configuration.lua'
dependency '/assetpacks'