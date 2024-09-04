
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 4,
		X = 250,
		Y = 432,
		Conditions =
		{
-- 			BuildingIsAlive	{Tag = "Opponent2Base2"},
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

