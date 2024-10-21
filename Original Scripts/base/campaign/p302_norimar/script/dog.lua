State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Search",
		Conditions = 
		{
			MapFlagIsTrue    { Name  = "mf_OneEyeFollowsAvatar"},
		},
		Actions = 
		{
		},
	},

};

State
{
	StateName = "Search",
	
	OnFollowEvent
	{
		Tag = "default",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
		},
	},


	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint01", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint02", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint03", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint04", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint05", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint06", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint07", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint08", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint09", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "WuffPoint10", Range = 7,},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Dog1", Tag = "Dog"},		
			SoundGlobalPlayOnce			{File = "06_level/map_no_03_dogbark"},    
		},
	},
	
	
	-- Wenn die Töle stirbt, müssen die Quests für die er gebraucht wird natürlich auf UNSOLVABLE gesetzt werden
	
	OnOneTimeEvent
	{
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "NorimarMuendelSuchen"},
		},                                 
		Conditions =                      
		{                                 
			FigureIsDead {Tag = "Dog"},
			QuestIsActive		{Quest = "NorimarMuendelSuchen"},
		},
	},
	OnOneTimeEvent
	{
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "FindMuendelInga"},
		},                                 
		Conditions =                      
		{                                 
			FigureIsDead {Tag = "Dog"},
			QuestIsActive		{Quest = "FindMuendelInga"},
		},
	},
	OnOneTimeEvent
	{
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "FindMuendelRolf"},
		},                                 
		Conditions =                      
		{                                 
			FigureIsDead {Tag = "Dog"},
			QuestIsActive		{Quest = "FindMuendelRolf"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "GoHome",
		Actions = 
		{
			FigureRunToEntity	 {Tag = "Dog", TargetTag = "Uland"},
		},
		Conditions = 
		{
			QuestIsSolved	{Quest = "FindMuendelInga"},
			QuestIsSolved	{Quest = "FindMuendelRolf"},	
		},
	},
	
};
State
{
	StateName = "GoHome",
};











