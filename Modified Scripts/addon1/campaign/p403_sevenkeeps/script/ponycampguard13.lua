
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 6,
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

