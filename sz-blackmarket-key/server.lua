QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('sz-blackmarket-key:checkItem', function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then cb(false) return end

    local invItem = Player.Functions.GetItemByName(item)
    cb(invItem ~= nil and invItem.amount > 0)
end)

RegisterServerEvent("sz-blackmarket-key:removeItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveItem(item, 1)
    end
end)

RegisterServerEvent("sz-blackmarket-key:logTeleport", function(label)
    local src = source
    local name = GetPlayerName(src)
    local msg = ("**%s** used a Blackmarket Key to teleport via: **%s**"):format(name, label)

    PerformHttpRequest(Config.Webhook, function() end, "POST", json.encode({
        username = "Blackmarket Logs",
        embeds = {{
            description = msg,
            color = 16711680
        }}
    }), {["Content-Type"] = "application/json"})
end)