local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP", "xMqrcus_onduty")
vRPclient = Tunnel.getInterface("vRP","xMqrcus_onduty")


RegisterServerEvent('xmq:jobafpå')
AddEventHandler('xmq:jobafpå', function()
    local source = source
	local user_id = vRP.getUserId({source})
  -- POLITI
	if vRP.hasGroup({user_id,"police"}) then
		if vRP.hasGroup({user_id,"Politi-Job"}) then
			TriggerClientEvent('offdutypoliti', source)
			vRP.removeUserGroup({user_id, "Politi-Job"})
		else
			TriggerClientEvent('ondutypoliti', source)
			vRP.addUserGroup({user_id, "Politi-Job"})
		end

  -- EMS
	elseif vRP.hasGroup({user_id, "ems"}) then
		if vRP.hasGroup({user_id,"EMS-Job"}) then
			TriggerClientEvent('offdutyems', source)
			vRP.removeUserGroup({user_id, "EMS-Job"})
		else
			TriggerClientEvent('ondutyems', source)
			vRP.addUserGroup({user_id, "EMS-Job"})
		end

  -- Mekaniker
	elseif vRP.hasGroup({user_id, "mechanic"}) then
		if vRP.hasGroup({user_id,"Mekaniker-Job"}) then
			TriggerClientEvent('offdutymekaniker', source)
			vRP.removeUserGroup({user_id, "Mekaniker-Job"})
		else
			TriggerClientEvent('ondutymekaniker', source)
			vRP.addUserGroup({user_id, "Mekaniker-Job"})
		end
	end
end)

RegisterServerEvent("xmq:checkjob")
AddEventHandler("xmq:checkjob", function()
	local user_id = vRP.getUserId({source})
	if vRP.hasGroup({user_id,"Politi-Job"}) then
		TriggerClientEvent("ondutypoliti", source)
		TriggerClientEvent("offdutyems", source)
		TriggerClientEvent("offdutymekaniker", source)
	end
	if vRP.hasGroup({user_id,"EMS-Job"}) then
		TriggerClientEvent("ondutyems", source)
		TriggerClientEvent("offdutypoliti", source)
		TriggerClientEvent("offdutymekaniker", source)
	end
	if vRP.hasGroup({user_id,"Mekaniker-Job"}) then
		TriggerClientEvent("ondutymekaniker", source)
		TriggerClientEvent("offdutypoliti", source)
		TriggerClientEvent("offdutyems", source)
	end
end)