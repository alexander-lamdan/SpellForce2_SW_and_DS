State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnEssence2"},
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
