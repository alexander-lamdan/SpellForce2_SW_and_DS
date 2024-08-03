State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Actions =
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest {},
			MapFlagSetTrue{Name = "mf_DebugPostbote"}
		},
		Conditions = 
		{
			QuestIsActive {Quest = "NorimarPostbote"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SetLetterQuestSolved"},
		},
		Actions = 
		{
			QuestSetActive     {Quest = "TellUlandAboutSolveig"},
			AvatarItemMiscTake {ItemId = 244, Amount = 1},
		},
	};


};


