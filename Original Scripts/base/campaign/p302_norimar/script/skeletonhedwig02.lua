State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_HedwigSummonSkeletons"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	},


};

