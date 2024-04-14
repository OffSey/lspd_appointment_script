lib.locale()

RegisterNetEvent("logsappelpolice:logsappel")
AddEventHandler("logsappelpolice:logsappel", function(message, timestamp)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source) -- QbCore : QBCore.Functions.GetPlayer(source)

    -- Obtenir le numéro de téléphone du joueur
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source) -- CHANGE ME 

    -- Convertir le timestamp Unix en une date lisible par l'homme
    local date = os.date('%d/%m/%Y', timestamp / 1000)

    exports["lspd_appointment_script"]:webhooks({ ---- Change le EXPORTS si vous changez le nom de la ressource !
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
        ["title"] = set.title or "OffSey Dev",
        ["color"] = set.color or ColorLogs.NoBorder,
        ["description"] = set.message or "message null",
        ["author"] = {
            ["name"] = "OffSey Dev",
            ["url"] = "https://www.youtube.com/channel/UCLxAoqw6NdAcnZNQQd5y1oQ",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/1202360060035207228/1229002469061689425/offseyy.png?ex=662e18be&is=661ba3be&hm=fe7a9c7df7004e291e8ae5d47a826aea23118872cb27ae64ee06060efe502c05&"
        },
        ["footer"] = {
            ["text"] = getOSTime(),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/1202360060035207228/1229002469061689425/offseyy.png?ex=662e18be&is=661ba3be&hm=fe7a9c7df7004e291e8ae5d47a826aea23118872cb27ae64ee06060efe502c05&"
        },
        ["thumbnail"] = {
            ["url"] = ""
        }
    }
    PerformHttpRequest(set.webhookLink, function() end, 'POST', json.encode({
        username = "OffSey Dev",
        embeds = { discordEmbed }
    }), {['Content-Type'] = 'application/json'})
end
