shared_config = {
    newESX = true, -- This is if you are using the new esx.
    coreResource = 'es_extended', -- This is the resource name for the core resource.
    serverName = 'Malibu Hills La', -- This is the name for the server.
    inventoryPath = 'inventory/html/img/items/', -- this is for the images.
    informationPrints = false, -- This is if you want to enable debug mode.
    rewardPlayer = {
        time = 0, -- This is the time in minutes.
        coins = 0, -- This is the amount of coins to give.
    },
    coinsUpdated = function(oldCoins, newCoins) -- this is only called whenever the coins are updated from the server.
        exports['ox_lib']:notify({
            title = 'You have received coins!',
            description = ('You have received %s coins!'):format(newCoins - oldCoins),
            position = 'top',
            duration = 5000,
            icon = 'coins'
        })
    end,
    items = {
        {
            label = '1m Dollars',
            name = 'money',
            price = 10000,
            type = 'money',
            amount = 1000000,
        },
        {
            label = '1m Dirty Money',
            name = 'black_money',
            price = 10000,
            type = 'money',
            amount = 1000000,
        },
        {
            label = 'Adder',
            name = 'adder', -- This equal to the vehicles model name.
            price = 1000,
            type = 'vehicle',
        },
        {
            label = 'Armour',
            name = 'armour',
            price = 10,
            type = 'item',
        },
        {
            label = 'Medkit',
            name = 'medkit',
            price = 10,
            type = 'item',
        },
        {
            label = 'Ammo Clip',
            name = 'clip',
            price = 5,
            type = 'item',
        },
        {
            label = 'Tuner Chip',
            name = 'tunerchip',
            price = 50,
            type = 'item',
        },
        {
            label = 'Repair Kit',
            name = 'repairkit',
            price = 20,
            type = 'item',
        },
        {
            label = 'Cocaine',
            name = 'coke',
            price = 10,
            type = 'item',
        },
        {
            label = 'Meth',
            name = 'meth',
            price = 10,
            type = 'item',
        },
        {
            label = 'Sniper Rifle',
            name = 'weapon_sniperrifle',
            price = 200,
            type = 'weapon',
        },
        {
            label = 'AP Pistol',
            name = 'weapon_appistol',
            price = 25,
            type = 'weapon',
        },
        {
            label = 'Carbine Rifle',
            name = 'weapon_carbinerifle',
            price = 75,
            type = 'weapon',
        },
    }
}