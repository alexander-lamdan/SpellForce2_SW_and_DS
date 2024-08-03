
--*******************************************************
--***                                                 ***
--***         			Wichtel D1-D8	       	      ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "WichtelInitD2",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 429,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsGreaterOrEqual	{Name = "mv_WichtelGroupC2", Value = 4},
			MapValueIsEqual	{Name = "mv_WichtelGroupD2", Value = 0},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupD2", Value = 1},
		},
	},
};
