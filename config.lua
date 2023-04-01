Config = {}

Config.debug = false

Config.cooldowntimer = 5000

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

Config.namecolor = '~t6~'
Config.alertcolor = '~q~'

Config.alerttext = ' Oh, I found '

Config.text = 'Collect'

Config.items = {
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