
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 631,
		Y = 91,
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

