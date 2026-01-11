if GetResourceState('qbx_core') ~= 'started' then return end

local QBX = exports.qbx_core

local function syncCratesForPlayer(playerId)
  local crates = exports.vanish_cratedrops:GetActiveCrates()
  for crateId, crate in pairs(crates) do
    TriggerClientEvent('vanish_cratedrops:syncActiveCrate', playerId, crateId, crate.coords.x, crate.coords.y, crate.coords.z, crate.radius, crate.tier)
    Wait(100)
  end
end

AddEventHandler('qbx:playerLoaded', function(playerId)
  if playerId then syncCratesForPlayer(playerId) end
end)

function GetPlayer(id)
    return QBX:GetPlayer(id)
end

function GetIdentifier(player)
    return player.PlayerData.citizenid
end