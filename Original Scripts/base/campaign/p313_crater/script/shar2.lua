
State
{
	StateName = "INIT",
	-- Wenn Spieler Rachequest hat werden Shar und sein Schosshund b�se
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillShar"},
		},
		Actions = 
		{
			FigureTeamTransfer {Tag = "Shar2", Team = "tm_Creep"},
		}
	},
	
}