if GetResourceState('es_extended') ~= 'started' then return end

RegisterNetEvent('esx:playerLoaded', function()
    Debug('[INIT] Player loaded event received', true)
    TriggerEvent('vanish_turfs:client:playerLoaded')
end)
