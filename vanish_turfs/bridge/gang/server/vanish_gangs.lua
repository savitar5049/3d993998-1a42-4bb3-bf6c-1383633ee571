if GetResourceState('vanish_gangs') ~= 'started' then return end

local gangs = exports.vanish_gangs

---@param playerId number Player source
---@return string|nil Gang name or nil
function GetPlayerGang(playerId)
    local gangData = gangs:GetPlayerGang(playerId)
    if gangData and type(gangData) == 'table' then
        return gangData.name
    end
    return nil
end

---@param gangName string Gang name
---@return string Gang label or name as fallback
function GetGangLabel(gangName)
    local cache = exports.vanish_gangs:Gangs()
    if not cache or not cache.gangs then return gangName end

    local gang = cache.gangs[gangName]
    return gang and gang.label or gangName
end

---@param playerId number Player source
---@return boolean True if player is in a gang
function IsPlayerInGang(playerId)
    return gangs:IsPlayerInGang(playerId)
end
