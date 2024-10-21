
State
{
	StateName = "QuestState01",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 1},
		},
		Actions =
		{
			QuestSetActive {Quest = "MagnetStonesMosaicOfDeath"},
			QuestSetActive {Quest = "FindSecondFragment"},
		}, -- sobald Teil 1 eingesetzt ist
		GotoState = "QuestState02"
	},
}

State
{
	StateName = "QuestState02",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "default", ItemId = 93, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindSecondFragment"},
			QuestSetActive {Quest = "InsertSecondFragment"},
		}, -- sobald 2. Fragment gefunden
		GotoState = "QuestState03"
	},
}

State
{
	StateName = "QuestState03",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "InsertSecondFragment"},
			QuestSetActive {Quest = "FindThirdFragment"},
		}, -- sobald Teil 2 eingesetzt ist
		GotoState = "QuestStateA3"
	},
}

State
{
	StateName = "QuestStateA3",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "default", ItemId = 94, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindThirdFragment"},
			QuestSetActive {Quest = "InsertThirdFragment"},
		}, -- sobald 3. Fragment gefunden
		GotoState = "QuestState04"
	},
}

State
{
	StateName = "QuestState04",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 3},
		},
		Actions =
		{
			QuestSetSolved {Quest = "InsertThirdFragment"},
			QuestSetActive {Quest = "FindLastFragment"},
		}, -- sobald Teil 3 eingesetzt ist
		GotoState = "QuestStateA4"
	},
}


State
{
	StateName = "QuestStateA4",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "default", ItemId = 95, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindLastFragment"},
			QuestSetActive {Quest = "InsertLastFragment"},
		}, -- sobald 4. Fragment gefunden
		GotoState = "QuestState05"
	},
}

State
{
	StateName = "QuestState05",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 4},
		},
		Actions =
		{
			QuestSetSolved {Quest = "InsertLastFragment"},
			QuestSetActive {Quest = "MasterOfTheMosaic"},
		}, -- sobald Teil 4 eingesetzt ist
		GotoState = "QuestState06"
	},
}

State
{
	StateName = "QuestState06",

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_MasterSpawned"},
			FigureIsDead{Tag = "MosaicMaster"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MasterOfTheMosaic"},
			QuestSetSolved {Quest = "MagnetStonesMosaicOfDeath"},
		}, -- sobald Meister des Mosaiks getötet ist
	},
}


