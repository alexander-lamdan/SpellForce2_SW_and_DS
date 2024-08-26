local iLocationRange = 6
local iOthersRange = 15

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "DraghLurA1_BackToCitadel"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "YashaQ01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "YashaQ02", Tag = "pl_HumanHeroYasha"},
			FigureOutcry	{TextTag = "YashaQ03", Tag = "pl_HumanHeroYasha"},
			QuestSetActive	{Quest = "HeroYasha_Talk"},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "SQYasha_Location", Direction = 0, Tag = "SQYasha_LocationFX"},
		},
		GotoState = "TalkToMeAlone",
	};
}

State
{
	StateName = "TalkToMeAlone",

	OnToggleEvent
	{
		EventName = "HeroYasha_DialogEnable",
		OnConditions = 
		{
			QuestIsActive	{Quest = "HeroYasha_Talk"},
			FigureIsAlive	{Tag = "pl_HumanHeroYasha"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "SQYasha_Location", Range = iLocationRange},
			
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQYasha_Location", Range = iOthersRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQYasha_Location", Range = iOthersRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQYasha_Location", Range = iOthersRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "SQYasha_Location", Range = iOthersRange},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQYasha_Location", Range = iOthersRange},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest	{Tag = "pl_HumanHeroYasha"},
			DialogSetEnabled	{Tag = "pl_HumanHeroYasha"},
			MapFlagSetFalse	{Name = "mf_SQYasha_MapChangeDetected"},
		},
		OffConditions = 
		{
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "SQYasha_Location", Range = iLocationRange + 0.5},
				FigureIsDead	{Tag = "pl_HumanHeroYasha"},

				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQYasha_Location", Range = iOthersRange},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQYasha_Location", Range = iOthersRange},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQYasha_Location", Range = iOthersRange},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "SQYasha_Location", Range = iOthersRange},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQYasha_Location", Range = iOthersRange},
				MapFlagIsTrue	{Name = "mf_SQYasha_MapChangeDetected"},
			},
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_SQYasha_MapChangeDetected"},
			DialogSetDisabled	{Tag = "pl_HumanHeroYasha"},
			DialogSetDisabled	{Tag = "pl_HumanHeroYasha_DEAD"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "HeroYasha_Talk"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "SQYasha_LocationFX"},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
