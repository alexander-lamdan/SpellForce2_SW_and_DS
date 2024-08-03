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
			OR
			{
				MapFlagIsTrue	{Name = "mf_Yasha_Spawn"},
				QuestIsActive {Quest = "DraghLurA1_DefeatYsha"},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_YshaAlive"},
			FigureRun {X = 400, Y = 46},
			FogOfWarReveal {X = 400, Y = 46, Range = 7},
		},
	},
}