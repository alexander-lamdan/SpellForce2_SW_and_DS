
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 5,
		X = 473,
		Y = 254,
		Conditions =
		{
-- 			BuildingIsAlive	{Tag = "Opponent4Base2"},
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

