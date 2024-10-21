-- Einschalten des Dialoges, wenn Professor Drehlein Mauser erschossen hat
State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "SearchPortalStone"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_MicerAlive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FightingBear1"},
			FigureIsDead {Tag = "FightingBear2"},
			FigureIsDead {Tag = "FightingBear3"},
		},
		Actions =
		{
			FigureTeamTransfer {Team = "tm_Undead"}
		}
	}
	
}