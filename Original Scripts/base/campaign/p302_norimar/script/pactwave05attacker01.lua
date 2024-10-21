State
{
	StateName = "SpawnMe",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartDarkElfAttack"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = true, 
	},
};
