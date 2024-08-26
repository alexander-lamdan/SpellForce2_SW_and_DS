if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroWisper"},
			DebugQuestionYes	{Question = "Hero Sidequest von Whisper aktivieren?", Caption = "HeroQuest von Whisper"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroWisper"},
			QuestSetActive	{Quest = "HeroWisperSealSecret"},
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
			QuestIsActive	{Quest = "HeroWisperSealSecret"},
		},
		Actions =
		{
		},
		GotoState = "InRange"
	},
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
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQ_AlchemyTable", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQ_AlchemyTable", Range = 10},
			},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			GateIsOpen	{Tag = "Door02"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQWisper1", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper2", Tag = "pl_HumanHeroWhisper"},
			
			QuestSetSolved	{Quest = "HeroWisperSealSecret"},
			QuestSetActive	{Quest = "HeroWisperSealExamine"},
			
			EntityTimerStart	{Name = "et_EnableAlchemyTable"},
		},
		GotoState = "LeverEnable"
	},
}

State
{
	StateName = "LeverEnable",
	
    OnEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_SQWisper_TalkedToAlchemyTable"},
    	},
    	Actions =
    	{
   		},
		GotoState = "TalkedToTable"
    },

    OnEvent
    {
    	Conditions =
    	{
			EntityTimerIsElapsed	{Name = "et_EnableAlchemyTable", Seconds = 18},
    	},
    	Actions =
    	{
    		DialogSetEnabled	{Tag = "SQ_AlchemyTable"},
   		},
		GotoState = "TalkedToTable"
    },
};

State
{
	StateName = "TalkedToTable",
	
    OnEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_SQWisper_TalkedToAlchemyTable"},
    		
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
    	},
    	Actions =
    	{
			FigureOutcry	{TextTag = "SQWisper11", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper12", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper13", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper14", Tag = "pl_HumanHeroWind"},
			
			QuestSetSolved	{Quest = "HeroWisperSealExamine"},
			QuestSetActive	{Quest = "HeroWisperGraveSearch"},
   		},
		GotoState = "END"
    },
};


State	{StateName = "END"};
