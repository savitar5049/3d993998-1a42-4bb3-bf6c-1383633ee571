if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Debug('[INIT] Player loaded event received', true)
    TriggerEvent('vanish_turfs:client:playerLoaded')
end)
