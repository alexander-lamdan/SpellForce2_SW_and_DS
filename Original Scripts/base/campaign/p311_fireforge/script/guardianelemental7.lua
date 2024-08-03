State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnLastEssence"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
};
