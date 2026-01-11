return {
    {
        label = "Crack",
        captureTime = 10,
        start = {
            coords = vector3(-1649.9982, 151.0411, 62.1637),
            scale = vector3(2.0, 2.0, 1.0)
        },
        center = {
            coords = vector3(-1649.9982, 151.0411, 62.1637),
            scale = vector3(60.0, 60.0, 50.0)
        },
        blip = {
            enabled = true,
            sprite = 310,
            color = 1,
            scale = 0.8,
            shortRange = true,
            name = "Crack"
        },
        rewards = {
            { name = "black_money", minAmount = 100, maxAmount = 150, chance = 100 },
            -- { name = "water", minAmount = 2, maxAmount = 5, chance = 20 }
        },
        -- Optional: zone-specific respawn (overrides global respawn config)
        -- respawn = {
        --     enabled = true,
        --     location = {
        --         coords = vector3(0.0, 0.0, 0.0),
        --         heading = 0.0,
        --     },
        -- },
    },
    -- Add more zones as needed
    -- {
    --     label = "Zone Name",
    --     captureTime = 10,
    --     start = { coords = vector3(x, y, z), scale = vector3(2.0, 2.0, 1.0) },
    --     center = { coords = vector3(x, y, z), scale = vector3(60.0, 60.0, 50.0) },
    --     blip = { enabled = true, sprite = 310, color = 1, scale = 0.8, shortRange = true, name = "Zone Name" },
    --     rewards = {
    --         { name = "item_name", minAmount = 1, maxAmount = 5, chance = 100 }
    --     }
    -- }
}
