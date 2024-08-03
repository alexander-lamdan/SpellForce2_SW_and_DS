
State
{
	StateName = "MainState",
	


	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive{Quest = "CrystalForestPart2TheLab"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- anschalten, sobald Spieler die Quest hat
	};
	
    
	
	-- wird im Dialog selbst abgeschaltet
	 
                                          
};                                                                            
    
    
    
    
    