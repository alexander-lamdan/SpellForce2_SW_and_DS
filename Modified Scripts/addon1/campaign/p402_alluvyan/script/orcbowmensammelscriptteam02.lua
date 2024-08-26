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
		WaitTime = 8,
		X = 427,
		Y = 407,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc2_1"},
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

