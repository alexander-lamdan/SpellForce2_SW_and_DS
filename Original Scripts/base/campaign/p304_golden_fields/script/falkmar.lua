


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
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald erste Cutscene beendet (König), Dialog anschalten
	},
	
	 OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				EntityFlagIsTrue {Name ="ef_Talked"},
				AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
			},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- sobald mit Falkmar gesprochen ODER sobald zum ersten Mal
		-- nach GF zurückgekehrt, wird Falkmars Dialog weggenommen
	},
	
	

    
    
                                          
};                                                                            