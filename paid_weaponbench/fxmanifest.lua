fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'you'
description 'Standalone multi weapon benches with per-bench price + admin add/remove'
version '2.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'ox_lib',
    'es_extended'
}
