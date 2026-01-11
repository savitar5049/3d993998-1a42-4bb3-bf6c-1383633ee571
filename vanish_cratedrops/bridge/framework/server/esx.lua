if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

local function syncCratesForPlayer(playerId)
  local crates = exports.vanish_cratedrops:GetActiveCrates()
  for crateId, crate in pairs(crates) do
    TriggerClientEvent('vanish_cratedrops:syncActiveCrate', playerId, crateId, crate.coords.x, crate.coords.y, crate.coords.z, crate.radius, crate.tier)
    Wait(100)
  end
end

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
  syncCratesForPlayer(playerId)
end)

function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function GetIdentifier(player)
    return player.identifier
end