
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
			DialogTypeSetSideQuest{},
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
			QuestIsActive {Quest = "OpenChestOrLetItOpen"},	
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
		-- Dialog geht an, sobald der Spieler die Sidequest hat
	};
	
	 OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsSolved{Quest = "OpenChestOrLetItOpen"},
				MapFlagIsTrue{Name = "mf_JorgesChestIsOpen"},
			}	
		},
		Actions = 
		{
			EntityFlagSetTrue{Name ="ef_DialogOff"},
		}, -- Sobald die Kiste von Firmin oder vom Spieler selbst geöffnet wurde
	};
                                                                      
};                                                                                 