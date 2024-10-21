

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
			AvatarFlagIsTrue{Name = "af_P304_AlastarKnown"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Alastar KNOWN ist
		-- wird Tosie freigeschaltet
	},     
    
     OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "ReportSephis"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den HeiligeStättenTask hat, aber die Heilige Stätte noch nicht gecleared hat
    },
    
     OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "ReportSephis"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler die gelungene Säuberung reporten soll
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "ReportSectMembersToSephis"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler den Verdächtigenreport machen soll
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_Task02Given"},
    		QuestIsNotKnown{Quest = "ReportSectMembersToSephis"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Verdächtigenquest hat, aber noch keinen Verdächtigenreport machen soll
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