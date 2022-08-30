---| Script by Liam-Walker-FiveM          |---
---| DO NOT CHANGE SCRIPT AUTHOR 		  |---
---| IF YOU NEED A SCRIPT THEN CONTACT ME |---
---| DISCORD: Liam_Walker#0924            |---
blipRadius = 150.0 			 --- blip radius
lspdCol = 1 				 --- blip colour
lspdBlip = "LSPD: Sperrzone" --- blip name

local lspdBlip = nil
local radiusBlipLSPD = nil

RegisterNetEvent("sperrzone:setSperrzoneLSPD")
AddEventHandler("sperrzone:setSperrzoneLSPD", function(s, lspdRadius)
    RemoveBlip(lspdBlip) 			
    RemoveBlip(radiusBlipLSPD)

    if lspdRadius == nil then
        lspdRadius = blipRadius
    end

    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    lspdBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    radiusBlipLSPD = AddBlipForRadius(coords.x, coords.y, coords.z, lspdRadius)
    SetBlipSprite(lspdBlip, 161)
    SetBlipAsShortRange(lspdBlip, true)
    SetBlipColour(lspdBlip, lspdCol)
    SetBlipScale(lspdBlip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Sperrzone')
    EndTextCommandSetBlipName(lspdBlip)   
    SetBlipAlpha(radiusBlipLSPD, 80)
    SetBlipColour(radiusBlipLSPD, lspdCol)
end)

RegisterNetEvent('sperrzone:clearSperrzoneLSPD')
AddEventHandler("sperrzone:clearSperrzoneLSPD", function()
    RemoveBlip(lspdBlip)
    RemoveBlip(radiusBlipLSPD)
end)

local lspdBlip = nil
local radiusBlipLSPD = nil