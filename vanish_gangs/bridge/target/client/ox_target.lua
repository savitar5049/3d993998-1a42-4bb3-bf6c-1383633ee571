if GetResourceState('ox_target') ~= 'started' then return end

function InitiateTarget(entity, playerGang, isAllowed)
    local options = {
        {
            label = locale('target.label'),
            name = 'gang_management',
            icon = 'fa-solid fa-user',
            onSelect = function()
                if not isAllowed then
                    return ShowNotification(locale('notifications.no_permission'))
                end

                registerGangMenus()
                lib.showContext(playerGang .. '_management_menu')
            end
        }
    }

    exports.ox_target:addLocalEntity(entity, options)
end
    