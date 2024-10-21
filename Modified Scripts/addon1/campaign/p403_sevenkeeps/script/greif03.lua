
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 10,
		X = 350,
		Y = 446,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P403_EndCS"},
		},
		Actions = 
		{
			FigureWalk	{X = 222, Y = 321},
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

