if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

local function syncCratesForPlayer(playerId)
  local crates = exports.vanish_cratedrops:GetActiveCrates()
  for crateId, crate in pairs(crates) do
    TriggerClientEvent('vanish_cratedrops:syncActiveCrate', playerId, crateId, crate.coords.x, crate.coords.y, crate.coords.z, crate.radius, crate.tier)
    Wait(100)
  end
end

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
  local src = Player and Player.PlayerData and Player.PlayerData.source or nil
  if src then syncCratesForPlayer(src) end
end)

function GetPlayer(id)
    return QBCore.Functions.GetPlayer(id)
end

function GetIdentifier(player)
    return player.PlayerData.citizenid
end