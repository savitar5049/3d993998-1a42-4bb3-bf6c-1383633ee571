if GetResourceState('wasabi_ambulance') ~= 'started' then return end

function IsPlayerDead(source)
    return Player(source).state.dead
end