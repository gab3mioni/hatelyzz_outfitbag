fx_version 'cerulean'
game 'gta5'

author 'hatelyzz'
version '1.0'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
    'config.lua',
}
server_scripts {
    'server/*.lua',
    'config.lua',
}

depencies {
    'ox_lib',
    'illenium-appearance'
}

lua54 'yes'