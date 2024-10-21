
--*******************************************************
--***                                                 ***
--***             		TeleportFight	              ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	--Monster begeben sich in den Flur
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigureRun	{X = 98, Y = 250},
		},
		
	},
	

	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			EntityIsExisting	{Tag = "teleporterRoom36"},
		},
		Actions = 
		{
			FigureRun	{X = 98, Y = 250},
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

