
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_DiscoveredCrafterObject"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_CrafterSpiderAppeared"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}