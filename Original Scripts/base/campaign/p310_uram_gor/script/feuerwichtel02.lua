

--*******************************************************
--***                                                 ***
--***         			Wichtel B1		       	      ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "WichtelInitB",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 423,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsGreaterOrEqual	{Name = "mv_WichtelGroupA", Value = 1},
			MapValueIsEqual	{Name = "mv_WichtelGroupB", Value = 0},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupB", Value = 1},
		},
	},
};
