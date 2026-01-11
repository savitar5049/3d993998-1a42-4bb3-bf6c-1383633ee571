if GetResourceState('ox_target') ~= 'started' then return end

function InitiateTarget(ped, callback)
    local options = {
        {   
            label = locale('target.label'),
            name = 'selldrugs',
            icon = 'fas fa-pills',
            onSelect = function(data)
                exports.ox_target:removeLocalEntity(data.entity)
                callback()
            end
        },
    }

    exports.ox_target:addLocalEntity(ped, options)
end

function RemoveTarget(ped)
    exports.ox_target:removeLocalEntity(ped)
end