
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
			FigureWalk	{X = 238, Y = 315},
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
			FigureWalk	{X = 238, Y = 315},
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

