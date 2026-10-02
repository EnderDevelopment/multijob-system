local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('multijob:getJobs', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT * FROM user_jobs WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        cb(result)
    end)
end)

RegisterNetEvent('multijob:addJob')
AddEventHandler('multijob:addJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    if Config.Jobs[job] then
        MySQL.Async.fetchScalar('SELECT COUNT(*) FROM user_jobs WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(count)
            if count < Config.MaxJobs then
                MySQL.Async.execute('INSERT INTO user_jobs (identifier, job, grade) VALUES (@identifier, @job, @grade)', {
                    ['@identifier'] = identifier,
                    ['@job'] = job,
                    ['@grade'] = Config.Jobs[job].grade
                }, function(rowsChanged)
                    xPlayer.showNotification('Job added: ' .. Config.Jobs[job].label)
                end)
            else
                xPlayer.showNotification('You have reached the maximum number of jobs.')
            end
        end)
    else
        xPlayer.showNotification('Invalid job.')
    end
end)

RegisterNetEvent('multijob:removeJob')
AddEventHandler('multijob:removeJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.execute('DELETE FROM user_jobs WHERE identifier = @identifier AND job = @job', {
        ['@identifier'] = identifier,
        ['@job'] = job
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.showNotification('Job removed: ' .. job)
        else
            xPlayer.showNotification('Job not found.')
        end
    end)
end)

RegisterNetEvent('multijob:switchJob')
AddEventHandler('multijob:switchJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM user_jobs WHERE identifier = @identifier AND job = @job', {
        ['@identifier'] = identifier,
        ['@job'] = job
    }, function(count)
        if count > 0 then
            xPlayer.setJob(job, Config.Jobs[job].grade)
            xPlayer.showNotification('Switched to job: ' .. Config.Jobs[job].label)
        else
            xPlayer.showNotification('You do not have this job.')
        end
    end)
end)