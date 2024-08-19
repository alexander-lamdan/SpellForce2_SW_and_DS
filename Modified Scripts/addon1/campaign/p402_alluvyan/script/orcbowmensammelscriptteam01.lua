
--*******************************************************
--***                                                 ***
--***             GreifenSammelscriptTeam01           ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnFigureRespawnEvent	
	{
		WaitTime = 60,
		X = 319,
		Y = 406,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc1_1"},
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

