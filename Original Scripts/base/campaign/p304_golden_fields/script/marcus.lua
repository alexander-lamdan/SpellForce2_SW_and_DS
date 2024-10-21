State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyDarioDelivery"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P304_MarcusAngry"}
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Marcus", Team = "tm_Team2"}
		},
	}
}