lib.locale()
config = lib.load('shared.config')
zoneconfig = lib.load('shared.config_zones')
pedconfig = lib.load('shared.config_peds')

---@param debugPrint (string, number, table, etc) The message to print.
function Debug(debugPrint, client)
	if not config.debug then return end

    if not client then
        local RED = "\27[31m"   
        local RESET = "\27[0m"  
        print(("%s[%s] %s%s"):format(RED, GetCurrentResourceName(), RESET, debugPrint))
    else
        print(("[%s] %s"):format(GetCurrentResourceName(), debugPrint))
    end
end

---@param msg (string) The necessary message that will be displayed in the notification
---@param source (number) The necessary source if you are sending a notification from the server
function ShowNotification(msg, source)
    return source and lib.notify(source, {description = msg, position = 'top-right', type = 'inform'}) or lib.notify({description = msg, position = 'top-right', type = 'inform'})
end

---@param max (number) The maximum number that will be returned
---@return number The random number
function WeightedRandom(max)
    local roll = math.random()

    if roll <= 0.7 then
        return math.random(1, math.max(1, math.floor(max * 0.4))) -- 70% chance: 1 to 40% of max
    elseif roll <= 0.9 then
        return math.random(math.max(1, math.floor(max * 0.4) + 1), math.max(1, math.floor(max * 0.7))) -- 20%: 41% to 70%
    else
        return math.random(math.max(1, math.floor(max * 0.7) + 1), max) -- 10%: 71% to 100%
    end
end