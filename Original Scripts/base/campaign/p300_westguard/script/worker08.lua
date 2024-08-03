
State
{
		StateName = "WorkerState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_Worker08Spawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WorkerSpawn08Gestartet"}, 
		},
	},


	
};
