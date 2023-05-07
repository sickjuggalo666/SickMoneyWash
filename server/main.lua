ESX = exports['es_extended']:getSharedObject()
local Inventory = exports.ox_inventory

RegisterServerEvent('SickMoneyWash:washMoney', function(amount)
	local tax = Config.Percentage
	amount = ESX.Math.Round(tonumber(amount))
	washedCash = amount * tax
	washedTotal = ESX.Math.Round(tonumber(washedCash))
	local PlayerMoney = Inventory:Search(source, 'count', 'black_money')
	if amount > 0 and PlayerMoney >= amount then
        Inventory:RemoveItem(source, 'black_money', washedTotal)
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Money Wash',
            description = 'you have washed ' .. ESX.Math.GroupDigits(amount) .. ' dirty money' .. ' you have received ' .. ESX.Math.GroupDigits(washedTotal) .. ' clean money',
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
