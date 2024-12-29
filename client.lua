RegisterNetEvent("d-jobNotify:openInputDialog")
AddEventHandler("d-jobNotify:openInputDialog", function(job)
    local input = lib.inputDialog(Config.WhitelistedJobs[job], {
        {type = 'input', label = 'Įveskite pranešimą', required = true, min = 1, max = 255}
    })

    if input and input[1] then
        TriggerServerEvent("d-jobNotify:sendNotification", Config.WhitelistedJobs[job], input[1])
    end
end)

RegisterNetEvent("d-jobNotify:sendNotificationToAll")
AddEventHandler("d-jobNotify:sendNotificationToAll", function(jobTitle, message)
    lib.notify({
        duration = 10000,
        title = jobTitle,
        description = message,
        icon = 'fa-solid fa-bullhorn',
        iconAnimation = 'beatFade'
    })

    PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", false)
end)
