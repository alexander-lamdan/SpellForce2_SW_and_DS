State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToElyria"},
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
			QuestIsActive	{Quest = "PriestEpicDeathTalkToElyria"},
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
