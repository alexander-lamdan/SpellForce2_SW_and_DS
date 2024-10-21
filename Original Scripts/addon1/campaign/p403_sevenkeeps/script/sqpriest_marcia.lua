State
{
	StateName = "WaitForQuestStart",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToMarcia"},
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
		EventName = "QuestStart",
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToMarcia"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
		GotoState = "TalkToMe",
	};
};


State
{
	StateName = "TalkToMe",

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToMarcia"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureVanish	{},
			--FigureTeleportToEntity	{TargetTag = "SQPriest_SpawnMarcia"},
			--FigureDirectionSetToEntity	{TargetTag = "SQPriest_GraveMarcia"},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
