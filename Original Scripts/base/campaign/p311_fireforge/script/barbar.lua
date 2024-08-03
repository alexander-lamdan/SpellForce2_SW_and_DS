State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "State1",
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
	StateName = "State1",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{			
			DialogSetEnabled{},
			DialogTypeSetMainQuest{},
		},
	},

	-- Walk aus dem Dialog nach hierhin ausgelagert...
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartBarbQuest"},
		},
		Actions = 
		{			
			FigureWalk	   {Tag  = "Barbar", X = 238, Y = 147},
		},
	},
	
};

