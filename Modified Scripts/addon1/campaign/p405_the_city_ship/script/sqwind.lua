if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroWind"},
			DebugQuestionYes	{Question = "Hero Sidequest von Wind aktivieren?", Caption = "HeroQuest von Wind"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroWind"},
			QuestSetActive	{Quest = "HeroWindDocument"},
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
			QuestIsActive	{Quest = "HeroWindDocument"},
		},
		Actions =
		{
		},
		GotoState = "InRange",
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
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQ_AlchemyTable", Range = 10},
			},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
		},
		Actions =
		{
    		DialogSetEnabled	{Tag = "SQ_AlchemyTable"},
		},
		GotoState = "TalkToAlchemyTable",
	},
};

State
{
	StateName = "TalkToAlchemyTable",
	
    OnEvent
    {
    	Conditions =
    	{
			MapFlagIsTrue	{Name = "mf_SQWind_TalkedToAlchemyTable"},
    	},
    	Actions =
    	{
			MapFlagSetTrue	{Name = "mf_SQWind_SpawnCenwen"},
   		},
		GotoState = "ForceTalkToCenwen",
    },
};

State
{
	StateName = "ForceTalkToCenwen",
	
    OnOneTimeEvent
    {
    	Conditions =
    	{
			FigureIsAlive	{Tag = "SQWind_Cenwen"},
			AvatarIsNotTalking	{},
    	},
    	Actions =
    	{
    		DialogTypeSetSideQuest	{Tag = "SQWind_Cenwen"},
    		DialogSetEnabled	{Tag = "SQWind_Cenwen"},
    		DialogBegin	{Tag = "SQWind_Cenwen"},
   		},
    },

    OnEvent
    {
    	Conditions =
    	{
			MapFlagIsTrue	{Name = "mf_SQWind_TalkedToCenwen"},

			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
    	},
    	Actions =
    	{
			-- Cenwen ist nur kurz (1 Step!) da um die Outcries abzuspielen...
			--NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "SQWind_Cenwen", Level = 30, UnitId = 1196, X = 10, Y = 10, Team = "tm_Neutral"}},
			--FigureVanish	{Tag = "SQWind_Cenwen"},
    		
			--FigureOutcry	{TextTag = "SQWind21", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "SQWind22", Tag = "pl_HumanHeroWind"},
			--FigureOutcry	{TextTag = "SQWind23", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "SQWind24", Tag = "pl_HumanHeroWind"},
			
			QuestSetSolved	{Quest = "HeroWindDocument"},
			QuestSetActive	{Quest = "HeroWindFightNorthWind"},
			QuestSetActive	{Quest = "HeroWindFightWestWind"},
			QuestSetActive	{Quest = "HeroWindFightSouthWind"},
   		},
		GotoState = "CheckRefugeKnown",
    },
};

State	
{
	StateName = "CheckRefugeKnown",
	
    OnEvent
    {
    	Conditions =
    	{
			AvatarFlagIsFalse	{Name = "af_P409_SQWind_RefugeVisited"},
    	},
    	Actions =
    	{
			QuestSetActive	{Quest = "HeroWindFightEastWindRefugeUnknown"},
   		},
		GotoState = "END",
    };
    OnEvent
    {
    	Conditions =
    	{
			AvatarFlagIsTrue	{Name = "af_P409_SQWind_RefugeVisited"},
    	},
    	Actions =
    	{
			QuestSetActive	{Quest = "HeroWindFightEastWind"},
   		},
		GotoState = "END",
    };
};


State	{StateName = "END"};
