

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Torshak", Team = "tm_Neutral"},
		},
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	

	OnIdleRunHomeFake
	{
		X = 104,
		Y = 402,
		Range = 1.5,
		Conditions = 
		{
			EntityFlagIsFalse{Name = "ef_MadeMyOutcry"},
		},
		OneTimeHomeActions = 
		{
			FigureOutcry{TextTag = "Torshak01", Tag = "Torshak"},
			FigureOutcry{TextTag = "Torshak02", Tag = "Torshak"},
			EntityFlagSetTrue{Name = "ef_MadeMyOutcry"},
		},
		-- am Anfang läuft Torshak zum Spieler und macht seinen Outcry
	};
	
	OnIdleRunHomeFake
	{
		X = 92.495,
		Y = 402.587,
		Range = 1.5,
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_MadeMyOutcry"},
			AvatarFlagIsTrue {Name = "af_P314_CS01Finished"},
		},
		OneTimeHomeActions = 
		{
			FigureVanish{Tag = "default"},
		},
		-- nach der Cutscene läuft Torshak zum Portal und verschwindet
	};
	
}                                                