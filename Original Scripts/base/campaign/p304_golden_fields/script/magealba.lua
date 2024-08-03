
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
			AvatarFlagIsTrue{Name = "af_P304_AlyreKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	
		-- sobald Alyre KNOWN ist wird Alba freigeschaltet
	},  
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			QuestIsActive{Quest = "LootFiveStoneHearts"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	
		-- sobald Alba den Task hat, die Herzen zu looten, wird Alba abgeschaltet
	},  
    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "BringHeartsToAlba"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die Herzen zu Alba bringen soll
    },
    
   
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler SOWOHL Task gesolved hat als auch Delivery abgegeben hat
    -- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ALBAS TASK SCHON HAT!!!
                                                                      
};                                                                         