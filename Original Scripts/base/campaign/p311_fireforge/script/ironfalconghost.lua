State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name =  "mf_P311_PlayerHasIronFalconShield"},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "LegionnaireGhost", Team = "tm_LegionnaireGhost"},
			MapFlagSetTrue {Name = "mf_P311_IronFalconGhostSpawned"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "LegionnaireGhost"},
			MapFlagIsTrue {Name = "mf_P311_IronFalconGhostSpawned"}
		},
		Actions =
		{
			FigureTeamTransfer {Team = "tm_Neutral"},
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		}
	}
}