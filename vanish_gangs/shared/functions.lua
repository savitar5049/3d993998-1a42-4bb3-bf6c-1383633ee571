lib.locale()
config = lib.load('shared.config')

---Prints debug messages when debug mode is enabled
---@param debugPrint any The message to print
---@param client boolean|nil Whether this is a client-side debug message
function Debug(debugPrint, client)
    if not client then
        local RED = "\27[31m"   
        local RESET = "\27[0m"  
        if not config.debug then return end
        print(("%s[%s] %s%s"):format(RED, GetCurrentResourceName(), RESET, debugPrint))
    else
        print(("[%s] %s"):format(GetCurrentResourceName(), debugPrint))
    end
end

---Shows a notification to a player
---@param msg string The message to display
---@param source number|nil The server ID (server-side only)
function ShowNotification(msg, source)
    return source and lib.notify(source, {description = msg, position = 'top-right', type = 'inform'}) or lib.notify({description = msg, position = 'top-right', type = 'inform'})
end

---Sends a formatted chat message to all players
---@param message string The message to send
function ShowChatMessage(message)
    TriggerClientEvent('chat:addMessage', -1, {
        template = config.management.notifications.template,
        args = { message }
    })
end