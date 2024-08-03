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
			DialogTypeSetSideQuest {Tag = "DarioGrey"},
			DialogSetEnabled {},
		},
	},
}