
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 6,
		X = 126,
		Y = 673,
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

