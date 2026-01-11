local ESX = exports['es_extended']:getSharedObject()

local dataFile = 'benches.json'
local Benches = {}

local function loadBenches()
    local raw = LoadResourceFile(GetCurrentResourceName(), dataFile)
    if not raw or raw == '' then return {} end

    local ok, decoded = pcall(json.decode, raw)
    if not ok or type(decoded) ~= 'table' then
        return {}
    end

    return decoded
end

local function saveBenches()
    SaveResourceFile(GetCurrentResourceName(), dataFile, json.encode(Benches, { indent = true }), -1)
end

local function newId()
    -- simple unique id: time + random
    return ('%s_%s'):format(os.time(), math.random(1000, 9999))
end

local function getAccountMoney(xPlayer)
    if Config.Account == 'bank' then
        local acc = xPlayer.getAccount('bank')
        return acc and acc.money or 0
    end
    return xPlayer.getMoney()
end

local function removeAccountMoney(xPlayer, amount)
    if Config.Account == 'bank' then
        xPlayer.removeAccountMoney('bank', amount)
    else
        xPlayer.removeMoney(amount)
    end
end

Benches = loadBenches()

-- Send all benches to clients
lib.callback.register('paid_weaponbench:getAll', function()
    return Benches
end)

-- Charge and give weapon
lib.callback.register('paid_weaponbench:buy', function(source, benchId, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, 'No player' end

    local bench = Benches[benchId]
    if not bench then return false, 'Bench not found' end

    local benchFee = tonumber(bench.price) or 0

    -- find weapon extra price from shared config list (client passes weaponName)
    local extra = 0
    for _, w in ipairs(Config.Weapons) do
        if w.weapon == weaponName then
            extra = tonumber(w.extraPrice) or 0
            break
        end
    end

    local total = benchFee + extra
    if total < 0 then total = 0 end

    local money = getAccountMoney(xPlayer)
    if money < total then
        return false, ('Need $%s'):format(total)
    end

    removeAccountMoney(xPlayer, total)

    -- Give weapon (ESX)
    xPlayer.addWeapon(weaponName, 0)

    return true, ('Purchased for $%s'):format(total)
end)

-- Admin: add bench
lib.callback.register('paid_weaponbench:adminAdd', function(source, benchData)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, 'No player' end

    -- ox_lib command restricted handles permissions, but keep sanity checks
    if not benchData or type(benchData) ~= 'table' then
        return false, 'Bad data'
    end

    local id = newId()
    Benches[id] = {
        id = id,
        name = tostring(benchData.name or 'weaponbench'),
        price = tonumber(benchData.price) or 100000,
        coords = benchData.coords, -- {x,y,z}
        heading = tonumber(benchData.heading) or 0.0,
        spawnProp = benchData.spawnProp == true,
        propModel = tostring(benchData.propModel or ''),
    }

    saveBenches()
    TriggerClientEvent('paid_weaponbench:updateAll', -1, Benches)

    return true, 'Bench added'
end)

-- Admin: remove bench
lib.callback.register('paid_weaponbench:adminRemove', function(source, benchId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, 'No player' end

    if not Benches[benchId] then
        return false, 'Bench not found'
    end

    Benches[benchId] = nil
    saveBenches()
    TriggerClientEvent('paid_weaponbench:updateAll', -1, Benches)

    return true, 'Bench removed'
end)

-- Admin commands (ox_lib)
lib.addCommand('addweaponbench', {
    help = 'Add a weapon bench at your current location (opens menu)',
    restricted = 'group.admin'
}, function(source)
    TriggerClientEvent('paid_weaponbench:clientAddMenu', source)
end)

lib.addCommand('removeweaponbench', {
    help = 'Remove a weapon bench (opens list)',
    restricted = 'group.admin'
}, function(source)
    TriggerClientEvent('paid_weaponbench:clientRemoveMenu', source, Benches)
end)

lib.addCommand('listweaponbenches', {
    help = 'List all weapon benches',
    restricted = 'group.admin'
}, function(source)
    TriggerClientEvent('paid_weaponbench:clientList', source, Benches)
end)
