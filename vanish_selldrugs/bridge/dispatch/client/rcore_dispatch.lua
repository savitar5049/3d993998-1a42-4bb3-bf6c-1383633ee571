if GetResourceState('rcore_dispatch') ~= 'started' then return end

function NotifyPolice(playerCoords)
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    local alertData = {
        code = '10-60',                    -- Alert code
        default_priority = 'medium',       -- 'low', 'medium', or 'high'
        coords = playerCoords,        -- Alert location
        job = 'police',                    -- Job(s) to receive alert (string or table)
        text = 'Suspicious activity has been detected in the area of ' .. streetName,     -- Alert description
        type = 'alerts',                   -- Alert type for statistics
        blip_time = 5,                     -- Optional: Blip fade time (seconds)
        image = 'url_to_image.jpg',        -- Optional: Image URL
        custom_sound = 'url_to_sound.mp3', -- Optional: Custom sound URL
        blip = {                           -- Optional: Custom blip settings
            sprite = 51,
            colour = 0,
            scale = 0.8,
            text = '10-60 - Drug Sale',
            flashes = false,
            radius = 0,
        }
    }

    TriggerServerEvent('rcore_dispatch:server:sendAlert', alertData)
end