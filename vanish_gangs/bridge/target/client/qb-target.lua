if GetResourceState('qb-target') ~= 'started' then return end

function InitiateTarget(entity, playerGang, isAllowed)
    local options = {
        {
            label = locale('target.label'),
            icon = 'fa-solid fa-user',
            action = function()
                if not isAllowed then
                    return ShowNotification(locale('notifications.no_permission'))
                end

                registerGangMenus()
                lib.showContext(playerGang .. '_management_menu')
            end
        }
    }

    exports['qb-target']:AddLocalEntity(entity, { options, distance = 10 })
end
    