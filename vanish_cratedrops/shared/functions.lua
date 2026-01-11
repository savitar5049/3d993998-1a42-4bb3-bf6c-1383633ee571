lib.locale()
config = lib.load('shared.config')
locations = lib.load('shared.config_locations')
tiers = lib.load('shared.config_tiers')

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
    local position = (config.notifications and config.notifications.position) or 'top-right'
    local duration = (config.notifications and config.notifications.duration) or nil
    local payload = { description = msg, position = position, type = 'inform', duration = duration }
    return source and lib.notify(source, payload) or lib.notify(payload)
end

---@param target (number|string) Player source or -1 for all
---@param message (string) The message to send
---@param msgType (string|nil) Message type: 'success', 'warning', 'error', 'info' (default: 'info')
function ShowChatMessage(target, message, msgType)
    if not config.chat.enabled then return end

    msgType = msgType or 'info'

    local colors = {
        success = { 46, 204, 113 },
        warning = { 230, 126, 34 },
        error = { 231, 76, 60 },
        info = { 255, 0, 0 }
    }

    local color = colors[msgType] or colors.info

    TriggerClientEvent('chat:addMessage', target, {
        color = color,
        multiline = true,
        args = { locale('chat.title'), tostring(message or '') }
    })
end
