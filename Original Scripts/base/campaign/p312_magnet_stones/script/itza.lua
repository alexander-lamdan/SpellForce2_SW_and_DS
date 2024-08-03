
State
{
	StateName = "INIT",
	-- Wenn Spieler Rachequest hat werden Lakash und sein Schosshund böse
	OnFigureSpawnOnlyWhenEvent	
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillItza"},
		},
		Actions = 
		{
			FigureTeamTransfer {Team = "tm_Creep"},
		}
	},
	
}