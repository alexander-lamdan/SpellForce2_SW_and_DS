State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToMo"},
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
			QuestIsActive	{Quest = "PriestEpicDeathTalkToMo"},
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
