if GetResourceState('ox_inventory') ~= 'started' then return end

local Inventory = exports.ox_inventory

---@param target number|string Player ID or stash name
---@param itemName string Item name
---@param amount number Amount to add
---@return boolean Success status
function AddItem(target, itemName, amount)
    local success, result = pcall(function()
        return Inventory:AddItem(target, itemName, amount)
    end)

    if success and result then
        Debug('[BRIDGE] Added ' .. amount .. 'x ' .. itemName .. ' to ' .. tostring(target))
        return true
    end

    Debug('[BRIDGE] Failed to add item to ' .. tostring(target))
    return false
end

---@param target number|string Player ID or stash name
---@param itemName string Item name
---@param amount number Amount to remove
---@return boolean Success status
function RemoveItem(target, itemName, amount)
    local success, result = pcall(function()
        return Inventory:RemoveItem(target, itemName, amount)
    end)

    if success and result then
        Debug('[BRIDGE] Removed ' .. amount .. 'x ' .. itemName .. ' from ' .. tostring(target))
        return true
    end

    Debug('[BRIDGE] Failed to remove item from ' .. tostring(target))
    return false
end

---@return table|nil Items table or nil
function GetItems()
    local success, items = pcall(function()
        return Inventory:Items()
    end)

    if success and type(items) == 'table' then
        return items
    end

    return nil
end

---@param itemName string Item name
---@return string Item label or name as fallback
function GetItemLabel(itemName)
    if type(itemName) ~= 'string' or #itemName == 0 then
        return itemName
    end

    local items = GetItems()
    if items and items[itemName] and items[itemName].label then
        return items[itemName].label
    end

    return itemName
end

---@param stashId string Stash identifier
---@param label string Display label
---@param slots number Number of slots
---@param weight number Max weight
function RegisterStash(stashId, label, slots, weight)
    local success = pcall(function()
        Inventory:RegisterStash(stashId, label, slots, weight, false)
    end)

    if success then
        Debug('[BRIDGE] Registered stash: ' .. stashId)
    else
        Debug('[BRIDGE] Failed to register stash: ' .. stashId)
    end
end
