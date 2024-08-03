
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_BetaHauptlagerEingenommen"},
			MapFlagIsFalse{Name = "mf_AlphaHauptlagerEingenommen"},
		},
		Actions = 
		{
			FigureWalk	{X = 120, Y = 184},
		},
	},

};

