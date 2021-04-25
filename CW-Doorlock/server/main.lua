ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("CW-Doorlock:server:get:config", function(source, cb)
    cb(Config)
end)

RegisterServerEvent('CW-Doorlock:server:change:door:looks')
AddEventHandler('CW-Doorlock:server:change:door:looks', function(Door, Type)
 TriggerClientEvent('CW-Doorlock:client:change:door:looks', -1, Door, Type)
end)

RegisterServerEvent('CW-Doorlock:server:reset:door:looks')
AddEventHandler('CW-Doorlock:server:reset:door:looks', function()
 TriggerClientEvent('CW-Doorlock:client:reset:door:looks', -1)
end)

RegisterServerEvent('CW-Doorlock:server:updateState')
AddEventHandler('CW-Doorlock:server:updateState', function(doorID, state)
 Config.Doors[doorID]['Locked'] = state
 TriggerClientEvent('CW-Doorlock:client:setState', -1, doorID, state)
end)