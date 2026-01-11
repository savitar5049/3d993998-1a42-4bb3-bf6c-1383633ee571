if GetResourceState('esx_ambulancejob') ~= 'started' then return end

function IsPlayerDead(source)
    return Player(source).state.isDead
end