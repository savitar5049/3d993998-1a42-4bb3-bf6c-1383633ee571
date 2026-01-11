Citizen.CreateThread(function()
    local dict = "random@mugging3"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(4)
		if IsControlJustPressed(1, 323) then -- X
            if not handsup then
                TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(PlayerPedId())
            end
        end
    end
end)
