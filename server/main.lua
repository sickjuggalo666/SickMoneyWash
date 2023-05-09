ESX = exports['es_extended']:getSharedObject()
local Inventory = exports.ox_inventory

RegisterServerEvent('SickMoneyWash:washMoney', function(amount)
    if source == nil then return end
	local tax = Config.Percentage
	washedCash = amount * tax
	washedTotal = ESX.Math.Round(tonumber(washedCash))
	local PlayerMoney = Inventory:Search(source, 'count', 'black_money')
	if amount > 0 and PlayerMoney >= amount then
        Inventory:RemoveItem(source, 'black_money', washedTotal)
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Money Wash',
            description = (('you have washed %s dirty money and you have received %s clean money'):format(amount,washedTotal)),
            type = 'success'
        })
		Inventory:AddItem(source, 'money', washedTotal)
	else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Money Wash',
            description = 'You dont have enough Dirty Money',
            type = 'error'
        })
	end
end)

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local resource_name = GetCurrentResourceName()
    local current_version = GetResourceMetadata(resource_name, "version")
    PerformHttpRequest('https://raw.githubusercontent.com/sickjuggalo666/sickVersions/master/'..resource_name..'.txt',function(error, result, headers)
        if not result then 
            return 
        end
        if not result then return end
        local new_version = result:sub(1, -2)
        if new_version ~= current_version then
            print('^2['..resource_name..'] - New Update Available.^0\nCurrent Version: ^5'..current_version..'^0\nNew Version: ^5'..new_version..'^0')
        elseif current_version == current_version then 
            print('^2['..resource_name..'] - All Up To Date Using Version: ^5'..current_version..'^0')
        end
    end,'GET')
    Citizen.Wait(5000)
end)