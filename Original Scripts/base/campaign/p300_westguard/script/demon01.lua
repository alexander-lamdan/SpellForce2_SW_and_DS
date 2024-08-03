
State
{
		StateName = "DemonState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_DemonSpawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_DemonSpawn01Gestartet"}, 
		},
	},


	
};
