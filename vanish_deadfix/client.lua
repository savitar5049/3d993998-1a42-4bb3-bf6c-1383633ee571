-- vanish_deadfix/client.lua
-- Adds missing IsPlayerDead helpers for locked scripts.

CreateThread(function()
    Wait(2000)

    -- Try ESX
    local ESX
    local ok = pcall(function()
        ESX = exports['es_extended']:getSharedObject()
    end)

    if ok and ESX then
        if ESX.IsPlayerDead == nil then
            ESX.IsPlayerDead = function()
                local ped = PlayerPedId()
                if ped == 0 or not DoesEntityExist(ped) then return false end
                return IsEntityDead(ped)
            end
            print("^2[vanish_deadfix]^7 Added ESX.IsPlayerDead()")
        else
            print("^3[vanish_deadfix]^7 ESX.IsPlayerDead already exists")
        end
        return
    end

    -- If ESX not found, still show info (helps debug)
    print("^1[vanish_deadfix]^7 ESX not found. If you're on ESX, ensure es_extended starts before this.")
end)
