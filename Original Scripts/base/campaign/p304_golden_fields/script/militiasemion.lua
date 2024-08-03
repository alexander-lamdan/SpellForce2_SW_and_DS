
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
		-- wird Semion freigeschaltet
	},    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_TaskGiven"},
    		QuestIsNotKnown{Quest = "ReportSemion"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler den Harpyentask hat, aber noch nicht 10 Harpyen gekillt hat
    },
    
     OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "ReportSemion"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler den gelungenen Harpyenmord reporten soll
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive{Quest = "ReportBannerSemion"},
    	},
    	Actions =
    	{
    		EntityFlagSetFalse{Name ="ef_DialogOff"},
    	},
    	-- anschalten, sobald Spieler den Bannerreport machen soll
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityFlagIsTrue{Name = "ef_Task02Given"},
    		QuestIsNotKnown{Quest = "ReportBannerSemion"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue{Name ="ef_DialogOff"},
    	},
    	-- abschalten, sobald Spieler die Bannerquest hat, aber noch keinen Bannerreport machen soll
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