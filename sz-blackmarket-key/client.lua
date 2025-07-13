local QBCore = exports['qb-core']:GetCoreObject()
local lastTeleport = 0

CreateThread(function()
    for name, data in pairs(Config.TeleportLocations) do
        local pedHash = `s_m_m_security_01`
        RequestModel(pedHash)
        while not HasModelLoaded(pedHash) do Wait(0) end

        local ped = CreatePed(4, pedHash, data.ped.x, data.ped.y, data.ped.z - 1.0, data.heading, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    label = data.label,
                    icon = "fas fa-door-open",
                    action = function()
                        local player = PlayerPedId()

                        QBCore.Functions.TriggerCallback("sz-blackmarket-key:checkItem", function(hasItem)
                            if name == "blackmarket_entry" and not hasItem then
                                QBCore.Functions.Notify("You need a Blackmarket Key!", "error")
                                return
                            end
                            TriggerTeleport(name, data)
                        end, Config.RequiredItem)
                    end
                }
            },
            distance = 2.0
        })
    end
end)

function TriggerTeleport(name, data)
    local ped = PlayerPedId()

    -- Set label based on teleport type
    local labelText = name == "blackmarket_entry" and "Entering Black Market..." or "Leaving Black Market..."

    -- Load animation
    local dict = "missheistdockssetup1clipboard@base"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end

    -- Play animation
    TaskPlayAnim(ped, dict, "base", 8.0, -8.0, -1, 1, 0, false, false, false)

    -- Show progress bar
    TriggerEvent("progressbar:client:progress", {
        name = "teleport_progress",
        duration = 5000,
        label = labelText,
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }
    }, function()
        ClearPedTasks(ped)

        -- Teleport
        SetEntityCoords(ped, data.to.x, data.to.y, data.to.z)

        -- Optional: post-teleport animation
        TaskPlayAnim(ped, dict, "base", 8.0, -8.0, -1, 1, 0, false, false, false)
        Wait(2000)
        ClearPedTasks(ped)

        -- Entry-specific logic
        if name == "blackmarket_entry" then
            TriggerServerEvent("sz-blackmarket-key:removeItem", Config.RequiredItem)
            TriggerServerEvent("sz-blackmarket-key:logTeleport", data.label)
        end
    end)
end
