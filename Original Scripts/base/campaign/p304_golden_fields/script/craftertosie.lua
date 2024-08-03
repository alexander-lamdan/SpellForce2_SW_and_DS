
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
			AvatarFlagIsTrue{Name = "af_P304_CardoganKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Cardogan KNOWN ist
		-- wird Tosie freigeschaltet
	}, 
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "DeliveryTosie"},
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
    		QuestIsActive{Quest = "ReportTosie"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die MonsterQuarry-Quest hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsSolved{Quest = "ReportTosie"},
    		QuestIsNotKnown{Quest = "DeliveryTosie"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die MonsterQuarry-Quest gelöst hat, aber noch nichts von Delivery weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER TOSIES TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "ReportTosie"},
    		QuestIsNotActive{Quest = "DeliveryTosie"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den MonsterQuarry-Auftrag hat und nichts von der Lieferung weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER TOSIES TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "ReportTosie"},
    		QuestIsSolved{Quest = "DeliveryTosie"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die "Delivery"-Quest gelöst hat, aber noch nichts von MonsterQuarry-Schlußreport weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER TOSIES TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
			OR
			{
				MapFlagIsTrue{Name = "mf_NoPacketForTosie"},
				QuestIsSolved{Quest = "DeliveryTosie"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler SOWOHL Task gesolved hat als auch Delivery abgegeben hat
    -- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER TOSIES TASK SCHON HAT!!!
                                                                                                                                                 
};                                                                            