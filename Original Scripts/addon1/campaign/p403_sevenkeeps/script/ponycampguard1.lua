
State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 1,
		X = 126,
		Y = 673,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_Track01Vanish"},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 31, X = 126, Y = 666},
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

