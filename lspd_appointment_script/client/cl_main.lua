lib.locale()

local rendezvouspolice = {
    coords = Config.Position,
    rotation = 180.0,
    options = {
        {
            icon = Config.Icon,
            label = locale('rdv_label'),
            canInteract = function(_, distance)
                return distance < 3
            end,
            onSelect = function()
                local input = lib.inputDialog(locale('input_title'), { 
                {type = 'input', label = locale('input_label'), description = locale('input_desc'), icon = 'fa-solid fa-bars' },
                {type = 'date', label = locale('date_label'), description = locale('date_desc'), icon = {'far', 'calendar'}, default = false, format = "DD/MM/YYYY"}, 
                })
                
                if not input then 
                    print("Dialogue annulé.")
                    return 
                end
        
                local reason = input[1]
                local date = input[2]
                print("Reason :", reason)
                local progressbar = lib.progressCircle({
                    duration = Config.DurationProgress,
                    label = locale('progressbar'),
                    position = 'bottom',
                    disable = {
                        car = true,
                        combat = true,
                        move = true,
                    },
                    anim = {
                        dict = 'misscarsteal4@actor',
                        clip = 'actor_berating_loop'
                    },
                })
                NotifyClient(locale('notification_title'), locale('notification_message') ..reason, 'success', 'fa-solid fa-info-circle')
                TriggerServerEvent("logsappelpolice:logsappel", reason, date)

        end
        },
    }
}
exports.ox_target:addBoxZone(rendezvouspolice)



---- PED

Citizen.CreateThread(function ()
    for k, v in pairs(Config.Ped) do
    while not HasModelLoaded(v.pedModel) do
        RequestModel(v.pedModel)
        Wait(0)
    end
    Ped = CreatePed(2, GetHashKey(v.pedModel), v.position, 0, 0)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, v.pedModel, 0, false)
    SetEntityInvincible(Ped, true) 
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end
end)