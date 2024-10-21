State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		-- Wen der Outcry kam, dass der Titan gespawnt wurde und der Spieler zurückkommen soll in die Festung erscheint Schattenlied
		Conditions =
		{
			
		},
		Actions =
		{
			FigureTeleportToEntity {TargetTag = "pl_HumanNightsong"},
		},
		NoSpawnEffect = true
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndWeaponCS"},
		},
		Actions = 
		{
			FigureTeleportToEntity {TargetTag = "pl_HumanNightsong"},
			FigureTeamTransfer	{Tag = "SQWarrior_Archon", Team = "tm_Team1"},
			FigurePlayerTransfer {},
		}
	}
	
}