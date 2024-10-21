local iLocationRangeMax = 20

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroYasha"},
			DebugQuestionYes	{Question = "Hero Yasha Quest starten?"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroYasha"},
			QuestSetActive	{Quest = "HeroYasha_Archfire"},
		},
	};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroYasha_Archfire"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Source1", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "Source1", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Source2", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "Source2", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Source3", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "Source3", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Source4", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "Source4", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Source5", Range = iLocationRangeMax},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "Source5", Range = iLocationRangeMax},
			},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQYasha1", Tag = "pl_HumanHeroYasha"},
			FigureOutcry	{TextTag = "SQYasha2", Tag = "pl_HumanAvatar"},
		},
		GotoState = "InRange",
	};
}

State
{
	StateName = "InRange",

	OnEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue{Name = "mf_Source1Disabled"},
				MapFlagIsTrue{Name = "mf_Source2Disabled"},
				MapFlagIsTrue{Name = "mf_Source3Disabled"},
				MapFlagIsTrue{Name = "mf_Source4Disabled"},
				MapFlagIsTrue{Name = "mf_Source5Disabled"},
			},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQYasha3", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SQYasha4", Tag = "pl_HumanHeroYasha"},
			FigureOutcry	{TextTag = "SQYasha5", Tag = "pl_HumanAvatar"},
			AvatarItemMiscTake	{ItemId = 402, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P400_GiveHeroAbilityToYasha"},
			QuestSetSolved	{Quest = "HeroYasha_Archfire"},
			QuestSetSolved	{Quest = "HeroYasha"},
		},
		GotoState = "END",
	};
}

State	{StateName = "END"};
