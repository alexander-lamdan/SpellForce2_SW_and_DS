
State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			TimeIsBetween{StartHour = 6, EndHour = 20},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			TimeIsNotBetween{StartHour = 6, EndHour = 20},
			MapValueIsGreater{Name = "mv_TalkWithLemuel", Value = 2},
			-- erst abschalten, sobald Spieler zum ersten Mal die Cashbag-Quest hat
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};
    
    
                                                                      
};                                                                              