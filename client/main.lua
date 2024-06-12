QBCore = exports['qb-core']:GetCoreObject()
local bag = false

Citizen.CreateThread(function()

    exports['qb-target']:AddTargetModel('v_ret_gc_bag02', {
        options = {
            {
                event = 'hatelyzz_outfitbag:pickupShoppingbag',
                icon = 'fas fa-hand-holding',
                label = Config.Lang.TakeBag
            }, {
                event = 'hatelyzz_outfitbag:CheckForOutfits',
                icon = 'fas fa-shopping-basket',
                label = Config.Lang.OpenWard
            }
        },
        distance = 1.0
    })

end)

RegisterNetEvent('hatelyzz_outfitbag:PutClotheBagDown')
AddEventHandler('hatelyzz_outfitbag:PutClotheBagDown', function()
    local coords = GetEntityCoords(PlayerPedId())
    coords = coords + vector3(0.0, 0.5, -0.93)

    QBCore.Functions.Progressbar("placing", Config.Lang.Place, 1000, false, true, {
        disableMovement = true, 
        disableCarMovement = true, 
        disableMouse = false, 
        disableCombat = true, 
         },{
            animDict = 'random@domestic',
            anim = 'pickup_low',
            flags = 1,
         },{}, {}, function()
            bag = true
            CreateObject(Config.PropName, coords, true)
         end)
end)

RegisterNetEvent('hatelyzz_outfitbag:CheckForOutfits')
AddEventHandler('hatelyzz_outfitbag:CheckForOutfits', function()
    if not isTimeoutActive then
        isTimeoutActive = true
        SetTimeout(Config.OpenDelay * 60 * 1000,
                   function() isTimeoutActive = false end)

        TriggerEvent('illenium-appearance:client:openOutfitMenu')
    else
        QBCore.Functions.Notify("Espere mais um pouco para abrir a bolsa novamente", "error")
    end
end)

RegisterNetEvent('hatelyzz_outfitbag:pickupShoppingbag')
AddEventHandler('hatelyzz_outfitbag:pickupShoppingbag', function()
    local object = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.5,
                                          GetHashKey(Config.PropName))
    if object ~= 0 then
        NetworkRequestControlOfEntity(object)
        while not NetworkHasControlOfEntity(object) do Wait(10) end

        QBCore.Functions.Progressbar("taking", Config.Lang.Taking, 1000, false, true, {
            disableMovement = true, 
            disableCarMovement = true, 
            disableMouse = false, 
            disableCombat = true, 
             },{
                animDict = 'random@domestic',
                anim = 'pickup_low',
                flags = 1,
             },{}, {}, function()
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.Item], "add")
                TriggerServerEvent('hatelyzz_outfitbag:addShoppingbag', object)
                DeleteObject(object)
             end)
    else
        QBCore.Functions.Notify("Nenhuma bolsa encontrada por perto.", "error")
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
end)
