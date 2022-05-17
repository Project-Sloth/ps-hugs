fx_version 'cerulean'
game 'gta5'

author 'Project Sloth'
description 'Stress relief for players'
version '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'config.lua',
    'client/cl_*.lua'
}
server_script 'server/sv_*.lua'
lua54 'yes'