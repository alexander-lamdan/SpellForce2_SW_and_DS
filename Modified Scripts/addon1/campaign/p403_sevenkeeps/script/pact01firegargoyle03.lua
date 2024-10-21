
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
			FigureWalk	{X = 506, Y = 441},
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
			FigureWalk	{X = 506, Y = 441},
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

