if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

-- Bridge Configuration
local BridgeConfig = {
    database = {
        table = 'users',
        identifierColumn = 'identifier'
    }
}

RegisterNetEvent('esx:playerLoaded', function(_, xPlayer)
    if config.hud.enabled then
        Debug('[BRIDGE] Player loaded, enabling gang HUD', false)
        TriggerClientEvent('vanish_gangs:uiDisplay', xPlayer.source, true)
    end
end)

---Get the database table name for players
---@return string
function GetTable()
    return BridgeConfig.database.table
end

---Get the identifier column name for players
---@return string
function GetColumn()
    return BridgeConfig.database.identifierColumn
end

---Get player object from server ID
---@param id number Server ID
---@return table|nil Player object
function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

---Get player object from identifier
---@param identifier string Player identifier
---@return table|nil Player object
function GetPlayerFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

---Get player's full name
---@param player table Player object
---@return string|nil Player name
function GetPlayerFullName(player)
    if not player then return nil end
    return player.getName()
end

---Get player's source/server ID
---@param player table Player object
---@return number|nil Server ID
function GetSource(player)
    if not player then return nil end
    return player.source
end

---Get player's identifier
---@param player table Player object
---@return string|nil Identifier
function GetIdentifier(player)
    if not player then return nil end
    return player.identifier
end

---Get player's permission group
---@param player table Player object
---@return string|nil
function GetPlayerGroup(player)
    if not player then return nil end
    return player.getGroup()
end
