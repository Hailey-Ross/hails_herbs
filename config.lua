Config = {}

--[[

    Colors:
        Red          ~e~
        Yellow       ~o~
        Orange       ~d~
        Gray         ~m~
        White        ~q~
        Light Gray   ~t~
        Black        ~v~
        Pink         ~u~
        Blue         ~pa~
        Purple       ~t1~
        Orange?      ~t2~
        Light Blue   ~t3~
        Yellow?      ~t4~
        Light Pink   ~t5~
        Green        ~t6~
        Dark Blue    ~t7~
        Light Red    ~t8~

]]

Config.debug = false

Config.cooldowntimer = 5000

-->        ALERTS SECTION        <--

Config.alertToggle = true -- True enables tip messages on successfully picking berries | False for opposite

Config.namecolor = '~t6~' -- Color for Players Name included in Alert Text
Config.alertcolor = '~q~' -- Color for general text in alert

Config.alerttext = ' Oh, I found '
Config.Failtext = ' I do not think I can eat these berries. . . ' -- UNUSED ATM

-- -- -- -- -- -- -- -- -- -- -- -- --

Config.text = 'Collect' -- Prompt Message text for picking berries

Config.items = {
	{item = "consumable_acorn", name = "an Acorn", amountToGive = math.random(1,4)},
	{item = "consumable_herb_evergreen_huckleberry", name = "some Evergreen Huckleberries", amountToGive = math.random(1,2)},
	{item = "consumable_peach", name = "a Peach", amountToGive = math.random(1,2)},
	{item = "consumable_pear", name = "a Pear", amountToGive = math.random(1,2)},
	{item = "apple", name = "an Apple", amountToGive = math.random(1,1)},
	{item = "carrots", name = "a Carrot", amountToGive = math.random(1,2)},
	{item = "blueberry", name = "some Blueberries", amountToGive = math.random(1,3)},
}