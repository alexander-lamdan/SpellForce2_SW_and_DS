State
{	
	StateName = "ALIVE",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_Spawn" .. GetScriptTag()},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQMistyCoast_Spawn" .. GetScriptTag()},
			FigureWalkToEntity	{TargetTag = "ShellHorn"},
		},
		DelayedActions = 
		{
		},
	};

	OnFigureRespawnEvent
	{
		WaitTime = 0,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_Spawn" .. GetScriptTag()},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQMistyCoast_Spawn" .. GetScriptTag()},
			FigureWalkToEntity	{TargetTag = "ShellHorn"},
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	};
};
