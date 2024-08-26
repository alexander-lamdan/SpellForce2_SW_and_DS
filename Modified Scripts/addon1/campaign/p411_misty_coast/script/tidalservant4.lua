State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "MistyCoastLearnTidalTones"},
		},
		Actions = 
		{
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