
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
		Conditions =
		{
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
	}, -- zu Beginn der Karte kriegt er Dialog abgenommen

    
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P314_CS02Finished"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
	}, -- sobald OrcCamp befreit, schaltet er Dialog an
    
    
    OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Known"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P314_PioneerTroopsGained"}, 
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
		-- sobald Dialog mit Pionier geführt wurde, wird Dialog
		-- komplett abgeschaltet
	},  
};                                                                            