if GetResourceState('vanish_gangs') ~= 'started' then return end

local Gangs = exports.vanish_gangs:Gangs()

---@param playerId number Player source
---@return table|nil Gang data or nil if not in gang
function GetPlayerGang(playerId)
    return Gangs.GetPlayerGang(playerId)
end

---@param playerId number Player source
---@return boolean True if player is in a gang
function IsPlayerInGang(playerId)
    local gangData = GetPlayerGang(playerId)
    return gangData ~= nil and gangData.name ~= nil
end

---@param gangName string Gang name
---@return table Array of player sources
function GetOnlineGangMembers(gangName)
    local members = {}
    for _, playerId in pairs(GetPlayers()) do
        local gangData = GetPlayerGang(playerId)
        if gangData and gangData.name == gangName then
            members[#members + 1] = playerId
        end
    end
    return members
end

---@param message string Notification message
function NotifyAllGangMembers(message)
    if not config.gangIntegration.enabled or not config.gangIntegration.notifyGangMembers then
        return
    end

    for _, playerId in pairs(GetPlayers()) do
        if IsPlayerInGang(playerId) then
            ShowNotification(message, playerId)
        end
    end
end
