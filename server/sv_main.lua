RegisterNetEvent('ps-hugs:server:hug', function(coords)
    TriggerClientEvent("ps-hugs:client:hug", -1, coords)
end)

RegisterNetEvent('ps-hugs:server:idle', function(coords)
    TriggerClientEvent("ps-hugs:client:idle", -1, coords)
end)