State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_WaitASecond"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToElyria"},
			QuestIsActive	{Quest = "PriestEpicDeathTalkToJoshua"},
			EntityTimerIsElapsed	{Name = "et_WaitASecond", Seconds = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQPriest_Elyria"},
			DialogSetEnabled	{Tag = "SQPriest_Joshua"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToElyria"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureVanish	{Tag = "SQPriest_Elyria"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToJoshua"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureVanish	{Tag = "SQPriest_Joshua"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToElyria"},
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToJoshua"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
