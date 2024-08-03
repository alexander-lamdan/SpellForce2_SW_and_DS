
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
			FigureTeamTransfer {Tag = "Shar3", Team = "tm_Creep"},
		}
	},
	
}