if GetResourceState('ps-dispatch') ~= 'started' then return end

function NotifyPolice(playerCoords)
    local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    
    exports['ps-dispatch']:DrugSale()
end