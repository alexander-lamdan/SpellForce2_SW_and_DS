
State
{
	StateName = "MainState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_DialogUrEnded"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OutcriesUr"},
		},
	
	},
	
};