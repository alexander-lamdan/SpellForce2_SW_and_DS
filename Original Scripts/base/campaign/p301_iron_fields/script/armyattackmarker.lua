State
{
	StateName = "FuckEffectObject",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ShowArmyAttackMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "ArmyAttackMarker", ObjectId = 1336},
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
			MapFlagIsFalse {Name = "mf_ShowArmyAttackMarker"},
		},
		Actions =
		{
			ObjectChange {Tag = "ArmyAttackMarker", ObjectId = 1335},
		},
		GotoState = "ende",
	},
}

State{StateName = "ende"}
