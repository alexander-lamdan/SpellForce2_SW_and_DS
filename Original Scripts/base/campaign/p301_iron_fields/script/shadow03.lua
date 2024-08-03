State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = false,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_Shadow_Spawn_Attack"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Team2"},
		},
	},
};