State
{
	StateName = "FuckEffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ShowSilverMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "SilverMarker", ObjectId = 1336},
		},
		GotoState = "on",
	},
}

State
{
	StateName = "on",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_ShowSilverMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "SilverMarker", ObjectId = 1335},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
