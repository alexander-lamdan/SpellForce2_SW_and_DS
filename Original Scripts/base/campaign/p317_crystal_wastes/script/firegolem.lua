
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
			FigureOutcry	{TextTag = "IceShyFoeFound", Tag = "pl_HumanNightsong"},
		},
	},
  	
}
