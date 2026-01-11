if GetResourceState('qbx_core') ~= 'started' then return end

local QBX = exports.qbx_core
local cachedCopCount, lastCopCountCheck = 0, 0
local ox_inventory = exports.ox_inventory

function GetPlayer(id)
    return QBX:GetPlayer(id)
end

function CopCount()
    local currentTime = GetGameTimer()

    if currentTime - lastCopCountCheck > 60000 then
        for _, v in pairs(config.police.jobs) do
            cachedCopCount = cachedCopCount + QBX:GetDutyCountJob(v)
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
    return ox_inventory:RemoveItem(player.source, item, count)
end

function AddMoney(player, account, amount)
    return QBX:AddMoney(player.source, account, amount)
end