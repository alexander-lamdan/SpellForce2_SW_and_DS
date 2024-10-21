State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "QuestGive",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	},


};

State
{
	StateName = "QuestGive",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			DialogTypeSetSideQuest{},
			DialogSetEnabled{},
		},
	};


	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name  = "mf_BlameRottgar"},  
				MapFlagIsTrue {Name  = "mf_SolveigSuicide"},
			},  
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_UlandKnows"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name  = "mf_AvaGotReward"},	
		},
		Actions =
		{
			QuestSetSolved {Quest = "TellUlandAboutSolveig"},
		},
		
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 	
		{
			MapFlagIsTrue	{Name = "mf_SetKidsQuestActive"},
		},
		Actions = 	
		{
			--PlayerKitTransfer { PlayerKit = "pk_Dog", Player = "pl_Human"},
			MapFlagSetTrue    { Name  = "mf_OneEyeFollowsAvatar"},
			QuestSetActive	  { Quest = "NorimarMuendelSuchen"},
			QuestSetActive	  { Quest = "FindMuendelInga"},
			QuestSetActive	  { Quest = "FindMuendelRolf"},
			
		},
	},
		
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name  = "mf_AvaGotReward"},	
		},
		Actions = 
		{
			QuestSetSolved {Quest = "NorimarPostbote"},
		},
	},		
--	OnOneTimeEvent
--	{
--Conditions = 
	--	{
	--		MapFlagIsTrue {Name  = "mf_AvaGotReward"},	
		--	MapFlagIsTrue {Name  = "mf_BlameRottgar"},	
--		},
--		Actions = 
--		{
--			--MapFlagSetTrue {Name = "mf_SolveigSolved"},
--		},
--	},	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead		{Tag    = "Dog"},
			QuestIsActive		{Quest  = "NorimarMuendelSuchen" },
		},
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "NorimarMuendelSuchen"},
		},
	},	
};

