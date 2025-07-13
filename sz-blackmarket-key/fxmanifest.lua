fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'Blackmarket Key Teleport System'
author 'SΔJJΔD'
version '1.0.1'

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_script 'server.lua'

dependencies {
    'qb-core',
    'qb-target',
    'qs-inventory',
    'progressbar'
}