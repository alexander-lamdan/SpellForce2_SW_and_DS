
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
			MapValueAdd{Name = "mv_BlessedCounting", Value = 1},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}