State
{
	StateName = "Vanish",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue  	{Name = "af_P300_HedwigOnWestguard"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hedwig"},
		},
	},


};

