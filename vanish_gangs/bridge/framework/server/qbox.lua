if GetResourceState('qbx_core') ~= 'started' then return end

local QBX = exports.qbx_core

-- Bridge Configuration
local BridgeConfig = {
    database = {
        table = 'players',
        identifierColumn = 'citizenid'
    }
}

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
    return QBX:GetPlayer(id)
end

---Get player object from identifier
---@param identifier string Player identifier
---@return table|nil Player object
function GetPlayerFromIdentifier(identifier)
    return QBX:GetPlayerByCitizenId(identifier)
end

---Get player's full name
---@param player table Player object
---@return string|nil Player name
function GetPlayerFullName(player)
    if not player or not player.PlayerData or not player.PlayerData.charinfo then return nil end
    return ('%s %s'):format(player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname)
end

---Get player's source/server ID
---@param player table Player object
---@return number|nil Server ID
function GetSource(player)
    if not player or not player.PlayerData then return nil end
    return player.PlayerData.source
end

---Get player's identifier
---@param player table Player object
---@return string|nil Identifier
function GetIdentifier(player)
    if not player or not player.PlayerData then return nil end
    return player.PlayerData.citizenid
end

---Get player's permission group
---@param player table Player object
---@return string|nil
function GetPlayerGroup(player)
    if not player then return nil end
    if QBX.GetPermission and player.PlayerData and player.PlayerData.source then
        return QBX:GetPermission(player.PlayerData.source)
    end

    if not player.PlayerData then return nil end
    return player.PlayerData.group or player.PlayerData.permission or nil
end
