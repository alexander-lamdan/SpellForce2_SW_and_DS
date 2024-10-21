
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
			FigureRun	{X = 80, Y = 235},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			EntityIsExisting	{Tag = "teleporterRoom38"},
		},
		Actions = 
		{
			FigureRun	{X = 80, Y = 235},
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

