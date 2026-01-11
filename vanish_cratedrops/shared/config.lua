return {
    debug = false,

    -- Admin groups with access to commands
    AdminGroups = {
        createdrop = { 'group.god', 'group.admin', 'group.mod' },
        createdrophere = { 'group.god', 'group.admin', 'group.mod' },
    },

    -- Minimum players required for automatic drops
    minimumPlayers = 1,

    -- Automatic drop system
    automaticDrops = {
        enabled = true,
        intervalMinutes = 30, -- Time between automatic drops (30 minutes)
    },

    -- Drop timing settings
    dropTimings = {
        planeDelay = 30, -- Seconds after blip creation before plane arrives (30 seconds)
        unlockDelay = 300, -- Seconds before crate can be unlocked (5 minutes)
        totalDuration = 3600, -- Seconds before crate despawns (1 hour)
        cleanupDelay = 300, -- Seconds before empty crate is removed (5 minutes)
    },

    -- Plane settings
    plane = {
        model = `titan`,
        speed = 120.0,
        height = 500.0,
        spawnDistance = 2000, -- Distance from drop point where plane spawns
        dropTriggerDistance = 350, -- Distance from drop point when plane releases crate
        blip = {
            enabled = true, -- Show plane blip on map
            sprite = 307, -- Aircraft sprite (307 = plane icon)
            color1 = 6, -- First pulse color (6 = yellow)
            color2 = 3, -- Second pulse color (3 = light blue)
            scale = 1.0,
            pulseInterval = 500, -- Milliseconds between color changes
            label = 'Incoming Supply Plane',
        },
    },

    -- Crate settings
    crate = {
        model = `prop_drop_crate_01_set2`,
        interactionDistance = 3.5,
        -- Fall speed settings
        fallVelocity = {
            min = -25000, -- Minimum downward velocity (more negative = faster fall)
            max = -18000, -- Maximum downward velocity
        },
        spawnHeight = 150, -- Height above ground where crate spawns (in units)
        -- Particle effects while falling
        particles = {
            asset = 'core', -- Particle asset name
            effect = 'exp_grd_flare', -- Particle effect name (red flare by default)
            scale = 2.0, -- Effect scale/size
        },
    },

    -- Flare settings (ground marker, automatically removed when crate lands)
    flare = {
        model = `w_am_flare`,
        particles = {
            asset = 'core', -- Particle asset name
            -- Multiple effects for better visibility
            effects = {
                { name = 'exp_grd_flare', scale = 2.0, offset = vector3(0.0, 0.0, 0.1) }, -- Red flare glow
                { name = 'ent_sht_flame', scale = 1.5, offset = vector3(0.0, 0.0, 0.0) }, -- Flame effect
            },
            refreshInterval = 5000, -- Milliseconds between particle refresh (keeps them active)
        },
    },

    -- Blip settings
    blip = {
        enabled = true, -- Set to false to disable blips
        sprite = 478, -- Parachute icon
        display = 4,
        scale = 0.8,
        color = 1, -- Red
        alpha = 150,
        showRadius = true, -- Show radius blip around crate
    },

    -- Zone settings
    zone = {
        enabled = true, -- Set to false to disable combat zones
        radius = 150.0,
        showNotifications = false, -- Show enter/exit notifications
    },

    -- Stash settings
    stash = {
        slots = 20,
        maxWeight = 100000,
        prefix = 'vanish_crate_',
    },

    -- Sound settings
    sounds = {
        unlockSound = 'PICK_UP', -- Native GTA sound
        unlockSoundSet = 'HUD_FRONTEND_DEFAULT_SOUNDSET',
        -- When to play the open sound: 'first' (only first unlock) or 'always' (every open)
        playOnOpen = 'always',
    },

    -- Crate tier system configuration is loaded in shared/functions.lua:
    --   tiers = lib.load('shared.config_tiers')

    -- Gang integration (requires vanish_gangs)
    gangIntegration = {
        enabled = true,
        notifyGangMembers = true, -- Notify gang members when crate drops
    },

    -- Chat notifications
    chat = {
        enabled = true,
        backgroundColor = '255, 0, 0', -- RGB format
        textColor = '#ffffff',
    },

    -- Notification settings
    notifications = {
        position = 'top-right',
        duration = 5000,
    },

    -- Supply signal security settings
    supplySignal = {
        itemName = 'supply_signal', -- Item name to validate
        cooldown = 300, -- Cooldown in seconds (5 minutes) before player can use another signal
        validateItem = true, -- Verify player has the item before allowing drop
    },

    -- Coordinate validation settings
    coordinateValidation = {
        enabled = true,
        minZ = -50.0, -- Minimum Z coordinate (prevents underground spawns)
        maxZ = 1000.0, -- Maximum Z coordinate
        maxDistanceFromPlayer = 10.0, -- Maximum distance from player when using signal
    },
}
