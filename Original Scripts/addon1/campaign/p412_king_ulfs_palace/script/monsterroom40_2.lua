
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
			FigureRun	{X = 80, Y = 249},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			EntityIsExisting	{Tag = "teleporterRoom40"},
		},
		Actions = 
		{
			FigureRun	{X = 80, Y = 249},
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

