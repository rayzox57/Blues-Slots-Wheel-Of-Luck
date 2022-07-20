//IM AM NOT RESPONSIBLE IF THIS RUINS YOUR SERVERS ECONOMY.
//BE SURE TO TEST IT AND MAKE SURE THAT YOU ARE HAPPY WITH THE ODDS OF WINNING
//BEFORE USING IT ON YOUR SERVER!

//ALSO PLEASE PLEASE AFTER CONFIGURING THIS, DO NOT USE PERMA PROP ADDONS TO MAKE THE MACHINES PERMANENT
//AS THIS WILL LIKELY BREAK IT. INSTEAD JUST PLACE THE MACHINES WHERE YOU WANT THEM AND TYP !saveslots
//This will make them permanent, and it saves per map.

//MAKE SURE YOU HAVE ADDED THE WORKSHOP TO YOUR SERVER OR
//IT WILL NOT WORK!!
//http://steamcommunity.com/sharedfiles/filedetails/?id=843596994

WOL_CONFIG = {}

//This is the time in seconds that no one can use the machine after someone spins it
//What this means is if you spin the machine, no one else can use it for at least 30 seconds after you finished using it
//Its usefull to stop people from stealing other peoples machines.
//You can set it to zero but I strongly recommend leaving this at this time.
WOL_CONFIG.antiTheftTime = 30

//This is the price to increase the jackpot amount per spin.
//You can set this to 0 to disable increacing it but I recommend you do
//to keep excitment in players.
WOL_CONFIG.jackpotIncreasePerSpin = 500

//This is the minimal amount the jackpot can reset to
//The jackpot gets reset after someone wins it and it then set to a random number
//between the minimum and maximum jackpot numbers. 
//Set them both to zero if you want to jackpot to start at 0
WOL_CONFIG.jackpotResetMin = 100
WOL_CONFIG.jackpotResetMax = 2000000 //2 mill is reasonable consider the rarity the jackpot should be.

//The amount it charges the user to per spin (It does not charge for the bonus spins as they are free)
WOL_CONFIG.pricePerSpin = 500 


--You can change money Method
	--DRP = DarkRP Money System
	--PS1 = PointShop1 Money
	--PS2 = PointShop2 Money
	--PPS2 = Premium PointShop2 Money
	--CSM = Custom Money System (Use all override functions in bottom of this file)
	--FREE = No Money (Just for fun)

	WOL_CONFIG.Curreny = "PS2"

	--You can change this to anything, or thing. This gets added before any money amount is shown
	WOL_CONFIG.CurrenyPrefixBefore = ""
	WOL_CONFIG.CurrenyPrefixAfter = "PTS"

//This is the chances of each item appearing on the reel
//I tried my best to balance these but of course feel free to change them.
//The chance has to be a whole number and is calculated by "tickets"
//To work out the chance of S
WOL_ITEM_CHANCE[1] = 1   //Bonus (WARNING, MAKING THIS TO HIGH WILL CRUSH YOUR ECONOMY AS PEOPLE CAN SPIN FOR THE JACKPOT MANY TIMES)
WOL_ITEM_CHANCE[2] = 50  //Respberry
WOL_ITEM_CHANCE[3] = 30  //Coins
WOL_ITEM_CHANCE[4] = 10  //Diamond
WOL_ITEM_CHANCE[5] = 60  //Bar Two
WOL_ITEM_CHANCE[6] = 70  //Bar One
WOL_ITEM_CHANCE[7] = 55  //Seven
WOL_ITEM_CHANCE[8] = 65  //Nothing

//These are the payouts for each wining combination.

WOL_CONFIG.winning = {}

//Getting three bonus in a row (This includes 3 bonus spins too)
WOL_CONFIG.winning.threeBonus = 25000

//Getting two bonus in a any position(This includes 3 bonus spins too)
WOL_CONFIG.winning.twoBonus = 10000

//Getting one bonus in a any position(This includes 3 bonus spins too)
WOL_CONFIG.winning.oneBonus = 5000

//Getting threE raspberrys in a row.
WOL_CONFIG.winning.threeRaspberry = 2500

//Getting three coins in a row
WOL_CONFIG.winning.threeCoins = 10000

//Getting two coins in a row
WOL_CONFIG.winning.twoCoins = 5000

