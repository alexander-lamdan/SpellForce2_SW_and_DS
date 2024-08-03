State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnEssence1"},
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
