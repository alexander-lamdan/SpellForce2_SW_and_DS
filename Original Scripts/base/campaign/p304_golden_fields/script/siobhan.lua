
State
{
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive{Quest = "GFLostDeliveries"},
			QuestIsSolved{Quest = "FindTheLostDeliveries"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
	};


	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}


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
			AvatarValueIsEqual
			{Name = "av_P304_DeliveriesDeliveredOrOpened", Value = 6},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
			
		}, 	-- sobald die 6 Deliveries abgegeben oder von Siobhan
		-- geöffnet wurden, wird Siobhan abgeschaltet
	};       
    
    OnIdleGoHomeFake
    {
    	X = 125.395,
		Y = 669.346,
		Range = 8,
		UpdateInterval = 10,
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_ThiefGate01Open"},
    		AvatarValueIsEqual{Name = "av_P304_DeliveriesDeliveredOrOpened", Value = 6},
    	},
    	Actions =
    	{
    	},
    	-- Siobhan geht nach Hause
    };


    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarValueIsLess{Name = "av_P304_DeliveriesDeliveredOrOpened", Value = 6},
    		FigureIsInEntityRange	
    		{TargetTag = "pl_HumanAvatar", Range = 7},
    	},
    	Actions =
    	{
    		FigureOutcry{TextTag = "SiobhanCalls"},
    	},
              
     },                                                        
};                                                                              