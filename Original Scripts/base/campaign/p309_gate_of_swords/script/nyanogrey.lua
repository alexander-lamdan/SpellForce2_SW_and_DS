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
			DialogTypeSetSideQuest {Tag = "NyanoGrey"},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "HouseOfGreyReturnToNyano"},
		},
		Actions =
		{
			DialogSetEnabled {},
		},
	},
}