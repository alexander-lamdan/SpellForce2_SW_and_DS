-- Alwin spawnt erst wenn Matricus Dialog ihn freischaltet
State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsSolved {Quest = "RushwaterPart5ReturnToMatricus"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
			EntityFlagSetTrue {Name = "ef_P303_Dialog"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_Dialog"}
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
			QuestIsActive {Quest = "BringMessageToAlwin"},
			QuestIsKnown {Quest = "RushwaterTheIronFalcon"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	}
}