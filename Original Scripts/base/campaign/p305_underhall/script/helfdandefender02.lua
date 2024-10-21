
State
{
	StateName = "HelfdanDefender02Init",
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
			EntityFlagSetTrue  {Name = "ef_HelfdanDefender02_Alive"},
		},
	};

	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 649,
		Y = 181,
		Conditions = 
		{
			EntityFlagIsTrue  {Name = "ef_HelfdanDefender02_Alive"},
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
