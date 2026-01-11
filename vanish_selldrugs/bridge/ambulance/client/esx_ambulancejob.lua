if GetResourceState('esx_ambulancejob') ~= 'started' then return end

function IsPlayerDead()
    return LocalPlayer.state.isDead
end