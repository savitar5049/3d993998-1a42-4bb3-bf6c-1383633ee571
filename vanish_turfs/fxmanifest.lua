fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vanishdev'
version '1.1.0'

shared_scripts { '@ox_lib/init.lua', '@es_extended/imports.lua', 'shared/*.lua' }
client_scripts { 'bridge/**/client/*.lua', 'client/zones.lua', 'client/ui.lua', 'client/init.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'bridge/**/server/*.lua', 'server/db.lua', 'server/stats.lua', 'server/controller.lua', 'server/init.lua' }

ui_page 'web/build/index.html'
files { 'locales/*.json', 'web/build/**/*' }

escrow_ignore { 'bridge/**', 'shared/**' }
dependencies { 'ox_lib', 'oxmysql' }
dependency '/assetpacks'