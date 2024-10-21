

State
{
	StateName = "MainScript",

  
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "pl_HumanAvatar", Range = 15 },
		},
		Actions =
		{
			FigureOutcry{TextTag = "FireShyFoeFound", Tag = "pl_HumanNightsong"},
		},
	},
  	
}
