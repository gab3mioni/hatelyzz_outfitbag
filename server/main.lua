QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.Item, function(source)
    local Player = QBCore.Functions.GetPlayer(source)

    TriggerClientEvent('hatelyzz_outfitbag:PutClotheBagDown', source)
    TriggerClientEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Item], "remove")
    Player.Functions.RemoveItem(Config.Item, 1)
end)

RegisterNetEvent('hatelyzz_outfitbag:addShoppingbag')
AddEventHandler('hatelyzz_outfitbag:addShoppingbag', function(object)    
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(Config.Item, 1)
end)