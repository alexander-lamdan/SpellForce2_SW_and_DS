State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "HouseOfGreyLethosApology1"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {Tag = "MyraGrey"},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			DialogSetEnabled {},
		},
	},
}