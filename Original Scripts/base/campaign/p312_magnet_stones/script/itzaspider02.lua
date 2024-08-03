
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
			FigureTeamTransfer {Tag = "ItzaSpider02", Team = "tm_Creep"},
		}
	},
	
}