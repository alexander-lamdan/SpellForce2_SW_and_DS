

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
		-- sobald Spieler mit Schlüssel aufgeschlossen hat, wird Dialog abgeschaltet
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_LockOpened"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_DialogOff"},
			MapFlagSetTrue{Name = "mf_SpawnCryptos"},
		}, 
	};

                                          
};                                                                            