gtSpawnCoords =
{
	-- Die Koordinaten, an denen die Untoten im UndeadCamp respawnen
	
	[1] = { X = 47.5378, Y = 667.469 },
	[2] = { X = 45.1942, Y = 664.704 },
	[3] = { X = 46.2226, Y = 666.108 },
 	[4] = { X = 48.0017, Y = 668.594 },
 	[5] = { X = 50.1333, Y = 253.166 },
} 
  
  
  
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_UndeadQuestGiven"},
			AvatarValueIsGreater {Name = "av_P204_UndeadCampKillCounter", Value = (ISpawnWhen)-1},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainUndeadScript"
	},
}

State
{
	StateName = "MainUndeadScript",
   
   
   ----- VERSCHIEDENE RESPAWN-EVENTS FÜR PT 1 / 2 / 3
   ----- Je nach Part sind die Respawn-Zeiten anders
   
   OnFigureRespawnEvent
	{
		WaitTime = 50,
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions = 
		{
			AND
			{
				AvatarFlagIsFalse{Name = "af_P304_FirstReturnToGoldenFields"},
				AvatarFlagIsFalse{Name = "af_P304_SecondReturnToGoldenFields"},
				-- BEI GOLDEN FIELDS PT. 1
				
				AvatarValueIsLess {Name = "av_P204_UndeadCampKillCounter", Value = 30},
				-- diese Abfrage ist drin, weil im Questscript auf 30 Kills abgefragt wird 
				EntityValueIsLess {Name = "ev_IDiedSoOften", Value = (ISpawnUntil)+1},
			},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			EntityValueAdd	{Name = "ev_IDiedSoOften", Value = 1},
			AvatarValueAdd {Name = "av_P204_UndeadCampKillCounter", Value = 1},
		},
	};
	
	
	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions = 
		{
			AND
			{
				AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
				AvatarFlagIsFalse{Name = "af_P304_SecondReturnToGoldenFields"},
				-- BEI GOLDEN FIELDS PT. 2
				
				AvatarValueIsLess {Name = "av_P204_UndeadCampKillCounter", Value = 30},
				-- diese Abfrage ist drin, weil im Questscript auf 30 Kills abgefragt wird 
				EntityValueIsLess {Name = "ev_IDiedSoOften", Value = (ISpawnUntil)+1},
			},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			EntityValueAdd	{Name = "ev_IDiedSoOften", Value = 1},
			AvatarValueAdd {Name = "av_P204_UndeadCampKillCounter", Value = 1},
		},
	};
	
	
	OnFigureRespawnEvent
	{
		WaitTime = 15,
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions = 
		{
			AND
			{
				AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
				AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
				-- BEI GOLDEN FIELDS PT. 3
				
				AvatarValueIsLess {Name = "av_P204_UndeadCampKillCounter", Value = 30},
				-- diese Abfrage ist drin, weil im Questscript auf 30 Kills abgefragt wird 
				EntityValueIsLess {Name = "ev_IDiedSoOften", Value = (ISpawnUntil)+1},
			},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			EntityValueAdd	{Name = "ev_IDiedSoOften", Value = 1},
			AvatarValueAdd {Name = "av_P204_UndeadCampKillCounter", Value = 1},
		},
	};



  ------------------------------------------------------------------------------------------
  
  
   OnIdleGoHomeFake
   {
   		X = GetEntityX(),
   		Y = GetEntityY(),
   		Conditions = 
   		{
   		},
   		Actions = 
		{
		},
   },

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsGreaterOrEqual {Name = "av_P204_UndeadCampKillCounter", Value = 30},
		},
  		Actions =
  		{
  			FigureKill{Tag = "default"},
  		},
  		-- Alle restlichen Untoten sterben, sobald der Spieler 30 von ihnen umgehauen
  		-- hat
  	},
   
};
