RegisterCommand('vehicle', function(source, args, rawCommand)

    local vehicle = args[1]
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.5, 0.5))
    vehiclehash = GetHashKey(vehicle)
    RequestModel(vehiclehash)

    Citizen.CreateThread(function()

        while not HasModelLoaded(vehiclehash) do
            Citizen.Wait(10)
        end

        local spawnedVehicle = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()+90, 1 , 0))
        SetVehicleNumberPlateText(spawnedVehicle, "SHEEP")
        Notify("~g~Fahrzeug wurde gespawnt")
    end)
end)

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, false)
end