if GetResourceState('qb-target') ~= 'started' then return end

function InitiateTarget(ped, callback)
    local options = {
        {
            icon = 'fas fa-pills',
            label = locale('target.label'),
            action = function(entity)
                exports['qb-target']:RemoveTargetEntity(entity)
                callback()
            end,
        }
    }

    exports['qb-target']:AddTargetEntity(ped, { options, distance = 2.0 })
end

function RemoveTarget(ped)
    exports['qb-target']:RemoveTargetEntity(ped)
end