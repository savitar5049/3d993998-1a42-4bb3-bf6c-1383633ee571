return {
    -- Crate tier system
    -- Each tier has different loot tables, visuals, and spawn chances
    -- NOTE: Set any property to nil to use the global config setting from config.lua
    --   - crateModel: nil = use config.crate.model
    --   - blipColor: nil = use config.blip.color
    --   - blipSprite: nil = use config.blip.sprite
    --   - particleColor: nil = use default particle colors

    -- Common tier (70% chance for automatic drops)
    common = {
        label = 'Common Supply Crate',
        spawnChance = 0.70, -- 70% chance for automatic drops
        minItems = 3,
        maxItems = 5,
        blipColor = 0, -- White (set to nil to use global config.blip.color)
        blipSprite = nil, -- nil = use global config.blip.sprite
        crateModel = nil, -- nil = use global config.crate.model
        particleColor = { r = 255, g = 255, b = 255 }, -- White smoke (set to nil for default)
        lootItems = {
            { item = 'water', min = 1, max = 3, chance = 1.0 },
            { item = 'bread', min = 1, max = 3, chance = 0.8 },
            { item = 'bandage', min = 2, max = 5, chance = 0.6 },
            -- { item = 'lockpick', min = 1, max = 2, chance = 0.3 },
        },
    },

    -- Uncommon tier (20% chance for automatic drops)
    uncommon = {
        label = 'Military Supply Crate',
        spawnChance = 0.20, -- 20% chance for automatic drops
        minItems = 4,
        maxItems = 7,
        blipColor = 2, -- Green (set to nil to use global config.blip.color)
        blipSprite = nil, -- nil = use global config.blip.sprite
        crateModel = nil, -- nil = use global config.crate.model
        particleColor = { r = 0, g = 255, b = 0 }, -- Green smoke (set to nil for default)
        lootItems = {
            { item = 'water', min = 2, max = 5, chance = 1.0 },
            { item = 'bread', min = 2, max = 5, chance = 0.9 },
            { item = 'bandage', min = 5, max = 10, chance = 0.8 },
            -- { item = 'lockpick', min = 2, max = 4, chance = 0.5 },
            -- { item = 'radio', min = 1, max = 1, chance = 0.4 },
            -- { item = 'ammo-9', min = 30, max = 60, chance = 0.6 },
            -- { item = 'WEAPON_PISTOL', min = 1, max = 1, chance = 0.3 },
        },
    },

    -- Rare tier (8% chance for automatic drops)
    rare = {
        label = 'Advanced Supply Crate',
        spawnChance = 0.08, -- 8% chance for automatic drops
        minItems = 5,
        maxItems = 9,
        blipColor = 3, -- Light Blue (set to nil to use global config.blip.color)
        blipSprite = nil, -- nil = use global config.blip.sprite
        crateModel = nil, -- nil = use global config.crate.model
        particleColor = { r = 0, g = 150, b = 255 }, -- Blue smoke (set to nil for default)
        lootItems = {
            { item = 'water', min = 3, max = 7, chance = 1.0 },
            { item = 'bread', min = 3, max = 7, chance = 1.0 },
            { item = 'bandage', min = 8, max = 15, chance = 0.9 },
            -- { item = 'lockpick', min = 3, max = 6, chance = 0.7 },
            -- { item = 'radio', min = 1, max = 2, chance = 0.6 },
            -- { item = 'ammo-9', min = 50, max = 100, chance = 0.8 },
            -- { item = 'ammo-rifle', min = 40, max = 80, chance = 0.6 },
            -- { item = 'WEAPON_PISTOL', min = 1, max = 1, chance = 0.5 },
            -- { item = 'WEAPON_SMG', min = 1, max = 1, chance = 0.3 },
            -- { item = 'black_money', min = 1000, max = 3000, chance = 0.5 },
        },
    },

    -- Epic tier (1.5% chance for automatic drops)
    epic = {
        label = 'Tactical Supply Crate',
        spawnChance = 0.015, -- 1.5% chance for automatic drops
        minItems = 6,
        maxItems = 10,
        blipColor = 27, -- Purple (set to nil to use global config.blip.color)
        blipSprite = nil, -- nil = use global config.blip.sprite
        crateModel = nil, -- nil = use global config.crate.model
        particleColor = { r = 150, g = 0, b = 255 }, -- Purple smoke (set to nil for default)
        lootItems = {
            { item = 'water', min = 5, max = 10, chance = 1.0 },
            { item = 'bread', min = 5, max = 10, chance = 1.0 },
            { item = 'bandage', min = 10, max = 20, chance = 1.0 },
            -- { item = 'lockpick', min = 5, max = 10, chance = 0.9 },
            -- { item = 'radio', min = 1, max = 3, chance = 0.8 },
            -- { item = 'ammo-9', min = 80, max = 150, chance = 0.9 },
            -- { item = 'ammo-rifle', min = 60, max = 120, chance = 0.8 },
            -- { item = 'WEAPON_SMG', min = 1, max = 1, chance = 0.6 },
            -- { item = 'WEAPON_ASSAULTRIFLE', min = 1, max = 1, chance = 0.4 },
            -- { item = 'black_money', min = 2500, max = 6000, chance = 0.7 },
            -- { item = 'weed', min = 10, max = 25, chance = 0.5 },
        },
    },

    -- Legendary tier (0.5% chance for automatic drops)
    legendary = {
        label = 'Elite Supply Crate',
        spawnChance = 0.005, -- 0.5% chance for automatic drops
        minItems = 8,
        maxItems = 12,
        blipColor = 46, -- Gold/Orange (set to nil to use global config.blip.color)
        blipSprite = nil, -- nil = use global config.blip.sprite
        crateModel = nil, -- nil = use global config.crate.model (or set to `prop_drop_crate_01` for different model)
        particleColor = { r = 255, g = 215, b = 0 }, -- Gold smoke (set to nil for default)
        lootItems = {
            { item = 'water', min = 10, max = 15, chance = 1.0 },
            { item = 'bread', min = 10, max = 15, chance = 1.0 },
            { item = 'bandage', min = 15, max = 30, chance = 1.0 },
            -- { item = 'lockpick', min = 10, max = 15, chance = 1.0 },
            -- { item = 'radio', min = 2, max = 5, chance = 1.0 },
            -- { item = 'ammo-9', min = 100, max = 200, chance = 1.0 },
            -- { item = 'ammo-rifle', min = 100, max = 200, chance = 1.0 },
            -- { item = 'WEAPON_SMG', min = 1, max = 1, chance = 0.9 },
            -- { item = 'WEAPON_ASSAULTRIFLE', min = 1, max = 1, chance = 0.7 },
            -- { item = 'black_money', min = 5000, max = 15000, chance = 0.9 },
            -- { item = 'weed', min = 20, max = 40, chance = 0.7 },
            -- { item = 'coke', min = 15, max = 30, chance = 0.6 },
            -- { item = 'meth', min = 15, max = 30, chance = 0.6 },
        },
    },
}
