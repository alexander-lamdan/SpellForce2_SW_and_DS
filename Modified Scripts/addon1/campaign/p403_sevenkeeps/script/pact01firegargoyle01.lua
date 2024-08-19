
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
			FigureWalk	{X = 486, Y = 460},
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
			FigureWalk	{X = 486, Y = 460},
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

