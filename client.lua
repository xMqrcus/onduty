vRPdv = {}
Tunnel.bindInterface("xMqrcus_onduty",vRPdv)
Proxy.addInterface("xMqrcus_onduty",vRPdv)
PMserver = Tunnel.getInterface("xMqrcus_onduty","xMqrcus_onduty")
vRPserver = Tunnel.getInterface("vRP","xMqrcus_onduty")
vRP = Proxy.getInterface("vRP", "xMqrcus_onduty")

local once = true

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(10000)
	  if once == true then
		  once = false
		  TriggerServerEvent("xmq:checkjob")
      print("pik")
	  else
		once = false
	  end
	end
end)


RegisterNetEvent("onduty")
AddEventHandler("onduty", function()
  exports["rp-radio"]:GivePlayerAccessToFrequencies(1)
  exports["rp-radio"]:GivePlayerAccessToFrequencies(2)
  exports["rp-radio"]:GivePlayerAccessToFrequencies(3)
  exports["rp-radio"]:GivePlayerAccessToFrequencies(4)
  exports["rp-radio"]:GivePlayerAccessToFrequencies(5)
  print("hejsa")
end)
    
RegisterNetEvent("offduty")
AddEventHandler("offduty", function()
  exports["rp-radio"]:RemovePlayerAccessToFrequencies(1)
  exports["rp-radio"]:RemovePlayerAccessToFrequencies(2)
  exports["rp-radio"]:RemovePlayerAccessToFrequencies(3)
  exports["rp-radio"]:RemovePlayerAccessToFrequencies(4)
  exports["rp-radio"]:RemovePlayerAccessToFrequencies(5)
	TriggerEvent("pNotify:SendNotification",{text = "Du har taget fri fra arbejde.",type = "success",timeout = (5000),layout = "BottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end

Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
      Citizen.Wait(1) 
       -- POLITI
		  if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 440.21273803711,-975.62036132813,30.689321517944) < 3 then
			  DrawMarker(20, 440.21273803711,-975.62036132813,30.689321517944-0.2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 1, 1, 0, 1)
        DrawText3Ds(440.21273803711,-975.62036132813,30.689321517944+0.1, "~r~[F]~s~ For at gå af/på arbejde.")
        if IsControlJustPressed(1, 145) then
          TriggerServerEvent("xmq:jobafpå")
        end

        -- EMS
      elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 267.29092407227,-1361.5251464844,24.537780761719) < 3 then
			  DrawMarker(20, 267.29092407227,-1361.5251464844,24.537780761719-0.2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 1, 1, 0, 1)
        DrawText3Ds(267.29092407227,-1361.5251464844,24.537780761719+0.1, "~r~[F]~s~ For at gå af/på arbejde.")
        if IsControlJustPressed(1, 145) then
          TriggerServerEvent("xmq:jobafpå")
        end

        -- MEKANIKER
      elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 543.83715820313,-191.41227722168,54.481349945068) < 3 then
        DrawMarker(20, 543.83715820313,-191.41227722168,54.481349945068-0.2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 1, 1, 0, 1)
        DrawText3Ds(543.83715820313,-191.41227722168,54.481349945068+0.1, "~r~[F]~s~ For at gå af/på arbejde.")
        if IsControlJustPressed(1, 145) then
          TriggerServerEvent("xmq:jobafpå")
        end
      end
    end
end)


