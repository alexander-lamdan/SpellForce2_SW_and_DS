
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
		}, 	-- zu Beginn sollte sie erstmal abgeschaltet werden
	};       
    
    
   OnOneTimeEvent
   {
   	Conditions =
   	{
   		AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 1},
   	},
   	Actions =
   	{
   		EntityFlagSetFalse{Name ="ef_DialogOff"},
   	},
      -- erst anschalten
		-- sobald Spieler die Warradqueste hat       
    },                                                   

	OnOneTimeEvent                                              
    {                                                           
    	Conditions =                                            
 		{                                                                                                                                   
    		AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 2},                                                 
    	},                                                      
    	Actions =                                               
    	{                                                       
    		EntityFlagSetTrue {Name ="ef_DialogOff"},           
    	}, 	-- sobald Baru ihren Dialog gesprochen hat, wird sie abgeschaltet
    };
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
    	},
    	Actions =
    	{
    		FigureVanish{},
    	},
    },
    
};                                                       