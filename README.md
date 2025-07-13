# sz-blackmarket-key
A Key Syestem Black-Market Acces

# dependencies 
    'qb-core'
    'qb-target'
    'qs-inventory or qb-inventory'
    'progressbar'

# item
qb-core/shared/item.lua
['blackmarket_key'] = {
    name = 'blackmarket_key',
    label = 'Black Market Key',
    weight = 100,
    type = 'item',
    image = 'blackmarket_key.png', -- Add this image to your inventory images folder
    unique = true,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'A suspicious key used to access the black market'
},
