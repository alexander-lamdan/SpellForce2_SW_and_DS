State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_Spawn" .. GetScriptTag()},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "ShellHorn"},
		},
		DelayedActions = 
		{
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "ALIVE",
	};
};

State
{	
	StateName = "ALIVE",
};