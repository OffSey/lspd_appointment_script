lib.locale()

RegisterNetEvent("logsappelpolice:logsappel")
AddEventHandler("logsappelpolice:logsappel", function(message, timestamp)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source) -- QbCore : QBCore.Functions.GetPlayer(source)
    -- Phone Number
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source) -- CHANGE ME 
    -- For the date in the discord webhook
    local date = os.date('%d/%m/%Y', timestamp / 1000)
    -- Webhook discord
    exports["lspd_appointment_script"]:webhooks({ ---- Change the "lspd_appointment_script" if you change the resource name
        message = "__***" .. locale('prise_rdv') .. "***__ \n\n **" .. locale('info_rdv') .. "** \n ***" .. locale('prenom_nom') .. ":*** ``" .. xPlayer.getName() .. "`` \n ***" .. locale('raison') .. ":*** ``" .. message .. "``\n***" .. locale('num_tel') .. ":*** ``" .. phoneNumber .. "``\n***" .. locale('date_rdv') .. ":*** ``" .. date .. "``",
        webhookLink = Config.WebhookLink
    })
end)

---- LOGS DISCORD ! 

ColorLogs = {
    Green = 3066993,
    Red = 15158332,
    Blue = 3447003,
    Yellow = 15844367,
    Orange = 15105570,
    Grey = 9807270,
    Purple = 10181046,
    LightBlue = 1752220,
    NoBorder = 3158326,
}

local function getOSTime()
    local date = os.date('*t')
    if date.month < 10 then date.month = "0" ..date.month end
    return date.day .. "/" .. date.month .. " - " .. date.hour .. " heure " .. date.min.. " minutes"
end

function webhooks(set)
    local discordEmbed = {
        ["type"] = "rich",
        ["title"] = Config.TitleEmbed,
        ["color"] = set.color or ColorLogs.NoBorder,
        ["description"] = set.message or "message null",
        ["author"] = {
            ["name"] = Config.NameEmbed,
            ["url"] = Config.URLEmbed,
            ["icon_url"] = Config.IconURL
        },
        ["footer"] = {
            ["text"] = getOSTime(),
            ["icon_url"] = Config.IconURL
        },
        ["thumbnail"] = {
            ["url"] = ""
        }
    }
    PerformHttpRequest(set.webhookLink, function() end, 'POST', json.encode({
        username = Config.UserNameEmbed,
        embeds = { discordEmbed }
    }), {['Content-Type'] = 'application/json'})
end


print("/*  ::::::::  :::::::::: :::::::::: ::::::::  :::::::::: :::   ::: */")
print("/* :+:    :+: :+:        :+:       :+:    :+: :+:        :+:   :+: */")
print("/* +:+    +:+ +:+        +:+       +:+        +:+         +:+ +:+  */")
print("/* +#+    +:+ :#::+::#   :#::+::#  +#++:++#++ +#++:++#     +#++:   */")
print("/* +#+    +#+ +#+        +#+              +#+ +#+           +#+    */")
print("/* #+#    #+# #+#        #+#       #+#    #+# #+#           #+#    */")
print("/*  ########  ###        ###        ########  ##########    ###    */")
