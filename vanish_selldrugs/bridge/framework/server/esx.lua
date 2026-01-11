if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()
local cachedCopCount, lastCopCountCheck = 0, 0

function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function GetIdentifier(player)
    return player.identifier
end

function CopCount()
    local currentTime = GetGameTimer()

    if currentTime - lastCopCountCheck > 60000 then
        for _, v in pairs(config.police.jobs) do
            cachedCopCount = cachedCopCount + #ESX.GetExtendedPlayers('job', v)
        end

        lastCopCountCheck = currentTime
    end

    return cachedCopCount
end

function HasItems(player)
    local item

    for k, v in pairs(config.drugs) do
        item = player.getInventoryItem(k)

        if item and item.count > 0 then
            return true, item, v
        end
    end

    return false
end

function RemoveItem(player, item, count)
    player.removeInventoryItem(item, count)
end

function AddMoney(player, account, amount)
    player.addAccountMoney(account, amount)
end