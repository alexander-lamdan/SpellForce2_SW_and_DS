
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 6,
		X = 471,
		Y = 352,
		Conditions =
		{
-- 			BuildingIsAlive	{Tag = "BeastSpawnCamp"},
		},
		Actions =
		{
			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
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

