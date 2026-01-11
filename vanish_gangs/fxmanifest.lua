fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'vanishdev'
version '1.12.2'

shared_scripts { '@ox_lib/init.lua', '@es_extended/imports.lua', 'shared/*.lua' }
client_scripts { 'bridge/**/client/*.lua', 'client/*.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'bridge/**/server/*.lua', 'server/utils.lua', 'server/cache.lua', 'server/admin.lua', 'server/members.lua', 'server/init.lua', 'server/autodb.lua', 'server/commands.lua', 'server/stashes.lua' }

ui_page 'web/build/index.html'
files { 'locales/*.json', 'web/build/index.html', 'web/build/**/*' }

escrow_ignore { 'bridge/**', 'shared/*.lua' }
dependencies { 'ox_lib' }

dependency '/assetpacks'