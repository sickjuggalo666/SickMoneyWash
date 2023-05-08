local cutting = false
local packaged = false
local washed = false
local IsPowered = false
local washcount = 0
local Target = exports.ox_target

local Inventory = exports.ox_inventory

local function cuttingMoney2(coord, heading)
    Target:disableTargeting(true)
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_cut_sheets@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    RequestModel("bkr_prop_fakeid_papercutter")
    RequestModel("bkr_prop_cutter_moneypage")
    RequestModel("bkr_prop_fakeid_table")
    RequestModel("bkr_prop_cutter_moneystack_01a")
    RequestModel("bkr_prop_cutter_moneystrip")
    RequestModel("bkr_prop_cutter_singlestack_01a")
    while not HasModelLoaded("bkr_prop_fakeid_papercutter") and not HasModelLoaded("bkr_prop_cutter_moneypage") and not HasModelLoaded("bkr_prop_fakeid_table") and not HasModelLoaded("bkr_prop_cutter_moneystack_01a") and not HasModelLoaded("bkr_prop_cutter_moneystrip") and not HasModelLoaded("bkr_prop_cutter_singlestack_01a") do Wait(10) end
    SetEntityHeading(playerPed, heading)
    Wait(10)
	FreezeEntityPosition(playerPed, true)
    local cutter = CreateObject(GetHashKey("bkr_prop_fakeid_papercutter"), coord.x, coord.y, coord.z, true, false, false)
    local page = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local page2 = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local page3 = CreateObject(GetHashKey("bkr_prop_cutter_moneypage"), coord.x, coord.y, coord.z, true, false, false)
    local table = CreateObject(GetHashKey("bkr_prop_fakeid_table"), coord.x, coord.y, coord.z, true, false, false)
    local strip = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip2 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip3 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip4 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local strip5 = CreateObject(GetHashKey("bkr_prop_cutter_moneystrip"), coord.x, coord.y, coord.z, true, false, false)
    local singlestack = CreateObject(GetHashKey("bkr_prop_cutter_singlestack_01a"), coord.x, coord.y, coord.z, true, false, false)
    local stack = CreateObject(GetHashKey("bkr_prop_cutter_moneystack_01a"), coord.x, coord.y, coord.z, true, false, false)
    local cutScene = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene2 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene3 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local cutScene4 = NetworkCreateSynchronisedScene(coord.x-2.12, coord.y-0.60, coord.z-0.59, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(playerPed, cutScene, animDict, "extended_load_tune_cut_billcutter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(cutter, cutScene, animDict, "extended_load_tune_cut_papercutter", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page, cutScene, animDict, "extended_load_tune_cut_singlemoneypage", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page2, cutScene, animDict, "extended_load_tune_cut_singlemoneypage^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(page3, cutScene2, animDict, "extended_load_tune_cut_singlemoneypage^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(table, cutScene2, animDict, "extended_load_tune_cut_table", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(stack, cutScene2, animDict, "extended_load_tune_cut_moneystack", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip2, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip3, cutScene3, animDict, "extended_load_tune_cut_singlemoneystrip^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip4, cutScene4, animDict, "extended_load_tune_cut_singlemoneystrip^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(strip5, cutScene4, animDict, "extended_load_tune_cut_singlemoneystrip^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(singlestack, cutScene4, animDict, "extended_load_tune_cut_singlestack", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(cutScene)
    NetworkStartSynchronisedScene(cutScene2)
    NetworkStartSynchronisedScene(cutScene3)
    NetworkStartSynchronisedScene(cutScene4)
	Wait(8000)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'ventilator', 1.0)
	Wait(7000)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'ventilator', 1.0)
	Wait(7500)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'ventilator', 1.0)
	Wait(7500)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'ventilator', 1.0)
	Wait(3500)
    NetworkStopSynchronisedScene(cutScene)
    NetworkStopSynchronisedScene(cutScene2)
    NetworkStopSynchronisedScene(cutScene3)
    NetworkStopSynchronisedScene(cutScene4)
    DeleteEntity(cutter)
    DeleteEntity(page)
    DeleteEntity(page2)
    DeleteEntity(page3)
    DeleteEntity(table)
    DeleteEntity(stack)
    DeleteEntity(strip)
    DeleteEntity(strip2)
    DeleteEntity(strip3)
    DeleteEntity(strip4)
    DeleteEntity(strip5)
    DeleteEntity(singlestack)
	FreezeEntityPosition(playerPed, false)
    Target:disableTargeting(false)
