if GetResourceState('qb-target') ~= 'started' then return end

function AddCrateTarget(crateEntity, crateId)
    exports['qb-target']:AddTargetEntity(crateEntity, {
        options = {
            {
                label = locale('target.open_crate'),
                icon = 'fa-solid fa-box-open',
                action = function()
                    TriggerServerEvent('vanish_cratedrops:openCrate', crateId)
                end
            }
        },
        distance = config.crate.interactionDistance
    })
end

function RemoveCrateTarget(crateEntity, crateId)
    if DoesEntityExist(crateEntity) then
        exports['qb-target']:RemoveTargetEntity(crateEntity)
    end
end
