Time = 180 + (math.random(180))


State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = Time,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsNotSolved {Quest = "SevenkeepsA1_PortToGhostwatch"},	
		},
		Actions = 
		{
			FigureRoamingEnable	{},
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

