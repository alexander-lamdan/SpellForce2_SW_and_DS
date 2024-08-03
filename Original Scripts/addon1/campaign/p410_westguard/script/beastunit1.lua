
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = 421,
		Y = 114,
		Conditions =
		{
			BuildingIsAlive	{Tag = "Southcamp01"},
		},
		Actions = 
		{
			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
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

