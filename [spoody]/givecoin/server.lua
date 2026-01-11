local ESX = exports['es_extended']:getSharedObject()

local function isAdmin(xPlayer)
    if not xPlayer then return false end
    local g = xPlayer.getGroup()
    return (g == 'admin' or g == 'superadmin')
end

RegisterCommand('givecoin', function(source, args)
    local xAdmin = ESX.GetPlayerFromId(source)

    -- Allow console
    if source ~= 0 then
        if not isAdmin(xAdmin) then
            xAdmin.showNotification('No permission')
            return
        end
    end

    local targetId = tonumber(args[1])
    local amount = tonumber(args[2])

    if not targetId or not amount or amount <= 0 then
        if source ~= 0 then
            xAdmin.showNotification('Usage: /givecoin [id] [amount]')
        end
        return
    end

    local xTarget = ESX.GetPlayerFromId(targetId)
    if not xTarget then
        if source ~= 0 then xAdmin.showNotification('Player not online') end
        return
    end

    local identifier = xTarget.identifier

    -- Ensure row exists
    MySQL.update([[
        INSERT INTO core_coinstore (identifier, coins, time, lastMinRewarded)
        VALUES (?, 0, 0, 0)
        ON DUPLICATE KEY UPDATE identifier = identifier
    ]], { identifier })

    -- Add coins
    MySQL.scalar('SELECT coins FROM core_coinstore WHERE identifier = ?', { identifier }, function(oldCoins)
        oldCoins = tonumber(oldCoins) or 0
        local newCoins = oldCoins + amount

        MySQL.update('UPDATE core_coinstore SET coins = ? WHERE identifier = ?', { newCoins, identifier }, function()
            -- Notify target (doesn't require editing the escrow script)
            TriggerClientEvent('ox_lib:notify', xTarget.source, {
                title = 'Coin Store',
                description = ('You received %s coins. New balance: %s'):format(amount, newCoins),
                position = 'top',
                duration = 5000,
                icon = 'coins'
            })

            if source ~= 0 then
                xAdmin.showNotification(('Gave %s coins to %s (new: %s)'):format(amount, xTarget.getName(), newCoins))
            else
                print(('[givecoin] Gave %s coins to %s (new: %s)'):format(amount, identifier, newCoins))
            end
        end)
    end)
end, false)
