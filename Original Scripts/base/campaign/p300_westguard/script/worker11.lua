
State
{
		StateName = "WorkerState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_Worker11Spawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WorkerSpawn11Gestartet"}, 
		},
	},


	
};
