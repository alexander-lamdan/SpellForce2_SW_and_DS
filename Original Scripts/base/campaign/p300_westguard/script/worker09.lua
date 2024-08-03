
State
{
		StateName = "WorkerState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_Worker09Spawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WorkerSpawn09Gestartet"}, 
		},
	},


	
};
