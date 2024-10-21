State
{
	StateName = "EffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P301_Encounter4Marker"},
		},
		Actions =
		{
			ObjectChange {Tag = "Encounter4Marker", ObjectId = 1592},
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
			MapFlagIsFalse	{Name = "mf_P301_Encounter4Marker"},
		},
		Actions =
		{
			ObjectChange {Tag = "Encounter4Marker", ObjectId = 1591},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
