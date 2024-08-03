

--*******************************************************
--***                                                 ***
--***         			Wichtel C1		       	      ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "WichtelInitC",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 423,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsGreaterOrEqual	{Name = "mv_WichtelGroupB", Value = 2},
			MapValueIsEqual	{Name = "mv_WichtelGroupC", Value = 0},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupC", Value = 1},
		},
	},
};
