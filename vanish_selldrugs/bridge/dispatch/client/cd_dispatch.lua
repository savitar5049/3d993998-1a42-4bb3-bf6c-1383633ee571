if GetResourceState('cd_dispatch') ~= 'started' then return end

function NotifyPolice(playerCoords)
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    local data = exports['cd_dispatch']:GetPlayerInfo()
    TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = config.police.jobs, 
        coords = playerCoords,
        title = '10-60 - Drug Sale',
        message = 'Suspicious acitivty has been detected in the area of ' .. streetName, 
        flash = 0,
        unique_id = data.unique_id,
        sound = 1,
        blip = {
            sprite = 51, 
            scale = 0.8, 
            colour = 0,
            flashes = false, 
            text = '10-60 - Drug Sale',
            time = 5,
            radius = 0,
        }
    })
end