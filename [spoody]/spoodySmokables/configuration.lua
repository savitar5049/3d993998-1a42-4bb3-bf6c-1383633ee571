local function get()
    ESX = exports['es_extended']:getSharedObject()
end

Config = {
    Notify = function(message)
        ESX.ShowNotification(message)
    end,

    ["gelatti"] = {
        label = "Gelatti",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out -- 50 Seconds
        pass_around = true, -- alow them to pass it around?
    },

    ["backwoods_honey"] = {
        label = "Backwoods Honey",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["backwoods_grape"] = {
        label = "Backwoods Grape",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["grabba_leaf"] = {
        label = "Grabba Leaf",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["whitecherry_gelato"] = {
        label = "Whitecherry Gelato",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["backwoods_russian_cream"] = {
        label = "Backwoods Russian Cream",
        smoketype = "marijuana",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 5, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["cmv"] = {
        label = "Cereal Milk Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["cakemix"] = {
        label = "Cake Mix Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["london"] = {
        label = "London Pound Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["gary"] = {
        label = "Gary Payton Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["collins"] = {
        label = "Collins Ave Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["lala"] = {
        label = "Ooh La La Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["app"] = {
        label = "Apples & Bananas Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },

    ["sticky"] = {
        label = "Sticky Buns Vape",
        smoketype = "vape",
        effect_timer = 50,
        effect_delay = 30, -- seconds
        max_smokes = 15, -- How many smokes can they smoke until it runs out
        pass_around = true,
    },
}

get()