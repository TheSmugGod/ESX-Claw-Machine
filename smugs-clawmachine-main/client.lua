--local QBCore = exports['qb-core']:GetCoreObject()
local ESX = exports["es_extended"]:getSharedObject()

CreateThread(function()
    local options = {
        {
            name = 'smugs:claw',
            event = 'ox_target:debug',
            icon = 'fa-solid fa-coins',
            label = Config.Text['use_claw'],
            canInteract = function(entity)
                if IsPedAPlayer(entity) then return false end
                --[[
                QBCore.Functions.Progressbar('claw_machine', Config.Text['grab_toy'], 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Play When Done
                    TriggerServerEvent('smugs-clawmachine:winPrize')
                end, function() -- Play When Cancel
                    --Stuff goes here
                end)
                ]]
                local vehiclePool = GetGamePool('CObject') -- Get the list of vehicles (entities) from the pool
                for i = 1, #vehiclePool do -- loop through each vehicle (entity)
                local propcords = GetEntityCoords(vehiclePool[i])
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)



                if GetDistanceBetweenCoords(coords, propcords, true) < 1.1 then
                    if not IsHackingDoor and not IsDoorHacked then
                    -- Drawing The Stuff
                        ESX.ShowHelpNotification('~h~Press ~INPUT_CONTEXT~ to play the claw! ~g~$2')
                    end
                    if IsControlJustReleased(0, 38) and not IsHackingDoor and not IsDoorHacked then
                    --    TriggerServerEvent('boxoffice:buyticket')
                    
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "claw_machine",
                    duration = 5000,
                    label = Config.Text['use_claw'],
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "mini@sprunk",
                        anim = "plyr_buy_drink_pt1",
                    },
                }, function(status)
                    if not status then
                        -- Do Something If Event Wasn't Cancelled
                        TriggerServerEvent('smugs-clawmachine:winPrize')
                    end
                end)
                
                 end
                  end


                end

            end,
        }
    }

    local optionName = { 'smugs:claw' }

    exports.ox_target:removeModel(`ch_prop_arcade_claw_01a`, optionName)
   -- exports.ox_target:addModel(`ch_prop_arcade_claw_01a`, options)
   -- exports['qb-target']:RemoveTargetModel(`ch_prop_arcade_claw_01a`, Config.Text['claw_machine'])

    Wait(1000)

    exports.ox_target:addModel(`ch_prop_arcade_claw_01a`, options)





    --[[
    exports['qb-target']:AddTargetModel(`ch_prop_arcade_claw_01a`, {
        options = {
            {
                icon = 'fas fa-coins',
                label = Config.Text['use_claw'],
                targeticon = 'fas fa-coins',
                action = function(entity)
                    if IsPedAPlayer(entity) then return false end
                    QBCore.Functions.Progressbar('claw_machine', Config.Text['grab_toy'], 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Play When Done
                        TriggerServerEvent('smugs-clawmachine:winPrize')
                    end, function() -- Play When Cancel
                        --Stuff goes here
                    end)
                end,
            }
        },
        distance = 2.5
    })
]]

end)



RegisterNetEvent("smugs:clawprog", function()
    print("here")



end)