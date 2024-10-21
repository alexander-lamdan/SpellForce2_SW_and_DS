
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = 550,
		Y = 536,
		Conditions =
		{
			BuildingIsAlive	{Tag = "Nordcamp02"},
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

