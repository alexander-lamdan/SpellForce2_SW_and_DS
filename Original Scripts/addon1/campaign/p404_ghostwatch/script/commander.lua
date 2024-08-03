

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
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	


	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name = "ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name = "ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	
	OnOneTimeEvent
	{
		-- zu Beginn der Karte Dialog abschalten
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_DialogOff"},
		}, 
	};
    OnOneTimeEvent
	{
		-- sobald Spieler die Quest hat, die Empyria-Truppen zu suchen, anschalten
		Conditions = 
		{
			QuestIsKnown{Quest = "Ghostwatch_SearchEmpyriaTroops"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name = "ef_DialogOff"},
		}, 
	};
  	OnOneTimeEvent
	{
		-- sobald Spieler mit Commander gesprochen hat, wird er wieder abgeschaltet
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_CommanderDialogEndedTroopsGiven"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_DialogOff"},
		}, 
	};

                                          
};                                                                            