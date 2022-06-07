fx_version 'cerulean'

game 'gta5'

author 'Marttins#8421 (mt scripts)  '

description 'mt-billing'

version '1.0'

client_scripts{
    'client.lua',
}

shared_scripts{
    'config.lua',
}

server_scripts{
    'server.lua',
    '@oxmysql/lib/MySQL.lua',
}