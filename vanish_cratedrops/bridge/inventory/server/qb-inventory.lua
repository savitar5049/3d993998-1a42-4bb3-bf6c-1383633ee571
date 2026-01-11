if GetResourceState('qb-inventory') ~= 'started' and GetResourceState('ps-inventory') ~= 'started' then return end

local QBInv = exports['qb-inventory']

function CreateStash(crateId, items)
    local stashId = config.stash.prefix .. crateId
    Debug(('Creating stash %s with %s items'):format(stashId, #items))

    local stashItems = {}
    local slot = 0

    for _, entry in ipairs(items) do
        slot = slot + 1
        stashItems[slot] = {
            name = entry.item,
            amount = entry.amount,
            info = {},
            slot = slot
        }
        if slot >= config.stash.slots then break end
    end

    pcall(function()
        if QBInv.ClearStash then
            QBInv:ClearStash(stashId)
        end
    end)

    local success, err = pcall(function()
        return QBInv:SetStashItems(stashId, stashItems)
    end)

    if not success then
        Debug('Failed to create stash: ' .. tostring(err))
        return false
    end

    return true
end

function ClearStash(crateId)
    local stashId = config.stash.prefix .. crateId
    Debug('Clearing stash: ' .. stashId)

    pcall(function()
        if QBInv.ClearStash then
            QBInv:ClearStash(stashId)
        else
            QBInv:SetStashItems(stashId, {})
        end
    end)
end

function IsStashEmpty(crateId)
    local stashId = config.stash.prefix .. crateId
    local success, items = pcall(function()
        return QBInv:GetStashItems(stashId)
    end)

    if not success or not items then
        return true
    end

    for _, item in pairs(items) do
        if item and item.amount and item.amount > 0 then
            return false
        end
    end

    return true
end

function OpenStash(source, crateId)
    local stashId = config.stash.prefix .. crateId
    Debug(('Player %s opening crate stash: %s'):format(source, stashId))

    TriggerClientEvent('inventory:client:SetCurrentStash', source, stashId)
    TriggerEvent('inventory:server:OpenInventory', 'stash', stashId, {
        maxweight = config.stash.maxWeight * 1000,
        slots = config.stash.slots
    })
end

function HasItem(source, itemName)
    local Player = GetPlayer(source)
    if not Player then return false end

    local item = Player.Functions.GetItemByName(itemName)
    return item ~= nil and item.amount > 0
end
