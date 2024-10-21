State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Reset",
		Conditions = 
		{
			QuestIsActive	{Quest = "SetFlamesToYellow"},
		},
		Actions = 
		{
			DialogSetEnabled		{},
			DialogTypeSetMainQuest 	{},
		},
	},
};
State
{
	StateName = "Reset",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ResetFires"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_ResetFires"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "Disabled",
		Conditions = 
		{
			QuestIsSolved	{Quest = "SetFlamesToYellow"},
		},
		Actions = 
		{
			DialogSetDisabled	{},
		},
	},
};
State
{
	StateName = "Disabled",
};