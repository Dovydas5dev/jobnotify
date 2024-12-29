RegisterCommand("jobnotify", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob().name
    if Config.WhitelistedJobs[job] then
        TriggerClientEvent("d-jobNotify:openInputDialog", source, job)
    else
        TriggerClientEvent("esx:showNotification", source, "You dont have permissions to use this command.")
    end
end)

RegisterNetEvent("d-jobNotify:sendNotification")
AddEventHandler("d-jobNotify:sendNotification", function(jobTitle, message)
    TriggerClientEvent("d-jobNotify:sendNotificationToAll", -1, jobTitle, message)
end)
