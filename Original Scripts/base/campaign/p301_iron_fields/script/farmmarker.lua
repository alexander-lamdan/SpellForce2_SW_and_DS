State
{
	StateName = "FuckEffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ShowFarmMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "FarmMarker", ObjectId = 1336},
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
			MapFlagIsFalse	{Name = "mf_ShowFarmMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "FarmMarker", ObjectId = 1335},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
