
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_BetaHauptlagerEingenommen"},
			MapFlagIsTrue{Name = "mf_AlphaHauptlagerEingenommen"},
		},
		Actions = 
		{
			FigureWalk	{X = 233, Y = 26},
		},
	},

};

