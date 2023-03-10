VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local Items = {
	{item = "consumable_acorn", name = "an Acorn", amountToGive = math.random(1,4)},
	{item = "consumable_herb_evergreen_huckleberry", name = "some Evergreen Huckleberries", amountToGive = math.random(1,2)},
	--{item = "tobacco", name = "some Indian Tobacco", amountToGive = math.random(1,3)},
	--{item = "consumable_herb_oregano", name = "some Oregano", amountToGive = math.random(1,3)},
    --{item = "consumable_herb_vanilla_flower", name = "a Vanilla scented Flower", amountToGive = math.random(1,3)},
	--{item = "consumable_herb_wintergreen_berry", name = "some Wintergreen Berries", amountToGive = math.random(1,1)},
	{item = "consumable_peach", name = "a Peach", amountToGive = math.random(1,2)},
	{item = "consumable_pear", name = "a Pear", amountToGive = math.random(1,2)},
	{item = "apple", name = "an Apple", amountToGive = math.random(1,1)},
	{item = "carrots", name = "a Carrot", amountToGive = math.random(1,2)},
	{item = "blueberry", name = "some Blueberries", amountToGive = math.random(1,3)},
	--{item = "Chanterelles", name = "some Chanterelle Mushrooms", amountToGive = math.random(1,1)}
}

RegisterServerEvent('vorp_picking:addItem')
AddEventHandler('vorp_picking:addItem', function()
	local FinalLoot = LootToGive(source)
	local User = VorpCore.getUser(source).getUsedCharacter
	for k,v in pairs(Items) do
		if v.item == FinalLoot then
			VorpInv.addItem(source, FinalLoot, v.amountToGive)
			LootsToGive = {}
			TriggerClientEvent("vorp:TipBottom", source, '~t6~'..User.firstname.. ' ' ..User.lastname.. '~q~: Oh, I found ' ..v.name, 3000)
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