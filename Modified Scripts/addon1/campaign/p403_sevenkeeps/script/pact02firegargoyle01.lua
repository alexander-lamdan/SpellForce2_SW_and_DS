
State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst02"},
		},
		Actions =
		{
			FigureWalk	{X = 249, Y = 527},
		},
		
	},
	
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst02"},
		},
		Actions = 
		{
			FigureWalk	{X = 249, Y = 527},
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

