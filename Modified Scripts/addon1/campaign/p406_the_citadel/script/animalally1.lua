State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		WaitTime = 18,
		X = 123,
		Y = 345,
		Conditions =
		{
-- 			BuildingIsAlive	{Tag = "BeastSpawnCamp"},
		},
		Actions =
		{
			FigureWalk	{X = 246, Y = 408},
			FigureWalk	{X = 460, Y = 361},
			FigureWalk	{X = 478, Y = 273},
			FigureWalk	{X = 469, Y = 467},
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