if GetResourceState('wasabi_ambulance') ~= 'started' then return end

---@param playerId number Player source
---@return boolean True if player is dead
function IsPlayerDead(playerId)
    local player = Player(playerId)
    if not player then return false end

    return player.state.dead or false
end

---@param playerId number Player source
function RevivePlayer(playerId)
    TriggerClientEvent('wasabi_ambulance:revive', playerId)
end
