State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_AgathosKnown"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "GhostwatchAgathos"},
			QuestSetActive	{Quest = "Agathos_OldMan"},
		},
		GotoState = "State01"
	};
}

State
{
	StateName = "State01",

	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc{Player = "default", ItemId = 270, Amount = 1},
				AvatarHasItemMisc{Player = "default", ItemId = 271, Amount = 1},
				AvatarHasItemMisc{Player = "default", ItemId = 272, Amount = 1},
				AvatarHasItemMisc{Player = "default", ItemId = 273, Amount = 1},
				AvatarHasItemMisc{Player = "default", ItemId = 274, Amount = 1},
				AvatarHasItemMisc{Player = "default", ItemId = 275, Amount = 1},
				AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 1},
			},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "Agathos_OldMan"},
			QuestSetActive	{Quest = "Agathos_FirstItem"},
		},
		GotoState = "State02"
	};
}

State
{
	StateName = "State02",

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "Agathos_FirstItem"},
			QuestSetActive	{Quest = "Agathos_MoreItems"},
		},
		GotoState = "State03"
	};
}

State
{
	StateName = "State03",

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 3},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "Agathos_MoreItems"},
			QuestSetSolved	{Quest = "GhostwatchAgathos"},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
