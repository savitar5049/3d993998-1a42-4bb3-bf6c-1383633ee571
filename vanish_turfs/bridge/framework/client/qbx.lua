if GetResourceState('qbx_core') ~= 'started' and GetResourceState('qb-core') ~= 'started' then return end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Debug('[INIT] Player loaded event received', true)
    TriggerEvent('vanish_turfs:client:playerLoaded')
end)
