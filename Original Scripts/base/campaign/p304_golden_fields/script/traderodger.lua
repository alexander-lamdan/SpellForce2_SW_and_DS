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
			AvatarFlagIsTrue{Name = "af_P304_LaudiniaKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Laudinia KNOWN ist
		-- wird Odger freigeschaltet
	};       
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "DeliveryOdger"},
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
    		QuestIsActive{Quest = "BringSilkToOdger"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die Seide-Quest hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsSolved{Quest = "BringSilkToOdger"},
    		QuestIsNotKnown{Quest = "DeliveryOdger"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Seide-Quest gelöst hat, aber noch nichts von Delivery weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ODGERS TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringSilkToOdger"},
    		QuestIsNotActive{Quest = "DeliveryOdger"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den Auftrag hat, die Seide zu suchen und nichts von der Lieferung weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ODGERS TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringSilkToOdger"},
    		QuestIsSolved{Quest = "DeliveryOdger"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die "Delivery"-Quest gelöst hat, aber noch nichts von Seidenrückgabe weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ODGERS TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
			OR
			{
				MapFlagIsTrue{Name = "mf_NoPacketForOdger"},
				QuestIsSolved{Quest = "DeliveryOdger"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler SOWOHL Task gesolved hat als auch Delivery abgegeben hat
    -- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ODGERS TASK SCHON HAT!!!
                                                                     
};                                                                            