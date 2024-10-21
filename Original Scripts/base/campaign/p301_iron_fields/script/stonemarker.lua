State
{
	StateName = "FuckEffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ShowStoneMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "StoneMarker", ObjectId = 1336},
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
			MapFlagIsFalse {Name = "mf_ShowStoneMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "StoneMarker", ObjectId = 1335},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
