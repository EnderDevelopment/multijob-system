local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.TriggerServerCallback('multijob:getJobs', function(jobs)
            for _, job in ipairs(jobs) do
                print('Job: ' .. job.job .. ', Grade: ' .. job.grade)
            end
        end)
    end)

    RegisterCommand('addjob', function(source, args, rawCommand)
        if #args == 1 then
            TriggerServerEvent('multijob:addJob', args[1])
        else
            ESX.ShowNotification('Usage: /addjob [job]')
        end
    end, false)

    RegisterCommand('removejob', function(source, args, rawCommand)
        if #args == 1 then
            TriggerServerEvent('multijob:removeJob', args[1])
        else
            ESX.ShowNotification('Usage: /removejob [job]')
        end
    end, false)

    RegisterCommand('switchjob', function(source, args, rawCommand)
        if #args == 1 then
            TriggerServerEvent('multijob:switchJob', args[1])
        else
            ESX.ShowNotification('Usage: /switchjob [job]')
        end
    end, false)
end)