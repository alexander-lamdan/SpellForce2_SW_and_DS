State
{	
	StateName = "Spawn",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Actors_CS_02_Spawn"},
		},
		Actions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EndDwarvesAndElvesCS"},
		},
		Actions = 
		{
			--FigureRun	{X = 471, Y = 261},
			FigurePlayerTransfer	{Player = "pl_Human"},
		},
		GotoState = "INIT",
	};
};

State
{	
	StateName = "INIT",
	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_EndEndFightCS"},
		},
		Actions = 
		{
			--FigureRun	{X = 471, Y = 261},
			FigurePlayerTransfer	{Player = "pl_Human"},
		},
		DeathActions = 
		{
		},
	
	};
	
};
