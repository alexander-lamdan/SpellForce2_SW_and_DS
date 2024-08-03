
State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst01"},
		},
		Actions =
		{
			FigureWalk	{X = 497, Y = 437},
		},
		
	},
	
	
	OnFigureRespawnEvent	
	{
		WaitTime = 60,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst01"},
		},
		Actions = 
		{
			FigureWalk	{X = 497, Y = 437},
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

