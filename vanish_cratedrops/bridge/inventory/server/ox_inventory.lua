if GetResourceState('ox_inventory') ~= 'started' then return end

local Inventory = exports.ox_inventory

---@param crateId number The crate ID
---@param items table Array of items to add to stash
---@return boolean Success status
function CreateStash(crateId, items)
    local stashId = config.stash.prefix .. crateId

    Debug(('Creating stash %s with %s items'):format(stashId, #items))

    local success, result = pcall(function()
        return Inventory:RegisterStash(stashId, locale('labels.crate_stash'), config.stash.slots, config.stash.maxWeight, nil)
    end)

    if not success then
        Debug('Error creating stash: ' .. tostring(result))
        return false
    end

    for _, itemData in pairs(items) do
        local added, response = pcall(function()
            return Inventory:AddItem(stashId, itemData.item, itemData.amount)
        end)

        if added then
            Debug(('Added %s x%s to stash'):format(itemData.item, itemData.amount))
        else
            Debug(('Failed to add %s: %s'):format(itemData.item, tostring(response)))
        end
    end

    return true
end

---@param crateId number The crate ID
function ClearStash(crateId)
    local stashId = config.stash.prefix .. crateId

    Debug('Clearing stash: ' .. stashId)

    pcall(function()
        Inventory:ClearStash(stashId)
    end)
end

---@param crateId number The crate ID
---@return boolean True if stash is empty
function IsStashEmpty(crateId)
    local stashId = config.stash.prefix .. crateId
    local inventory = Inventory:GetInventory(stashId)

    if not inventory or not inventory.items then
        return true
    end

    for _, item in pairs(inventory.items) do
        if item and item.count and item.count > 0 then
            return false
        end
    end

    return true
end

---@param source number Player source
---@param crateId number The crate ID
function OpenStash(source, crateId)
    local stashId = config.stash.prefix .. crateId
    Debug(('Player %s opening crate stash: %s'):format(source, stashId))

    Inventory:forceOpenInventory(source, 'stash', stashId)
end

---@param source number Player source
---@param itemName string Item name
---@return boolean Has item
function HasItem(source, itemName)
    local success, result = pcall(function()
        return Inventory:GetItem(source, itemName, nil, true)
    end)

    if success and result and result > 0 then
        return true
    end

    return false
end
