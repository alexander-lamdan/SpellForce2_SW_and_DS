

--*******************************************************
--***                                                 ***
--***         			Wichtel A2		       	      ***
--***                                                 ***
--*******************************************************  
   
State
{
	StateName = "WichtelInitA2",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 429,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsEqual	{Name = "mv_WichtelGroupA2", Value = 0},
			MapFlagIsTrue {Name = "mf_TzangAlive"},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupA2", Value = 1},
		},
	},
};
