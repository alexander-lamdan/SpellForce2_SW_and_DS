
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
			AvatarFlagIsTrue{Name = "af_P304_AlwaysTrue"}, 	
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- Evtl. erst anschalten, sobald die Räuber im Lager
		-- gekillt wurden
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_LostDeliveriesFound"},	
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- Nachdem man die Delveries erhalten hat
		-- Dialog abschalten
	};
                                                                      
};                                                                                 