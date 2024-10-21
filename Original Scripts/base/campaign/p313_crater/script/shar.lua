
State
{
	StateName = "INIT",
	-- Wenn Spieler Rachequest hat werden Shar und sein Schosshund böse
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillShar"},
		},
		Actions = 
		{
			FigureTeamTransfer {Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "Shar2", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "Shar3", Team = "tm_Creep"},
		}
	},
	
}