

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
		},
		GotoState = "DisableDialog"
	},
}

State
{
	StateName = "DisableDialog",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetDisabled{},
		},
		GotoState = "WaitForDialog"
	},
}


State
{
	StateName = "WaitForDialog",
	

	OnOneTimeEvent
	{
		-- wenn man mit dem Kommandanten gesprochen hat
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CommanderDialogEndedTroopsGiven"},
		},
		-- anschalten
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		GotoState = "WaitForDialogEnd"
	},

}

	
State
{
	StateName = "WaitForDialogEnd",
	
	OnOneTimeEvent
	{
		-- wenn der Spieler mit Ragna gesprochen hat
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_PlayerGotTowerInfo"},
		},
		-- beginnt der Forschungszyklus
		Actions =
		{
		},
		GotoState = "RunningAround"
	},
}

State
{
	StateName = "RunningAround",
	
	
	OnIdleRunHomeFake
	{
		X = 205.602,
		Y = 214.048, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 1},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	


	OnIdleRunHomeFake
	{
		X = 199,
		Y = 260,
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 2},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	
	OnIdleRunHomeFake
	{
		X = 240.224,
		Y = 254.656, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 3},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};

	OnIdleRunHomeFake
	{
		X = 256.469,
		Y = 314.719, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 4},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	
	OnIdleRunHomeFake
	{
		X = 198.313,
		Y = 317.749, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 5},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	
	OnIdleRunHomeFake
	{
		X = 191.379,
		Y = 345.38, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 6},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	
	OnIdleRunHomeFake
	{
		X = 295,
		Y = 216,
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_LastStoneFound", Value = 7},
			MapFlagIsFalse {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureOutcry {TextTag = "RagnaResearch14", Tag = "Ragna"},	
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
		},
		GotoState = "EndPart"
	},	
}  


State
{
	StateName = "EndPart",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS04Ended"},
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},
}                                                                      