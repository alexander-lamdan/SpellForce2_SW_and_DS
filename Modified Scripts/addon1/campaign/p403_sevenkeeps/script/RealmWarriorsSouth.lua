
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 630,
		Y = 64,
		Conditions =
		{

		},
		Actions =
		{
			FigureWalk	{X = GetEntityX(), Y = GetEntityY()},
		},
		DeathActions =
		{

		},
		DelayedActions =
		{
		},
		NoSpawnEffect = false,
		IsSpawnOnlyWhen = false,
	},

};

