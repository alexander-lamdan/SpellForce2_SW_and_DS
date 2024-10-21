

--*******************************************************
--***                                                 ***
--***         			Wichtel A1		       	      ***
--***                                                 ***
--*******************************************************  
   
State
{
	StateName = "WichtelInitA",
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 423,
		Y = 624,
		Conditions = 
		{
			SetUpdateInterval {Steps = math.random(7, 9)},
			MapValueIsEqual	{Name = "mv_WichtelGroupA", Value = 0},
			MapFlagIsTrue {Name = "mf_TzangAlive"},
			MapFlagIsFalse {Name = "mf_BrandstifterNotAlive"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			MapValueAdd	{Name = "mv_WichtelGroupA", Value = 1},
		},
	},
};
