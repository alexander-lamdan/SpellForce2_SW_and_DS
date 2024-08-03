State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToJoshua"},
		},
		Actions = 
		{
			FigureRoamingEnable	{Tag = "default"},
		},
		DelayedActions = 
		{
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToJoshua"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
