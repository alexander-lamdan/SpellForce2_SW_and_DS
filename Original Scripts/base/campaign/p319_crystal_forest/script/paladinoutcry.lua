


State
{
	StateName = "Main",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{TargetTag = "pl_HumanAvatar", Range = 15},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_OutcryTimer"},
		}, 
	},
	
	OnOneTimeEvent
	{
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_OutcryTimer", Seconds = 0},
			},
			Actions =
			{
				FigureOutcry{TextTag = "Defense01", Tag = "pl_HumanAvatar"},
			},
	},
	
	OnOneTimeEvent
	{
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_OutcryTimer", Seconds = 5},
			},
			Actions =
			{
				FigureOutcry{TextTag = "Defense02", Tag = "PaladinOutcry"},
			},
	},
	
}