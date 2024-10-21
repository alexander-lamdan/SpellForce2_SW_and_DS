State
{
	StateName = "EffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P301_Encounter5Marker"},
		},
		Actions =
		{
			ObjectChange {Tag = "Encounter5Marker", ObjectId = 1592},
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
			MapFlagIsFalse	{Name = "mf_P301_Encounter5Marker"},
		},
		Actions =
		{
			ObjectChange {Tag = "Encounter5Marker", ObjectId = 1591},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
