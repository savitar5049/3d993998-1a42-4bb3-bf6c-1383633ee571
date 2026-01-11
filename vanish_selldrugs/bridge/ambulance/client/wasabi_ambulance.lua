if GetResourceState('wasabi_ambulance') ~= 'started' then return end

function IsPlayerDead()
    return LocalPlayer.state.dead
end