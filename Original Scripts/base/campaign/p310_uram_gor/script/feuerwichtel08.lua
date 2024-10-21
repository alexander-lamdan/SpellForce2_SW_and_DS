
--*******************************************************
--***                                                 ***
--***         			Wichtel D1-D8	       	      ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "WichtelInitD",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 423,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsGreaterOrEqual	{Name = "mv_WichtelGroupC", Value = 4},
			MapValueIsEqual	{Name = "mv_WichtelGroupD", Value = 0},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupD", Value = 1},
		},
	},
};
