State
{
	StateName = "Outcries",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "TravelActivator", Range = 15},
		},
		Actions = 
		{
			FigureOutcry {Tag = "default", TextTag = "JourneyStone01"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone02"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone03"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone04"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone05"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone06"},
			FigureOutcry {Tag = "default", TextTag = "JourneyStone07"},
		},
	},
	
	
};

