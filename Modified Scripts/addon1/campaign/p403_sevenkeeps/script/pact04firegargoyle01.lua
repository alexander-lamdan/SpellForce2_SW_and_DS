
State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst04"},
		},
		Actions =
		{
			FigureWalk	{X = 219, Y = 317},
		},
		
	},
	
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "GargoyleHorst04"},
		},
		Actions = 
		{
			FigureWalk	{X = 219, Y = 317},
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

