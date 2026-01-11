if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()
local cachedCopCount, lastCopCountCheck = 0, 0

function GetPlayer(id)
    return QBCore.Functions.GetPlayer(id)
end

function CopCount()
    local currentTime = GetGameTimer()

    if currentTime - lastCopCountCheck > 60000 then
        for _, v in pairs(config.police.jobs) do
            local _, currentCount = QBCore.Functions.GetPlayersOnDuty(v)

            cachedCopCount = cachedCopCount + currentCount
        end

        lastCopCountCheck = currentTime
    end

    return cachedCopCount
end

function HasItems(player)
    local item

    for k, v in pairs(config.drugs) do
        item = ox_inventory:GetItem(player.source, k, nil, false)

        if item and item.count > 0 then
            return true, item, v
        end
    end

    return false
end

function RemoveItem(player, item, count)
    ox_inventory:removeItem(player.source, item, count)
end

function AddMoney(player, account, amount)
    QBCore.Functions.AddMoney(player.source, account, amount)
end