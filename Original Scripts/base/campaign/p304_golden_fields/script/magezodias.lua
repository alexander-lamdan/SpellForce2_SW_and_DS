
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
			AvatarFlagIsTrue{Name = "af_P304_AlyreKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Alyre KNOWN ist
		-- wird Zodias freigeschaltet
	},    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "DeliveryZodias"},
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
    		QuestIsActive{Quest = "BringFungiToZodias"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die Pilz-Quest hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsSolved{Quest = "BringFungiToZodias"},
    		QuestIsNotKnown{Quest = "DeliveryZodias"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Pilz-Quest gelöst hat, aber noch nichts von Delivery weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ZODIAS' TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringFungiToZodias"},
    		QuestIsNotActive{Quest = "DeliveryZodias"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den Auftrag hat, die Pilze zu suchen und nichts von der Lieferung weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ZODIAS' TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "BringFungiToZodias"},
    		QuestIsSolved{Quest = "DeliveryZodias"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die "Delivery"-Quest gelöst hat, aber noch nichts von Pilzrückgabe weiß
    	-- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ZODIAS' TASK SCHON HAT!!!
    },
    
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskGiven"},
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
			OR
			{
				MapFlagIsTrue{Name = "mf_NoPacketForZodias"},
				QuestIsSolved{Quest = "DeliveryZodias"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler SOWOHL Task gesolved hat als auch Delivery abgegeben hat
    -- GRUNDSÄTZLICH: ES WIRD NUR ABGESCHALTET, FALLS DER SPIELER ZODIAS' TASK SCHON HAT!!!
                                                                      
};                                                                         