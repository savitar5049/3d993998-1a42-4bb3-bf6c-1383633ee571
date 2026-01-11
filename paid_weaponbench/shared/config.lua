Config = {}

-- Which ESX account to charge
Config.Account = 'money' -- 'money' or 'bank'

-- Distances
Config.InteractDist = 2.0
Config.DrawDist = 25.0

-- Marker
Config.Marker = {
    enabled = true
}

-- Default prop used if bench has SpawnProp=true but no prop set
Config.DefaultPropModel = `gr_prop_gr_bench_02a`

-- Weapons list shown at every bench
-- Each bench has its OWN bench fee (price), and these can have extra per-weapon cost too.
Config.Weapons = {
    { label = 'Pistol', weapon = 'WEAPON_PISTOL', extraPrice = 0 },
    { label = 'AP Pistol', weapon = 'WEAPON_APPISTOL', extraPrice = 15000 },
    { label = 'SMG', weapon = 'WEAPON_SMG', extraPrice = 45000 },
}
