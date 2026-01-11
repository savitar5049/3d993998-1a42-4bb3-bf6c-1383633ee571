if GetResourceState('qs-dispatch') ~= 'started' then return end

function NotifyPolice(playerCoords)
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    exports['qs-dispatch']:DrugSale()
end