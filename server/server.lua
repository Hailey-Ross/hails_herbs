VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local configNameColor = Config.namecolor
local configAlertColor = Config.alertcolor
local configAlertText = Config.alerttext
local Items = Config.items
local debug = Config.debug
local alertToggler = Config.alertToggle

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
			if alertToggler then TriggerClientEvent("vorp:TipBottom", source, ''.. configNameColor .. User.firstname .. ' ' .. User.lastname .. configAlertColor .. ':' .. configAlertText .. v.name, 3000) end
		end
	end
end)

function LootToGive(source)
	local LootsToGive = {}
	local playerCamRot = GetPlayerCameraRotation(source)
	local playerPingSeed = GetPlayerPing(source)
	local specialSauce = playerPingSeed / playerCamRot.y
	local fortyfours = 0.414444144 * playerCamRot.z + playerPingSeed
	if specialSauce <= 0 then specialSauce = GetGameTimer() / playerCamRot.z * fortyfours end
	local gameTimerSeed = GetGameTimer()
	local preSeeding = playerCamRot.x * gameTimerSeed * fortyfours
	local RandomSeed = preSeeding / specialSauce
	if debug == true then print("Seed Generated: " .. RandomSeed .. " | [Modifiers applied] | Ping: " .. playerPingSeed .. ", Special Mod: " .. specialSauce .. ", Special Mod Deux: " .. fortyfours .. ", Camera Rotation Z: " .. playerCamRot.z .. ", Camera Rotation X: " .. playerCamRot.x .. ", Camera Rotation Y: " .. playerCamRot.y .. ", GameTimer: " .. gameTimerSeed .. " ") end
	math.randomseed(RandomSeed)
	for k,v in pairs(Items) do
		table.insert(LootsToGive,v.item)
	end

	if LootsToGive[1] ~= nil then
		local value = math.random(1,#LootsToGive)
		local picked = LootsToGive[value]
		return picked
	else
		--FIX ME--if alertToggler then TriggerClientEvent("vorp:TipBottom", source, ''.. configNameColor .. User.firstname .. ' ' .. User.lastname .. configAlertColor .. ':' .. configFailText .. v.name, 3000) end
		if debug == true then print("Failed to pick berries/herbs.") end
	end
end