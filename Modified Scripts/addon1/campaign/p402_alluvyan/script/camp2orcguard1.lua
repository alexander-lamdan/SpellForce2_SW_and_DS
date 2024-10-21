
--*******************************************************
--***                                                 ***
--***             OrcMeleeTeam01    		          ***
--***                    	                          ***
--*******************************************************



State
{
	StateName = "INIT",
	OnFigureRespawnEvent
	{
		WaitTime = 8,
		X = 399,
		Y = 393,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc2"},
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

