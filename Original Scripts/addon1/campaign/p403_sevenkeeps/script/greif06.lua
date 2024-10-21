
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = 182,
		Y = 443,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P403_EndCS"},
		},
		Actions = 
		{
			FigureWalk	{X = 250, Y = 525},
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

