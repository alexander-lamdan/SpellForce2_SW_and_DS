
State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst03"},
		},
		Actions =
		{
			FigureWalk	{X = 411, Y = 231},
		},
		
	},
	
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst03"},
		},
		Actions = 
		{
			FigureWalk	{X = 411, Y = 231},
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

