fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vanishdev'
version '1.1.5'

shared_scripts { '@ox_lib/init.lua', 'shared/*.lua' }
client_scripts { 'bridge/**/client/*.lua', 'client.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'bridge/**/server/*.lua', 'server.lua' }

ui_page 'web/build/index.html'
files { 'locales/*.json','web/build/index.html', 'web/build/**/*' }

escrow_ignore { 'bridge/**', 'shared/*.lua' }
dependencies { 'ox_lib' }
dependency '/assetpacks'

shared_scripts {
    'client/plugins/hook_system.js'
}