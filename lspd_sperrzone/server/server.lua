---| Script by Liam-Walker-FiveM          |---
---| DO NOT CHANGE SCRIPT AUTHOR 		  |---
---| IF YOU NEED A SCRIPT THEN CONTACT ME |---
---| DISCORD: Liam_Walker#0924            |---
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--- create the blip
RegisterCommand('sperrzone:erstellen', function(source, args, rawCommand)
    local xPlayers = ESX.GetPlayers()
    local radius = tonumber(args[1])
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == "police" then	--- checking the player's job
        for i=1, #xPlayers, 1 do 
		TriggerClientEvent("sperrzone:setSperrzoneLSPD", -1, source, radius)
        TriggerClientEvent('notifyrundruf:displayrundruf', xPlayers[i], "LSPD Rundruf:", table.concat(args, ""), 6000, false)
        end
	end
end)

--- delete the blip
RegisterCommand('sperrzone:entfernen', function(source, args, rawCommand)
    local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == "police" then	--- checking the player's job
        for i=1, #xPlayers, 1 do 
        TriggerClientEvent("sperrzone:clearSperrzoneLSPD", -1, source)
        TriggerClientEvent('notifyrundruf:displayrundruf', xPlayers[i], "LSPD Rundruf:", table.concat(args, " "), 6000, false)
        end
	end
end)