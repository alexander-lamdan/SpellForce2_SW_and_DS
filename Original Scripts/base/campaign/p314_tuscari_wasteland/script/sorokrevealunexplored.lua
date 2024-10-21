





State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_TalkedWithSorok"},
			-- sobald mit Sorok gesprochen und eine Entscheidung getroffen wurde
		},
		Actions =
		{
    		 EntityTimerStart{Name = "et_RevealTimer"},
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{	
			FogOfWarTeamAdd	{Team = "tm_Team1"},
		},
		-- Zur Sicherheit wird Team 1 nochmal ins FOWAdd reingenommen
	},
	
-- 	OnEvent
--    {
--    	Conditions = 
--    	{	
--    		EntityTimerIsElapsed {Name = "et_RevealTimer", Seconds = 10},
--    	 },
--    	Actions = 
--    	{
--    		 FogOfWarRevealAtEntity	{Tag = "Sorok", Range = 20, Height = default},
--    		 EntityTimerStart{Name = "et_RevealTimer"},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			OR
--			{
--				FigureIsDead{Tag = "Sorok"},
--				AvatarFlagIsTrue{Name = "af_P314_SorokMissionFulfilled"},
--			},
--		},
--		Actions =
--		{
--		},
--		GotoState = "DeadState"
--	},
--	
}
