RegisterCommand('veh', function(source, args, rawCommand)

    local vehicle = args[1]
    local x,y,z - table.unpack(GetOffsetFromEntityGivenWorldCoords(PlayerPedId(), 0.0, 2.5, 0.5))
    vehiclehash = GetHashKey(vehicle)
    RequestModel(vehiclehash)
        --sicher gehen mit citizen das alles geladen wird
        Citizen.CreateThread(function()
          

            while not HashModelLoaded(vehiclehash) do
                Citizen.Wait(10)--wenn es nicht geladen hat 10 sekunden warten und nochmal probieren
                
        end
            local spawnedVehicle = CreateVehicle(vehiclehash, x,y,z, GetEntityHeading(PlayerPedId()+90, 1, 0))
            SetVehicleNumberPlateText(spawnedVehicle,1 "Stevo")
            Notify("~g~Fahrzeug wurde erstellt")
    end)
end)

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, false) --false damit es nicht blinkt und klingelt
end