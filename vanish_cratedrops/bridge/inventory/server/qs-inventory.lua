if GetResourceState('qs-inventory') ~= 'started' then return end

local QS = exports['qs-inventory']

---@param crateId number The crate ID
---@param items table Array of items to add to stash
---@return boolean Success status
function CreateStash(crateId, items)
    local stashId = config.stash.prefix .. crateId

    Debug(('Creating stash %s with %s items'):format(stashId, #items))

    local success, result = pcall(function()
        return QS:RegisterStash(stashId, config.stash.slots, config.stash.maxWeight)
    end)

    if not success then
        Debug('Error creating stash: ' .. tostring(result))
        return false
    end

    for _, itemData in pairs(items) do
        pcall(function()
            QS:AddItemIntoStash(stashId, itemData.item, itemData.amount)
        end)
    end

    return true
end

---@param crateId number The crate ID
function ClearStash(crateId)
    local stashId = config.stash.prefix .. crateId

    Debug('Clearing stash: ' .. stashId)

    pcall(function()
        QS:ClearStash(stashId)
    end)
end

---@param crateId number The crate ID
---@return boolean True if stash is empty
function IsStashEmpty(crateId)
    local stashId = config.stash.prefix .. crateId

    local success, items = pcall(function()
        return QS:GetStashItems(stashId)
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

---@param source number Player source
---@param crateId number The crate ID
function OpenStash(source, crateId)
    local stashId = config.stash.prefix .. crateId
    Debug(('Player %s opening crate stash: %s'):format(source, stashId))

    QS:OpenStash(source, stashId)
end

---@param source number Player source
---@param itemName string Item name
---@return boolean Has item
function HasItem(source, itemName)
    local success, result = pcall(function()
        return QS:GetItemTotalAmount(source, itemName)
    end)

    if success and result and result > 0 then
        return true
    end

    return false
end
