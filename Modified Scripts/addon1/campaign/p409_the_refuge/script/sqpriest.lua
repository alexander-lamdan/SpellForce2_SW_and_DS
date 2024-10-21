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
			QuestIsActive	{Quest = "PriestEpicDeathTalkToMo"},
			EntityTimerIsElapsed	{Name = "et_WaitASecond", Seconds = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQPriest_Mo"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToMo"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureVanish	{Tag = "SQPriest_Mo"},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
