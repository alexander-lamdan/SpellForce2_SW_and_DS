
State
{
	StateName = "KaraState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 397,
		Y = 386,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 3},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_KaraAlive"},
			AvatarFlagSetTrue{Name = "af_P300_KaraSaved"},
			DialogTypeSetSideQuest	{Tag = "Kara"},
			DialogTypeSetSideQuest	{Tag = "Warrad"},
			DialogSetEnabled	{Tag = "Warrad" },
			FigureSwappingDisable {},
		},
	},

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
			QuestIsNotKnown	{Quest = "WestguardFindDaughter"},
			MapFlagIsTrue{Name = "mf_KaraSpawn"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_KaraAlive"},
			AvatarFlagSetTrue{Name = "af_P300_KaraSaved"},
			MapFlagSetTrue{Name = "mf_KaraWalkHome"},
			FigureSwappingDisable {},
		},
	},
	--Kara begibt sich zu ihrem Vater
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_KaraWalkHome"},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Kara", X = 397, Y = 386},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Range = 2, X = 397, Y = 386},
			MapFlagIsTrue{Name = "mf_KaraWalkHome"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{Tag = "Kara"},
		},
	},
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsIdle {},
			FigureIsInRange	{Range = 1, X = 397, Y = 386},
		},
		Actions = 
		{
			FigureLookAtEntity	{Tag = "default", TargetTag = "Warrad"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P300_KaraDialogEnd"}, 
		},
		Actions = 
		{
			FigureLookAtEntity	{TargetTag = "Warrad"},
		},
	},
	
	
	
};
