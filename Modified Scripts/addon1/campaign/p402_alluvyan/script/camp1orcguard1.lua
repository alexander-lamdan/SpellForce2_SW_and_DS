
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
		WaitTime = 6,
		X = 341,
		Y = 393,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc1"},
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

