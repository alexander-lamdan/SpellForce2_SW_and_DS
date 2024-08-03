State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "RolfMain",
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
	StateName = "RolfMain",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Actions = 
		{
			FigureOutcry	{Tag = "Rolfe", TextTag = "Rolf1"},
			DialogSetEnabled{},
			DialogTypeSetSideQuest{},			  	
		},
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dog", TargetTag = "RolfPoint",Range = 20}
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_RolfReturns"},
		},
		Actions = 
		{
			MapValueAdd			{Name = "mv_KidsReturned", Value = 1},
			FigureRunToEntity	{Tag = "Rolfe", TargetTag = "Uland"},
		},
	},
	


};