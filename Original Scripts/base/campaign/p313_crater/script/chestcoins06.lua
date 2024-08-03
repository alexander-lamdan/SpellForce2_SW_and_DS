
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
		Conditions =
		{
		},
		Actions =
		{
			EntityValueSet{Name = "ev_Bars", Value = 3},
		},
		-- Kiste ist zu Beginn durch fünf Riegel gesichert
	},
	
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_Opened"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- sobald genug Münzen eingeworden
		-- wird Dialog weggenommen
	};       
    
                                                                      
};                                                                              