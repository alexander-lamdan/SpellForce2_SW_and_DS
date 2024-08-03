

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
	};
	
	OnIdleGoHomeFake
	{
		X = 446.27, Y = 319.02, 
		Range = 3,
		UpdateInterval = 5,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions = 
		{
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald Rückkehr nach Golden Fields, Einar wieder anschalten
	};
                                          
};                                                                            