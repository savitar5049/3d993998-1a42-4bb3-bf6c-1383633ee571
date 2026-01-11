if GetResourceState('rcore_gangs') ~= 'started' then return end

local gangs = exports.rcore_gangs

---@param playerId number Player source
---@return string|nil Gang name or nil
function GetPlayerGang(playerId)
    local gangData = gangs:GetPlayerGang(playerId)
    if gangData and type(gangData) == 'table' then
        return gangData.name or gangData.gang
    elseif type(gangData) == 'string' then
        return gangData
    end
    return nil
end

---@param gangName string Gang name
---@return string Gang label or name as fallback
function GetGangLabel(gangName)
    -- rcore_gangs typically uses the name as label
    return gangName
end

---@param playerId number Player source
---@return boolean True if player is in a gang
function IsPlayerInGang(playerId)
    return GetPlayerGang(playerId) ~= nil
end
