--
--State
--{
--	StateName = "OrogBurnerSpawn",
--	OnFigureRespawnEvent
--	{
--		WaitTime = 1,
--		X = GetEntityX(),
--		Y = GetEntityY(),
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = 6},
--			MapFlagIsTrue {Name = "mf_TzangAlive"},
--			MapFlagIsFalse {Name = "mf_OrogLight04On"},
--			MapTimerIsElapsed	{Name = "mt_Burner04generateTimer", Seconds = 90},
--			FigureIsAlive	{Tag = "Orog"},
--		},
--		Actions = 
--		{
--			FigureForcedWalk	{X = OrogLight04X, Y = OrogLight04Y},
--		},
--		DeathActions = 
--		{
--			MapTimerStop	{Name = "mt_Burner04generateTimer"},
--			MapTimerStart	{Name = "mt_Burner04generateTimer"},
--		},
--	},
--};
