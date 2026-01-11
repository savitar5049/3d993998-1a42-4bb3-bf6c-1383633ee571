local Benches = {}
local spawnedProps = {}

local function vec3From(c)
    return vec3(c.x + 0.0, c.y + 0.0, c.z + 0.0)
end

local function deleteAllProps()
    for id, ent in pairs(spawnedProps) do
        if ent and DoesEntityExist(ent) then
            DeleteEntity(ent)
        end
        spawnedProps[id] = nil
    end
end

local function ensurePropForBench(b)
    if not b.spawnProp then return end

    -- already spawned?
    if spawnedProps[b.id] and DoesEntityExist(spawnedProps[b.id]) then
        return
    end

    local model = b.propModel and b.propModel ~= '' and joaat(b.propModel) or Config.DefaultPropModel
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local c = vec3From(b.coords)
    local ent = CreateObject(model, c.x, c.y, c.z - 1.0, false, false, false)
    SetEntityHeading(ent, b.heading or 0.0)
    FreezeEntityPosition(ent, true)
    SetEntityAsMissionEntity(ent, true, true)

    spawnedProps[b.id] = ent
    SetModelAsNoLongerNeeded(model)
end

local function refreshProps()
    deleteAllProps()
    for _, b in pairs(Benches) do
        ensurePropForBench(b)
    end
end

local function openBenchMenu(benchId)
    local bench = Benches[benchId]
    if not bench then return end

    local options = {}

    for _, w in ipairs(Config.Weapons) do
        local benchFee = tonumber(bench.price) or 0
        local extra = tonumber(w.extraPrice) or 0
        local total = benchFee + extra

        options[#options + 1] = {
            title = ('%s - $%s'):format(w.label, total),
            description = ('Bench fee $%s + weapon $%s'):format(benchFee, extra),
            icon = 'gun',
            onSelect = function()
                local ok, msg = lib.callback.await('paid_weaponbench:buy', false, benchId, w.weapon)
                if ok then
                    lib.notify({ title = bench.name or 'Weapon Bench', description = msg or 'Done', type = 'success' })
                else
                    lib.notify({ title = bench.name or 'Weapon Bench', description = msg or 'Failed', type = 'error' })
                end
            end
        }
    end

    lib.registerContext({
        id = 'paid_weaponbench_menu_' .. benchId,
        title = ('%s ($%s)'):format(bench.name or 'Weapon Bench', tostring(bench.price or 0)),
        options = options
    })

    lib.showContext('paid_weaponbench_menu_' .. benchId)
end

local function drawMarkerAt(coords)
    DrawMarker(
        1,
        coords.x, coords.y, coords.z - 1.0,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        1.4, 1.4, 1.0,
        255, 0, 0, 120,
        false, true, 2, false, nil, nil, false
    )
end

-- Admin menu: Add bench
RegisterNetEvent('paid_weaponbench:clientAddMenu', function()
    local input = lib.inputDialog('Add Weapon Bench', {
        { type = 'input', label = 'Bench Name (gang/location)', placeholder = 'oblock', required = true },
        { type = 'number', label = 'Bench Fee Price', default = 100000, required = true, min = 0 },
        { type = 'checkbox', label = 'Spawn Bench Prop?', checked = true },
        { type = 'input', label = 'Prop Model (optional)', placeholder = 'gr_prop_gr_bench_02a' },
    })

    if not input then return end

    local name = input[1]
    local price = tonumber(input[2]) or 100000
    local spawnProp = input[3] == true
    local propModel = input[4] or ''

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local data = {
        name = name,
        price = price,
        spawnProp = spawnProp,
        propModel = propModel,
        coords = { x = coords.x, y = coords.y, z = coords.z },
        heading = heading
    }

    local ok, msg = lib.callback.await('paid_weaponbench:adminAdd', false, data)
    if ok then
        lib.notify({ title = 'Weapon Bench', description = msg or 'Added', type = 'success' })
    else
        lib.notify({ title = 'Weapon Bench', description = msg or 'Failed', type = 'error' })
    end
end)

-- Admin menu: Remove bench
RegisterNetEvent('paid_weaponbench:clientRemoveMenu', function(serverBenches)
    -- build a list to select
    local opts = {}
    for id, b in pairs(serverBenches or {}) do
        opts[#opts + 1] = {
            title = ('%s ($%s)'):format(b.name or id, tostring(b.price or 0)),
            description = ('ID: %s'):format(id),
            onSelect = function()
                local alert = lib.alertDialog({
                    header = 'Remove Bench?',
                    content = ('Remove "%s"?'):format(b.name or id),
                    centered = true,
                    cancel = true
                })
                if alert ~= 'confirm' then return end

                local ok, msg = lib.callback.await('paid_weaponbench:adminRemove', false, id)
                if ok then
                    lib.notify({ title = 'Weapon Bench', description = msg or 'Removed', type = 'success' })
                else
                    lib.notify({ title = 'Weapon Bench', description = msg or 'Failed', type = 'error' })
                end
            end
        }
    end

    if #opts == 0 then
        lib.notify({ title = 'Weapon Bench', description = 'No benches to remove.', type = 'error' })
        return
    end

    lib.registerContext({
        id = 'paid_weaponbench_remove',
        title = 'Remove Weapon Bench',
        options = opts
    })

    lib.showContext('paid_weaponbench_remove')
end)

RegisterNetEvent('paid_weaponbench:clientList', function(serverBenches)
    local count = 0
    for _ in pairs(serverBenches or {}) do count += 1 end

    lib.notify({
        title = 'Weapon Benches',
        description = ('Saved benches: %s'):format(count),
        type = 'inform'
    })
end)

-- Receive updates
RegisterNetEvent('paid_weaponbench:updateAll', function(all)
    Benches = all or {}
    refreshProps()
end)

-- Initial load
CreateThread(function()
    Benches = lib.callback.await('paid_weaponbench:getAll', false) or {}
    refreshProps()

    while true do
        local sleep = 750
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)

        for id, b in pairs(Benches) do
            local c = vec3From(b.coords)
            local dist = #(pcoords - c)

            if dist < Config.DrawDist then
                sleep = 0

                if Config.Marker.enabled then
                    drawMarkerAt(c)
                end

                if dist < Config.InteractDist then
                    lib.showTextUI(('[E] %s ($%s)'):format(b.name or 'Weapon Bench', tostring(b.price or 0)), { position = 'left-center' })
                    if IsControlJustPressed(0, 38) then -- E
                        openBenchMenu(id)
                    end
                else
                    lib.hideTextUI()
                end
            end
        end

        if sleep ~= 0 then
            lib.hideTextUI()
        end

        Wait(sleep)
    end
end)
