VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local cooldowntimer = Config.cooldowntimer * 1000
local configNameColor = Config.namecolor
local configAlerttype = Config.alertType
local configAlertColor = Config.alertcolor
local configColonColor = Config.coloncolor
local configAlertText = Config.alerttext
local configFailText = Config.Failtext
local configOnesync = Config.oneSync
local alertToggler = Config.alertToggle
local alertDuration = Config.alertDuration * 1000
local Items = Config.items
local debug = Config.debug
local vdebug = Config.vdebug

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

if debug and not vdebug then print("Debug Mode: Enabled") elseif vdebug then print("Verbose-Debugging: Enabled") end
if debug and configOnesync then print("OneSync: Enabled") elseif debug and not configOnesync then print("OneSync: DISABLED -- RNG Seeding will be hampered as a result. \nConsider moving to OneSync.") end
if vdebug then 
	print("Cooldown timer registered: " .. Config.cooldowntimer .. " seconds")
	print("Alert style Registered: " .. configAlerttype)
end

if configAlerttype > 2 or configAlerttype < 1 then 
	print("[ERROR]\n Alert Style choice invalid.\n Input Value: " .. configAlerttype .. "\n Falling back to Default of 1")
	configAlerttype = 1
end

RegisterServerEvent('vorp_picking:addItem')
AddEventHandler('vorp_picking:addItem', function()
	local FinalLoot = LootToGive(source)
	local User = VorpCore.getUser(source).getUsedCharacter
	for k,v in pairs(Items) do
		if v.item == FinalLoot then
			VorpInv.addItem(source, FinalLoot, v.amountToGive)
			LootsToGive = {}
			if alertToggler and configAlerttype == 1 then VorpCore.NotifyObjective(source, configNameColor .. User.firstname .. ' ' .. User.lastname .. configColonColor .. ': ' .. configAlertColor .. configAlertText .. ' ' .. v.name, alertDuration) end
			if alertToggler and configAlerttype == 2 then VorpCore.NotifyBottomRight(source, 'You find ' .. v.name, alertDuration) end
			if vdebug then print(" Loot: " .. v.item .. "\n Player: " .. User.firstname .. " " .. User.lastname) end
		end
	end
end)

function LootToGive(source)
	local LootsToGive = {}
	for k,v in pairs(Items) do
		table.insert(LootsToGive,v.item)
	end

	if LootsToGive[1] ~= nil then
		local playerCamRot = GetPlayerCameraRotation(source)
		local playerPingSeed = GetPlayerPing(source)
		local specialSauce = playerPingSeed / playerCamRot.x
		local fortyfours = 0.414444144 * playerCamRot.z + playerPingSeed
		local gameTimerSeed = GetGameTimer()
		local preSeeding = playerCamRot.x * gameTimerSeed * fortyfours
		local RandomSeed = 0
		if not configOnesync then RandomSeed = gameTimerSeed * 0.414444144 else RandomSeed = preSeeding * specialSauce end
		if vdebug then print("[Hails.Herbs]\n Seed Generated: " .. RandomSeed .. "\n [Modifiers applied]\n Ping: " .. playerPingSeed .. "\n Special Mod: " .. specialSauce .. "\n Special Mod Deux: " .. fortyfours .. "\n Camera Rotation Z: " .. playerCamRot.z .. "\n Camera Rotation X: " .. playerCamRot.x .. "\n GameTimer: " .. gameTimerSeed .. " ") end
		math.randomseed(RandomSeed)
		local value = math.random(1,#LootsToGive)
		local picked = LootsToGive[value]
		return picked
	else
		if vdebug then VorpCore.NotifyBottomRight(source, configFailText, alertDuration) end
		if debug then print("[Hails.Herbs]\n Failed to pick berries/herbs. LootsToGive was Nil value.") end
	end
end