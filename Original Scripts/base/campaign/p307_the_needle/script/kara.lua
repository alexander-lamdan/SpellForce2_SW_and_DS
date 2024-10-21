

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
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 
		-- zu Beginn ausschalten
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsKnown {Quest = "StormBulwark"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 
		-- später anschalten
	},
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_DialogState", Value = 2},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	
	};         
    
    
    OnIdleRunHomeFake
	{
		X = 564.213,
		Y = 263.347,
		-- Koordinaten des Eingangsportals
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
			AvatarIsNotTalking{},
			GameInterfaceIsVisible{},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureVanish{},
		},
	};

  
                                                                      
};                                                                               