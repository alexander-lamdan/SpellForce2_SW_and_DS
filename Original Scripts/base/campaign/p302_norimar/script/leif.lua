State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "LeifMain",
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
	StateName = "LeifMain",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "NorimarPostbote"},
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetSideQuest{},			  
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "NorimarPostbote"},
		},
		Actions =
		{
			DialogSetDisabled {},
		},
	},
};
