if GetResourceState('ox_inventory') ~= 'started' then return end

local ox_inventory = exports.ox_inventory

function GetCurrentWeapon()
    return config.preventWeaponSelling and ox_inventory:getCurrentWeapon() or false
end