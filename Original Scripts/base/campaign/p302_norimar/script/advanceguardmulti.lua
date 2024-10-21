State
{
	StateName = "Attack",
	
	OnFigureSpawnOnlyWhenEvent
	{
		--Team = "tm_BadGuys",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnAdvanceGuard"},
		},
		Actions = 
		{
		},
	},
};	