end


local Items = {
    'bkr_prop_coke_tin_01',
    'bkr_prop_tin_cash_01a',
    'bkr_prop_money_unsorted_01',
    'bkr_prop_money_wrapped_01',
    'bkr_prop_money_counter',
}



local function packageMoneyanim()
    Target:disableTargeting(true)
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_counting_notes@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    RequestModel("bkr_prop_coke_tin_01")
    RequestModel("bkr_prop_tin_cash_01a")
    RequestModel("bkr_prop_money_unsorted_01")
    RequestModel("bkr_prop_money_wrapped_01")
    RequestModel("bkr_prop_money_counter")
    while not HasModelLoaded("bkr_prop_coke_tin_01") and not HasModelLoaded("bkr_prop_tin_cash_01a") and not HasModelLoaded("bkr_prop_money_unsorted_01") and not HasModelLoaded("bkr_prop_money_wrapped_01") and not HasModelLoaded("bkr_prop_money_counter") do Wait(50) end
    SetEntityHeading(playerPed, Config.Laundry.packageZone.heading)
    Wait(10)
	FreezeEntityPosition(playerPed, true)
    RequestModel("bkr_prop_money_counter")
    RequestModel("bkr_prop_moneypack_03a")
    while not HasModelLoaded("bkr_prop_money_counter") and not HasModelLoaded("bkr_prop_moneypack_03a") do Wait(10) end
    local counter = CreateObject(GetHashKey("bkr_prop_money_counter"), 1120.15, -3198.40, -40.58, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_moneypack_03a"), 1119.96, -3198.93, -40.58, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_moneypack_03a"), 1119.96, -3198.93, -40.42, false, false)
    SetEntityRotation(counter, 0.0, 0.0, 180.0)
    SetEntityRotation(bag, 0.0, 0.0, 90.0)
    SetEntityRotation(bag2, 0.0, 0.0, 90.0)
    local packScene = NetworkCreateSynchronisedScene(Config.Laundry.packageZone.coord.x+0.27, Config.Laundry.packageZone.coord.y-0.8, Config.Laundry.packageZone.coord.z-1.05, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(Config.Laundry.packageZone.coord.x+0.27, Config.Laundry.packageZone.coord.y-0.8, Config.Laundry.packageZone.coord.z-1.05, 0.0, 0.0, 180.0, 2, false, false, 1065353216, 0, 1.3)
    local tin = CreateObject(GetHashKey("bkr_prop_coke_tin_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local cash = CreateObject(GetHashKey("bkr_prop_tin_cash_01a"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local unsorted = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local unsorted2 = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local wrapped = CreateObject(GetHashKey("bkr_prop_money_wrapped_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    local wrapped2 = CreateObject(GetHashKey("bkr_prop_money_wrapped_01"), Config.Laundry.packageZone.coord.x, Config.Laundry.packageZone.coord.y, Config.Laundry.packageZone.coord.z-1.10, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "note_counting_v2_counter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(tin, packScene, animDict, "note_counting_v2_binmoney", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(cash, packScene, animDict, "note_counting_v2_moneybin", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(unsorted, packScene, animDict, "note_counting_v2_moneyunsorted", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(unsorted2, packScene2, animDict, "note_counting_v2_moneyunsorted^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(wrapped, packScene2, animDict, "note_counting_v2_moneywrap", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(wrapped2, packScene2, animDict, "note_counting_v2_moneywrap^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    Wait(18000)
    SetEntityCoords(playerPed, 1119.4, -3197.68, -41.70)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    DeleteEntity(counter)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(tin)
    DeleteEntity(cash)
    DeleteEntity(unsorted)
    DeleteEntity(unsorted2)
    DeleteEntity(wrapped)
    DeleteEntity(wrapped2)
	FreezeEntityPosition(playerPed, false)
    TriggerServerEvent('SickMoneyWash:washMoney', washcount)
    cutting = false
    packaged = false
    washed = false
    Target:disableTargeting(false)
end

local function washmoney2(coord, heading,amount)
    Target:disableTargeting(true)
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@cfm@cfm_drying_notes@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    RequestModel("bkr_prop_money_pokerbucket")
    RequestModel("bkr_prop_money_unsorted_01")
    while not HasModelLoaded("bkr_prop_money_pokerbucket") and not HasModelLoaded("bkr_prop_money_unsorted_01") do Wait(10) end
    SetEntityHeading(playerPed, heading)
    Wait(10)
	FreezeEntityPosition(playerPed, true)
    local bucket = CreateObject(GetHashKey("bkr_prop_money_pokerbucket"), coord.x, coord.y, coord.z, true, false, false)
    local money = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), coord.x, coord.y, coord.z, true, false, false)
    local money2 = CreateObject(GetHashKey("bkr_prop_money_unsorted_01"), coord.x, coord.y, coord.z, true, false, false)
    local washScene = NetworkCreateSynchronisedScene(coord.x, coord.y, coord.z, 0.0, 0.0, 85.0, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(playerPed, washScene, animDict, "loading_v3_worker", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bucket, washScene, animDict, "loading_v3_bucket", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(money, washScene, animDict, "loading_v3_money01", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(money2, washScene, animDict, "loading_v3_money01^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(washScene)
    Wait(32000)
    NetworkStopSynchronisedScene(washScene)
    DeleteEntity(bucket)
    DeleteEntity(money)
    DeleteEntity(money2)
	FreezeEntityPosition(playerPed, false)
    washcount = washcount + amount
    washed = true
    Target:disableTargeting(false)
end

local function OpenWashMenu()
    local money = Inventory:Search('count', 'black_money')
    local input = lib.inputDialog('Money Wash', {
        {type = 'number', label = 'Dirty Money', description = 'Enter Amount you want to wash', icon = 'hashtag', required = true},
      })
    if not input or input[1] > money then
        lib.notify({
            title = 'Money Wash',
            description = 'We Don\'t like Liars Here, You only got $'..money,
            type = 'error'
        })
        return
    end
    local amount = input[1]
    washmoney2(Config.Laundry.washingZone.coord, Config.Laundry.washingZone.heading, amount)
end

local function EnterWash()
	DoScreenFadeOut(500)
	Wait(2000)
	SetEntityCoords(PlayerPedId(), Config.MoneyWash["Exit"].coords.x, Config.MoneyWash["Exit"].coords.y, Config.MoneyWash["Exit"].coords.z, 0, 0, 0, false)
	SetEntityHeading(PlayerPedId(), Config.MoneyWash["Exit"].coords.w)
	DoScreenFadeIn(500)
end

local function ExitWash()
	DoScreenFadeOut(500)
	Wait(2000)
	SetEntityCoords(PlayerPedId(), Config.MoneyWash["Enter"].coords.x, Config.MoneyWash["Enter"].coords.y, Config.MoneyWash["Enter"].coords.z, 0, 0, 0, false)
	SetEntityHeading(PlayerPedId(), Config.MoneyWash["Enter"].coords.w)
	DoScreenFadeIn(500)
end


local function CuttingMoney()
    if not cutting then
        cutting = true
        cuttingMoney2(Config.Laundry.cuttingZone.coords, Config.Laundry.cuttingZone.heading)
	else
        lib.notify({
            title = 'Money Wash',
            description = 'You already cut the money',
            type = 'error'
        })
	end
end

local function PackageMoney()
    if cutting then
        if washed then
            if not packaged then
                packaged = true
                packageMoneyanim()
            else
                lib.notify({
                    title = 'Money Wash',
                    description = 'You already pack the money',
                    type = 'error'
                })
            end
        else
            lib.notify({
                title = 'Money Wash',
                description = 'Wash Money First',
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'Money Wash',
            description = 'Cut Money First',
            type = 'error'
        })
    end
end

local function Washmoney()
  if cutting and not packaged then
    OpenWashMenu()
  else
    lib.notify({
        title = 'Money Wash',
        description = 'Cut/Wash Money First',
        type = 'error'
    })
  end
end

local function KickOnPower()
    if IsPowered then
        Target:addBoxZone({
            coords = Config.TargetLocs['cuttingZone'].coords,
            size = vec3(1, 2, 2),
            rotation = 90,
            debug = false,
            options = {
                {
                    name = 'box',
                    icon = 'fa-solid fa-cube',
                    label = 'Cut Money',
                    canInteract = function()
                        return true
                    end,
                    onSelect = function()
                        CuttingMoney()
                    end
                }
            }
        })
        Target:addBoxZone({
            coords = Config.TargetLocs['packageZone'].coords,
            size = vec3(1, 2, 2),
            rotation = 90,
            debug = false,
            options = {
                {
                    name = 'box',
                    icon = 'fa-solid fa-cube',
                    label = 'Pack Money',
                    canInteract = function()
                        if cutting and washed then
                            return true
                        else
                            return false
                        end
                    end,
                    onSelect = function()
                        PackageMoney()
                    end
                }
            }
        })
        Target:addSphereZone({
            coords = Config.TargetLocs['washingZone'].coords,
            radius = 1,
            debug = false,
            options = {
                {
                    name = 'box',
                    icon = 'fa-solid fa-cube',
                    label = 'Wash Money',
                    canInteract = function()
                        if cutting and not packaged then
                            return true
                        else
                            return false
                        end
                    end,
                    onSelect = function()
                        Washmoney()
                    end
                }
            }
        })
    end
end

CreateThread(function()
    Target:addBoxZone({
        coords = Config.TargetLocs["Enter"].coords,
        size = vec3(1, 2, 2),
        rotation = 90,
        debug = false,
        options = {
            {
                name = 'box',
                icon = 'fa-solid fa-cube',
                label = 'Enter Money Wash',
                canInteract = function()
                    local Key = Inventory:Search('count', Config.EnterItem)
                    if Key > 0 then
                        return true
                    else
                        return false
                    end
                end,
                onSelect = function()
                    EnterWash()
                end
            }
        }
    })
    Target:addBoxZone({
        coords = Config.TargetLocs["Exit"].coords,
        size = vec3(1, 2, 3),
        rotation = 90,
        debug = false,
        options = {
            {
                name = 'box',
                icon = 'fa-solid fa-cube',
                label = 'Exit Money Wash',
                canInteract = function()
                    return true
                end,
                onSelect = function()
                    ExitWash()
                end
            }
        }
    })
    Target:addBoxZone({
        coords = Config.TargetLocs['powerBox'].coords,
        size = vec3(1, 2, 2),
        rotation = 90,
        debug = false,
        options = {
            {
                name = 'box',
                icon = 'fa-solid fa-cube',
                label = 'Turn On Power',
                canInteract = function()
                    if not IsPowered then
                        return true
                    else
                        return false
                    end
                end,
                onSelect = function()
                    if lib.progressBar({
                        duration = 2000,
                        label = 'Turnin on Power',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true
                        },
                        anim = {
                            dict = 'anim@gangops@facility@servers@bodysearch@',
                            clip = 'player_search'
                        }
                    })
                    then
                        IsPowered = true
                        KickOnPower()
                    else
                        print('Do stuff when cancelled')
                    end
                end
            }
        }
    })
end)

CreateThread(function()
    if Config.Blips then
        for k, v in pairs(Config.Blip) do
            FuelStationBlip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(FuelStationBlip, Config.BlipSpirte)
            SetBlipDisplay(FuelStationBlip, 2)
            SetBlipScale(FuelStationBlip, Config.BlipSize)
            SetBlipAsShortRange(FuelStationBlip, true)
            SetBlipColour(FuelStationBlip, Config.BlipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.BlipLabel)
            EndTextCommandSetBlipName(FuelStationBlip)
        end
    end
end)