//Getting three diamonds in a row
WOL_CONFIG.winning.threeDiamonds = 20000 

//Getting two diamons in any place
WOL_CONFIG.winning.twoDiamonds = 7500

//Getting one diamond in any place
WOL_CONFIG.winning.oneDiamonds = 1000  

//Getting three BAR2's in a row
WOL_CONFIG.winning.threeBar2 = 1750

//Getting three BAR'S in a row
WOL_CONFIG.winning.threeBar = 1000

//Getting three 7's in a row
WOL_CONFIG.winning.threeSeven = 3500

//These are the items on the bonus wheel, DO NOT ADD OR REMOVE ANY
//Only change the numbers.
WOL_AddBonusItem(100)
WOL_AddBonusItem(200)
WOL_AddBonusItem(400)
WOL_AddBonusItem(1000)
WOL_AddBonusItem(2500)
WOL_AddBonusItem(5000)
WOL_AddBonusItem(7500)
WOL_AddBonusItem(10000)
WOL_AddBonusItem(15000)
WOL_AddBonusItem(20000)
WOL_AddBonusItem(30000)
WOL_AddBonusItem(40000)
WOL_AddBonusItem(60000)
WOL_AddBonusItem(75000)
WOL_AddBonusItem(100000)
WOL_AddBonusItem(150000)
WOL_AddBonusItem(175000)
WOL_AddBonusItem(200000)
WOL_AddBonusItem(300000)

//This is a list of ranks that can save machine places, using !saveslots
WOL_CONFIG.allowedRanks = {
	"superadmin"
}


--[[-------------------------------------------------------------------------
Custom Money Method
---------------------------------------------------------------------------]]

WOL_CONFIG.custom = {}

WOL_CONFIG.custom.addMoney = function(ply, amount)
	
end

WOL_CONFIG.custom.canAfford = function(ply, amount)
	return true
end

WOL_CONFIG.custom.takeMoney = function(ply, amount)
	
end


--[[-------------------------------------------------------------------------
Money Method (!! DON'T CHANGE THIS !!)
---------------------------------------------------------------------------]]

WOL_CONFIG.addMoney = function(ply, amount)
	local c = WOL_CONFIG.Curreny
	if(c == "DRP") then
		ply:addMoney(amount)
	elseif(c == "PS1") then
		ply:PS_GivePoints(amount)
	elseif(c == "PS2") then
		ply:PS2_AddStandardPoints(amount)
	elseif(c == "PPS2") then
		ply:PS2_AddPremiumPoints(amount)
	elseif(c == "CSM") then
		WOL_CONFIG.custom.addMoney(ply,amount)
	end
end

WOL_CONFIG.canAfford = function(ply, amount)
	local c = WOL_CONFIG.Curreny
	if(c == "DRP") then
		return ply:canAfford(amount)
	elseif(c == "PS1") then
		return ply:PS_HasPoints(amount)
	elseif(c == "PS2") then
		return ply.PS2_Wallet.points - amount >= 0
	elseif(c == "PPS2") then
		return ply.PS2_Wallet.premiumPoints - amount >= 0
	elseif(c == "CSM") then
		return WOL_CONFIG.custom.canAfford(ply,amount)
	end
	return true
end

WOL_CONFIG.takeMoney = function(ply, amount)
	local c = WOL_CONFIG.Curreny
	if(c == "DRP") then
		ply:addMoney(amount * -1)
	elseif(c == "PS1") then
		ply:PS_TakePoints(amount)
	elseif(c == "PS2") then
		ply:PS2_AddStandardPoints(-amount)
	elseif(c == "PPS2") then
		ply:PS2_AddPremiumPoints(-amount)
	elseif(c == "CSM") then
		WOL_CONFIG.custom.takeMoney(ply,amount)
	end
end

WOL_CONFIG.showMoney = function(amount)

	local f = amount
	while true do   
	   	f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2')
	   	if (k==0) then
			break 
		end
	end

	if(WOL_CONFIG.Curreny == "FREE") then f = "0" end

	return string.format("%s%s%s",WOL_CONFIG.CurrenyPrefixBefore,f,WOL_CONFIG.CurrenyPrefixAfter)
end










//Lastly I guess thanks for the purchase, it helps me so much! I hope you enjoy your addon!