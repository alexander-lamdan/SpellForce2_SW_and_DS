
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
			AvatarFlagIsTrue{Name = "af_P304_RedmundKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Redmund KNOWN ist
		-- wird Falida freigeschaltet
	},  
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "ReportFalida"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den Ogertask hat, aber noch nicht 10 Oger gekillt hat
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "ReportFalida"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler den gelungenen Ogermord reporten soll
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			QuestIsActive{Quest = "LieToFalida"},
    			QuestIsActive{Quest = "BringPlanToFalida"},
    		},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler entweder Falida anlügt oder ihr den Plan bringt
    },
    
    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_Task02Given"},
    		QuestIsNotKnown{Quest = "LieToFalida"},
    		QuestIsNotKnown{Quest = "BringPlanToFalida"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Ermittlungsquest erhalten hat, aber noch weder den Auftrag
    	-- hat, Falida den Plan zu bringen noch sie anzulügen
    },
    
    
    OnOneTimeEvent
    {
    	Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_TaskSolved"},
			EntityFlagIsTrue{Name = "ef_Task02Solved"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
    },
    -- wenn Spieler BEIDE Tasks gesolved hat, ganz abschalten
    
                                                                      
                                                                    
};                                                                        