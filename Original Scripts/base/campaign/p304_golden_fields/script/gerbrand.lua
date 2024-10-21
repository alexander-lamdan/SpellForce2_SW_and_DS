
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
    		OR
			{
				EntityFlagIsTrue {Name ="ef_TalkedWithMe"},
				AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
			},
			-- entweder wenn der Avatar mit Gerbrand gesprochen hat
			-- oder sobald die erste Cutscene fertig ist
			-- wird Gerbrands Dialog disabled
    	},
    	Actions =
    	{
    		EntityFlagSetTrue {Name ="ef_DialogOff"},
    	},
    },
	                     
};                                                                                        