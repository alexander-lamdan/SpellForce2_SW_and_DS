local CUpdateInterval = SetUpdateInterval {Steps = math.random(7, 9)}

 --Wenn einer der Dämonentürme zerstört wurde

State
{
	StateName = "TzangSpawn",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsTrue {Name = "mf_TzangAlive"},
			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_Brandstifter03Alive"}, 
		},
	}, 


	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsTrue {Name = "mf_NewOrogWave"},
			MapFlagIsFalse {Name = "mf_OrogIsDead"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_BrandstifterNotAlive"},
		},
		DeathActions = 
		{
			
		},
	},
};
