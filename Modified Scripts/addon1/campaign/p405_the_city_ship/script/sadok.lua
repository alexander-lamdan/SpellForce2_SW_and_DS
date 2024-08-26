
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SpawnBlessed"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_SpawnedSadok"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}