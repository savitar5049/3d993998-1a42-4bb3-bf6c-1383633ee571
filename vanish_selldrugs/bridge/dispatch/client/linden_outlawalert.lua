if GetResourceState('linden_outlawalert') ~= 'started' then return end

function dispatchPolice(playerCoords)
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    local data = {displayCode = '10-60', description = 'Drug Sale', isImportant = 0, recipientList = config.police.jobs, length = '10000', infoM = 'fa-info-circle', info = 'Suspicious activity has been detected in the area of ' .. streetName}
    local dispatchData = {dispatchData = data, caller = 'Citizen', coords = playerCoords}
    TriggerServerEvent('wf-alerts:svNotify', dispatchData)
end