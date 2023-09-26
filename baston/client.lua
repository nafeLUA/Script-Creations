local used = false
local ped = PlayerPedId()
local prop = `prop_cs_walking_stick`
local dict = "cellphone@"
local name = "cellphone_call_to_text"

RegisterCommand("baston", function(source, args, rawCommand)
	ClearPedTasksImmediately(PlayerPedId())
	used = not used
	if used then 
		RequestWalking("move_m@multiplayer")
		SetPedMovementClipset(PlayerPedId(), "move_m@multiplayer", 1.0)
		ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
		SetModelAsNoLongerNeeded(prop)
		SetEntityAsMissionEntity(attachProps, true, false)
		DetachEntity(NetToObj(prop), 1, 1)
		DeleteEntity(NetToObj(prop))
		DeleteEntity(attachProps)
		prop = nil
	else
		RequestWalking("move_lester_caneup")
		SetPedMovementClipset(ped, "move_lester_caneup", 1.0)
		loadAnimDict(dict)
		RequestModel(prop)
		while not HasModelLoaded(prop) do
		  Citizen.Wait(100)
		end
		attachProps = CreateObject(prop, GetEntityCoords(ped),  true,  false,  false)
		AttachEntityToEntity(attachProps,ped,GetPedBoneIndex(ped, 57005),0.15, 0.0, -0.00, 0.0, 266.0, 0.0, false, false, false, true, 2, true)
		prop = ObjToNet(attachProps)
	end
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function RequestWalking(set)
	RequestAnimSet(set)
	while not HasAnimSetLoaded(set) do
	  Citizen.Wait(0)
	end
end
