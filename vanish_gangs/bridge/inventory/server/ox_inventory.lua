if GetResourceState('ox_inventory') ~= 'started' then return end

--[[
    Stashes Table:
    {
        id: String,
        label: String,
        slots: Number,
        weight: Number,
    }
]]
AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        local stashes = exports['vanish_gangs']:fetchStashData()

        for _, stash in ipairs(stashes) do
            exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, false)
        end
    end
end)