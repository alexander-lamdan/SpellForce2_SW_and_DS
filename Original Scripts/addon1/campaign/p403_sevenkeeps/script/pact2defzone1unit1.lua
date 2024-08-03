
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 90,
		X = 282,
		Y = 684,
		Conditions =
		{
			BuildingIsAlive	{Tag = "Camp02"},
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

