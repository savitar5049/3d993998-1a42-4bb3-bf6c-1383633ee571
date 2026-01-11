fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vanishdev'
version '1.0.0'

shared_scripts { '@ox_lib/init.lua', 'shared/*.lua' }
client_scripts { 'bridge/**/client/*.lua', 'client/*.lua' }
server_scripts { 'bridge/**/server/*.lua', 'server/*.lua' }

files { 'locales/*.json' }

escrow_ignore { 'bridge/**', 'shared/**', 'locales/*.json', 'install/*.png' }
dependencies { 'ox_lib' }

dependency '/assetpacks'