return {
    -- Enable/disable debug logging
    debug = false,

    -- Global turf settings
    global = {
        globalCoolDownSeconds = 200,      -- Global cooldown between turfs (seconds)
        singleActive = false,             -- true: only one active turf globally; false: multiple (one per zone)
        zoneCooldownSeconds = 10,         -- Per-zone cooldown after a turf ends (seconds, 0 = disabled)
        announceMode = 'chat',            -- 'off' | 'chat' | 'notify'
    },

    -- Reward system configuration
    rewards = {
        -- How rewards are distributed to winning gang
        -- 'inventory' - adds items directly to gang stash (requires ox_inventory or any inventory in the bridge, with gang stashes)
        -- 'players' - distributes items to all winning gang members in the zone
        distributionMode = 'inventory',

        -- If distributionMode = 'players', items will be added to each player's inventory
        -- If distributionMode = 'inventory', items will be added to gang stash
    },

    -- Respawn configuration for when turf ends
    respawn = {
        enabled = true,                  -- Set to true to respawn all players when turf ends
        location = {
            coords = vector3(-1539.9905, 197.5291, 57.6735), -- Respawn coordinates
            heading = 214.0,                   -- Respawn heading
        },
        -- You can also set respawn per zone in the zone configuration
    },

    -- Notification templates
    notifications = {
        -- Chat message template (used when announceMode = 'chat')
        chatTemplate = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-flag"></i> {0}</div>',

        -- Notification configuration (used when announceMode = 'notify')
        position = 'top-right',  -- 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left' | 'center-right' | 'center-left'
        duration = 5000,         -- Duration in milliseconds
        type = 'inform',         -- 'inform' | 'error' | 'success'
    },

    -- Leaderboard UI configuration
    leaderboard = {
        enabled = true,
        commandName = 'leaderboard',      -- command to open the UI
    },

    -- Command permissions (ox_lib `restricted` values). Use false, an ACE string, or an ACE list.
    commands = {
        leaderboard = false,
        turfs = { 'group.admin' },
        turfsend = { 'group.admin' },
        setganglogo = { 'group.admin' },
    },

    -- Client interaction settings
    interaction = {
        key = 38,                         -- GTA key code (38 = E key)
        distance = 1.0,                   -- Distance to trigger interaction prompt
        activeBuffer = 50.0,              -- Distance buffer for active zone detection
        throttleMs = 5000,                -- Milliseconds between turf start requests (anti-spam)
    },

    -- TextUI configuration
    textui = {
        start = {
            position = 'right-center',    -- Position for start prompt
            icon = 'fa-solid fa-circle-info', -- Icon for start prompt
        },
        active = {
            position = 'top-center',      -- Position for active turf
            icon = 'fas fa-flag',         -- Icon for active turf
        },
    },

    -- Marker rendering configuration
    marker = {
        start = {
            type = 1,                     -- GTA marker type
            color = { r = 255, g = 0, b = 0, a = 200 }
        },
        center = {
            type = 28,                    -- GTA marker type
            color = { r = 255, g = 0, b = 0, a = 200 }
        },
    },
}
