

--*******************************************************
--***                                                 ***
--***         			Wichtel C2		       	      ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "WichtelInitC",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 429,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsGreaterOrEqual	{Name = "mv_WichtelGroupB2", Value = 2},
			MapValueIsEqual	{Name = "mv_WichtelGroupC2", Value = 0},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupC2", Value = 1},
		},
	},
};
