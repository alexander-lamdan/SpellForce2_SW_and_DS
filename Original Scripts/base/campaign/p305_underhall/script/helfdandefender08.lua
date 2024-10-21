
State
{
	StateName = "HelfdanDefender08Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_HelfdanDefenderSpawn"},
		},
		Actions = 
		{
			EntityFlagSetTrue  {Name = "ef_HelfdanDefender08_Alive"},
		},
	};

	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 649,
		Y = 181,
		Conditions = 
		{
			EntityFlagIsTrue  {Name = "ef_HelfdanDefender08_Alive"},
			MapFlagIsFalse {Name = "mf_HelfdanDefenderRespawnFinish"},
		},
		Actions = 
		{
			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
		},
		DeathActions = 
		{
		},
	
	};


};
