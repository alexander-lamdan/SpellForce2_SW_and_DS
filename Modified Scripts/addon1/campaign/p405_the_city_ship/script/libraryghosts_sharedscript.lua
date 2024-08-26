
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_DiscoveredLibraryObject"},
		},
		Actions = 
		{
			MapValueAdd{Name = "mv_LibraryGhostAppeared", Value = 1},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}