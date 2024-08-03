

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
	},

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	},
    
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_AlastarKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Alastar KNOWN ist
		-- wird Galius freigeschaltet
	},       
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "DeliveryGalius"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die Delivery-Quest hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "BringHerbsToGalius"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die Kräuter-Quest hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsSolved{Quest = "BringHerbsToGalius"},
    		QuestIsNotKnown{Quest = "DeliveryGalius"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Kräuter-Quest gelöst hat, aber noch nichts von Delivery weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER GALIUS TASK SCHON HAT!!! 
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringHerbsToGalius"},
    		QuestIsNotActive{Quest = "DeliveryGalius"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den Auftrag hat, die Kräuter zu suchen und nichts von der Lieferung weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER GALIUS TASK SCHON HAT!!! 
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringHerbsToGalius"},
    		QuestIsSolved{Quest = "DeliveryGalius"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die "Delivery"-Quest gelöst hat, aber noch nichts von Kräuterrückgabe weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER GALIUS TASK SCHON HAT!!! 
    },
    
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
			OR
			{
				MapFlagIsTrue{Name = "mf_NoPacketForGalius"},
				QuestIsSolved{Quest = "DeliveryGalius"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler SOWOHL Task gesolved hat als auch Delivery abgegeben hat
    -- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER GALIUS TASK SCHON HAT!!! 
    
                                                                      
};                                                                                 