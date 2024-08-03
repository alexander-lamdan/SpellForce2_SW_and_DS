State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "IngaMain",
		Conditions = 
		{
			
		},
		Actions = 
		{
			
		},
	};
};

State
{
	StateName = "IngaMain",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Actions = 
		{
			FigureOutcry	{Tag = "Inga", TextTag = "Inga1"},
			DialogSetEnabled{},
			DialogTypeSetSideQuest{},			  	
		},
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "IngaPoint",Range = 20}
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_IngaReturns"},
		},
		Actions = 
		{
			MapValueAdd			{Name = "mv_KidsReturned", Value = 1},
			FigureRunToEntity	{Tag = "Inga", TargetTag = "Uland"},
		},
	},
};