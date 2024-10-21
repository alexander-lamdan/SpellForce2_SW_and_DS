State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainScript"
	},
}

State
{	
	StateName = "MainScript",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "BringFoliosToAskan"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {Tag = "MagisterAskan"},
			DialogSetEnabled {Tag = "MagisterAskan"},
		},
	},
}