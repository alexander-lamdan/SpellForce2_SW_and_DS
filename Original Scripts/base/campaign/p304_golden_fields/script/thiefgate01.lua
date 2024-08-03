
State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarFlagIsTrue{Name = "af_P304_ThiefQuestGiven"},
				AvatarValueIsEqual{Name = "av_P304_DeliveriesDeliveredOrOpened", Value = 5},
			},
			-- Tor öffnet sich, wenn man Diebesquest hat oder wenn Siobhan nach Hause geht 
		},
		Actions =
		{
			GateSetOpen	{Tag = "ThiefGate01"},
			MapFlagSetTrue {Name = "mf_ThiefGate01Open"},
		},
	},
	
}
