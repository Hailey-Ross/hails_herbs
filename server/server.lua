VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local configNameColor = Config.namecolor
local configAlertColor = Config.alertcolor
local configAlertText = Config.alerttext
local Items = Config.items

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('vorp_picking:addItem')
AddEventHandler('vorp_picking:addItem', function()
	local FinalLoot = LootToGive(source)
	local User = VorpCore.getUser(source).getUsedCharacter
	for k,v in pairs(Items) do
		if v.item == FinalLoot then
			VorpInv.addItem(source, FinalLoot, v.amountToGive)
			LootsToGive = {}
			TriggerClientEvent("vorp:TipBottom", source, ''.. configNameColor .. User.firstname .. ' ' .. User.lastname .. configAlertColor .. ':' .. configAlertText .. v.name, 3000)
		end
	end
end)

function LootToGive(source)
	local LootsToGive = {}
	for k,v in pairs(Items) do
		table.insert(LootsToGive,v.item)
	end

	if LootsToGive[1] ~= nil then
		local value = math.random(1,#LootsToGive)
		local picked = LootsToGive[value]
		return picked
	end
end