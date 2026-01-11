--[[
    Gang-Specific Management Locations

    Only edit this file when management.mode = 'multiple' in shared/config.lua

    Each location is dedicated to a specific gang. Only leaders of that gang
    can interact with their designated location.

    Configuration:
    - gang: The internal gang name (must match database gang names)
    - coords: The world coordinates for the management point
    - heading: The direction the NPC will face (if using NPC interaction)
]]

return {
    {
        gang = 'ballas',
        coords = vector3(-232.1606, -974.2057, 29.2886),
        heading = 287.1345
    },
    -- {
    --     gang = 'vagos',
    --     coords = vector3(-269.0714, -955.8455, 31.2231),
    --     heading = 90.0
    -- },
    -- {
    --     gang = 'families',
    --     coords = vector3(-30.0, -1434.0, 31.0),
    --     heading = 270.0
    -- },
}