
State
{
		StateName = "WorkerState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_Worker03Spawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WorkerSpawn03Gestartet"}, 
		},
	},


	
};
