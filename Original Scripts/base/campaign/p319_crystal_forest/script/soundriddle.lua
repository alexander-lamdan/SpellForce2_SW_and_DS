
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

	
---	OnOneTimeEvent
---	{
---		Conditions = {},
---		Actions = 
---		{
---			EntityFlagSetTrue {Name ="ef_DialogOff"},
---		}, -- zu Beginn der Karte Dialog abschalten
---	};
---    
    
    
    OnOneTimeEvent                                    
{                                                 
	Conditions = 
	{
		AvatarFlagIsTrue{Name = "af_P319_SoundRiddleSolved"}, 	
	},                              
	Actions =                                     
	{                                             
		EntityFlagSetTrue {Name ="ef_DialogOff"}, 
	}, -- nachdem man das SoundRiddle gelöst hat
};                                                

                                          
};                                                                            
    
    
    
    
    