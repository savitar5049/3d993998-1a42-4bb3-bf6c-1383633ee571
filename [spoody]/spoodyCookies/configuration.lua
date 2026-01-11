local function get()
    ESX = exports['es_extended']:getSharedObject();

    if IsDuplicityVersion() then
        ESX = exports['es_extended']:getSharedObject();
    end
end

Config = {
    --- ( notify function for client ) ---
    Notify = function(message)
        ESX.ShowNotification(message)
    end,

    --- ( Jobs System ) ---

    Jobs = {
        Job = "cookies",

        --- ( Job Checking ) ---
        Ranks = {
            ["Employee"] = "employee",
            ["Owner"] = "owner",
        },

        Locations = {
            --- ( Where employees go to get on or off shift ) ---
            Duty = vec3(-931.2735, -1179.7751, 5.0174),

            --- ( Employee Interaction Location ) ---
            Interaction = vec3(-933.3262, -1169.1359, 5.0861)
        }
    },

    --- ( Farming System ) ---

    Farm = {
        Locations = {
            Interaction = vec3(-929.0754, -1172.2732, -0.9121),
            Stockbench = vec3(-928.9140, -1175.1174, -0.8998),
        },

        Equipment = {
            --- ( Item Names for the inventory ) ---
            Fertilizer = "weed_fertilizer",
            Spray = "weed_spray",
            Leaf = "weed_leaf",
            Seed = "weed_seed",
            Pot = "weed_pot",
        },

        Props = {
            --- ( Object Names for all stages ) ---
            Stage_1 = "bkr_prop_weed_01_small_01c",
            Stage_2 = "bkr_prop_weed_01_small_01b",
            Stage_3 = "bkr_prop_weed_01_small_01a",
        },

        Timers = {
            ---@number milliseconds

            --- ( basic interactions ) ---
            Plant = 15000, -- 15 Seconds
            Pesticides = 5000, -- 5 Seconds
            Fertilization = 5000, -- 5 Seconds
            Harvest = 15000, -- 25 Seconds
            Pack = 10000, -- 10 Seconds
            Stock = 8000, -- 8 Seconds

            --- ( growth stages ) ---
            Grow_Stage_One = math.random(14000, 35000), -- Randomized between 14 Seconds to 35 seconds
            Grow_Stage_Two = math.random(10000, 25000), -- Randomized between 10 Seconds to 25 seconds
        },

        Results = {
            Leafs = math.random(1, 10), -- Farmer will recieve randomized between 1-10 leafs to pack & stock 
        }
    },

    --- ( Settings ) ---

    Settings = {
        Context = {
            Title = "E - Open Cookies",
            Position = "right-center"
        }
    },

    --- ( Shop UI Locations ) ---

    Store = {
        Locations = {
            {vec3(-941.2030, -1181.3113, 4.946)},
            {vec3(-941.1882, -1177.5138, 4.9692)},
            {vec3(-946.9568, -1180.9174, 4.9272)},
            {vec3(-941.7681, -1170.5317, 5.0039)},
        }
    },
}

get()