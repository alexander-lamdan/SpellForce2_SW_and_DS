
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 9,
		X = 78,
		Y = 653,
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

