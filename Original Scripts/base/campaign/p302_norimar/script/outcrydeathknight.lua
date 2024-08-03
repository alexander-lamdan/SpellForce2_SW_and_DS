State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Main",
		
		Actions = 
		{
		},
		
		Conditions = 
		{
		},
		
	},
	
};

State
{
	StateName = "Main",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "BlowTheHorn"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "DeathKnight1"},
			FigureOutcry	{TextTag = "DeathKnight2"},
			FigureOutcry	{TextTag = "DeathKnight3"},
		},
		DelayedActions = 
		{
		},
	};
	
};