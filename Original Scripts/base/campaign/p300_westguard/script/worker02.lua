
State
{
		StateName = "WorkerState",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_Worker02Spawn"}, 
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WorkerSpawn02Gestartet"}, 
		},
	},


	
};
