State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "OpenMe",
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
	StateName = "OpenMe",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},
	};


	
};

