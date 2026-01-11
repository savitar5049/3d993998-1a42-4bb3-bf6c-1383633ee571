lib.locale()
config = lib.load('shared.config')
config.zones = lib.load('shared.config_zones')

---Prints debug messages when debug mode is enabled
---@param debugPrint any The message to print
---@param client boolean|nil Whether this is a client-side debug message
function Debug(debugPrint, client)
    if not config.debug then return end

    if not client then
        local RED = "\27[31m"
        local RESET = "\27[0m"
        print(("%s[%s]%s %s"):format(RED, GetCurrentResourceName(), RESET, tostring(debugPrint)))
    else
        print(("[%s] %s"):format(GetCurrentResourceName(), tostring(debugPrint)))
    end
end

---Shows a notification to a player
---@param msg string The message to display
---@param source number|nil The server ID (server-side only)
function ShowNotification(msg, source)
    if not msg then return end

    local notifyConfig = config.notifications or {}
    local position = notifyConfig.position or 'top-right'
    local duration = notifyConfig.duration or 5000
    local notifyType = notifyConfig.type or 'inform'

    if source then
        lib.notify(source, {
            description = msg,
            position = position,
            duration = duration,
            type = notifyType
        })
    else
        lib.notify({
            description = msg,
            position = position,
            duration = duration,
            type = notifyType
        })
    end
end

---Sends a formatted chat message
---@param message string The message to send
---@param source number|nil Optional player source; nil broadcasts to all
function ShowChat(message, source)
    if not message then return end

    local template = config.notifications and config.notifications.chatTemplate or '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-flag"></i> {0}</div>'
    local formattedMsg = template:gsub('{0}', tostring(message))

    local payload = {
        template = formattedMsg
    }

    if source then
        TriggerClientEvent('chat:addMessage', source, payload)
    else
        TriggerClientEvent('chat:addMessage', -1, payload)
    end
end

---Broadcasts an announcement using configured announce mode ('chat' | 'notify')
---@param message string The message to broadcast
function BroadcastAnnouncement(message)
    if not message then return end

    local mode = config and config.global and config.global.announceMode or 'off'
    if mode == 'chat' then
        ShowChat(tostring(message))
    elseif mode == 'notify' then
        TriggerClientEvent('vanish_turfs:notifyAll', -1, tostring(message))
    end
end
