if GetResourceState('ox_target') ~= 'started' then return end

function AddCrateTarget(crateEntity, crateId)
    local options = {
        {
            label = locale('target.open_crate'),
            name = 'vanish_cratedrops_open_' .. crateId,
            icon = 'fa-solid fa-box-open',
            distance = config.crate.interactionDistance,
            onSelect = function()
                TriggerServerEvent('vanish_cratedrops:openCrate', crateId)
            end
        }
    }

    exports.ox_target:addLocalEntity(crateEntity, options)
end

function RemoveCrateTarget(crateEntity, crateId)
    if DoesEntityExist(crateEntity) then
        exports.ox_target:removeLocalEntity(crateEntity, 'vanish_cratedrops_open_' .. crateId)
    end
end
