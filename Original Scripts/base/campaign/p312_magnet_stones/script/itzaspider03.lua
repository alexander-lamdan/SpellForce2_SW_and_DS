
State
{
	StateName = "INIT",
	-- Wenn Spieler Rachequest hat werden Lakash und sein Schosshund b�se
	OnFigureSpawnOnlyWhenEvent	
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillItza"},
		},
		Actions = 
		{
			FigureTeamTransfer {Tag = "ItzaSpider03", Team = "tm_Creep"},
		}
	},
	
}