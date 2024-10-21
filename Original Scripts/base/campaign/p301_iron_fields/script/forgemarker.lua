State
{
	StateName = "FuckEffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ShowForgeMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "ForgeMarker", ObjectId = 1336},
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
			MapFlagIsFalse {Name = "mf_ShowForgeMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "ForgeMarker", ObjectId = 1335},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
