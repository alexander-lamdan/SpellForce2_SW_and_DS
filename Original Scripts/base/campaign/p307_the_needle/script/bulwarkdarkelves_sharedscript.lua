
State
{
	StateName = "MainScript",

   
	OnFigureRespawnEvent
		{
			WaitTime = 30,
			X = 548.88,
			Y = 499.191,
			Conditions = 
			{
				--AvatarFlagIsFalse{Name = "af_P307_PlayerEnteredBulwark"},
				EntityTimerIsNotElapsed{Name = "et_StopRespawningAfterPlayerEntered", Seconds = 15},
				AvatarFlagIsFalse{Name = "af_P307_CampBulwarkBusted"},
				--FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 6, X = 537, Y = 447},
				--FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 6, X = 608, Y = 387},
				-- nur solange respawnen, solange der Ava noch nicht das Bulwark
				-- erreicht hat
			},
			Actions = 
			{
			},
			DeathActions = 
			{
			},
			-- Figur respawnt am Bindstone
		}; 
  
  	OnOneTimeEvent
  	{
  		Conditions =
  		{
  			AvatarFlagIsTrue{Name = "af_P307_PlayerEnteredBulwark"},
  		},
  		Actions =
  		{
  			EntityTimerStart{Name = "et_StopRespawningAfterPlayerEntered"},
  		},
  		-- 15 Sekunden spawnen die Einheiten noch nach (Vorschlag von Jonas, Bug 22515)
  	},
  
	OnIdleGoHomeFake
  	{
  		UpdateInterval = 30,
  		X = GetEntityX(), Y = GetEntityY(),
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = "af_P307_CS01Finished"},
  		},
  		Actions = 
			{
			},
  	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_DarkElvesGetAggro"},
		},
		Actions =
		{
			FigureTeamTransfer	{Team = "tm_Team3Darkelves"},
		},
	},
  
   
};
