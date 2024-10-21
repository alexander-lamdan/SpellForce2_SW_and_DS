
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = 474,
		Y = 436,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P403_EndCS"},
		},
		Actions = 
		{
			FigureWalk	{X = 497, Y = 437},
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

