State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRange {Tag = "pl_HumanAvatar",    X = 519, Y =  205, Range = 12},
				FigureIsInRange {Tag = "pl_HumanHeroBor",   X = 519, Y =  205, Range = 12},
				FigureIsInRange {Tag = "pl_HumanHeroLya",   X = 519, Y =  205, Range = 12},
				FigureIsInRange {Tag = "pl_HumanNightsong", X = 519, Y =  205, Range = 12},
			},
		},
		Actions = 
		{
			FigureRun	{Tag = "default", X = 519, Y = 205},
		},
		
	},
};

