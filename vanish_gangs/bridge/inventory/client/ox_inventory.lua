if GetResourceState('ox_inventory') ~= 'started' then return end

---Opens the gang inventory stash for the player
---@param gangName string The name of the gang whose stash to open
function OpenGangInventory(gangName)
    exports.ox_inventory:openInventory('stash', gangName)
end
