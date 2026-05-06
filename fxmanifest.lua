fx_version 'cerulean'
game 'gta5'

name        'kt_lockpick'
description 'Mini-jeu de crochetage + système de clés — Vite + React'
version     '2.0.0'
author      'kitotake'

shared_scripts {
    'shared/config.lua',
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/main.lua',
}

nui_callbacks {
    'success',
    'fail',
    'close',
}

ui_page 'web/dist/index.html'

files {
    'web/dist/**',
}