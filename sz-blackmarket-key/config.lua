Config = {}

-- Cooldown time in seconds
Config.TeleportCooldown = 300

-- Discord Webhook
Config.Webhook = "YOUR_DISCORD_WEBHOOK_HERE"

-- Required item name
Config.RequiredItem = "blackmarket_key"

-- Teleport locations
Config.TeleportLocations = {
    ["blackmarket_entry"] = {
        ped = vector3(133.58, -1328.37, 34.02),
        heading = 90.0,
        label = "Enter Blackmarket",
        from = vector3(123.4, -1300.5, 29.2),
        to = vector3(900.0, -3200.0, -98.2),
    },
    ["blackmarket_exit"] = {
        ped = vector3(900.0, -3200.0, -98.2),
        heading = 270.0,
        label = "Exit Blackmarket",
        from = vector3(900.0, -3200.0, -98.2),
        to = vector3(135.24, -1327.41, 34.02),
    }
}