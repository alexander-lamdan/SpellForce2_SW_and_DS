State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			OR
			{
				QuestIsSolved {Quest = "ReturnToTwiddleGF"},
				QuestIsNotKnown {Quest = "SaveLelaFromUnderhall"},
			}
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P309_LelaInGoS"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
}