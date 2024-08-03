

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
			DialogTypeSetMainQuest{},
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
    		AvatarFlagIsTrue{Name = "af_P304_CS03Finished"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_P304_Windhammer_Dead_Anim_Stop"},
    	},
	},
    
    OnFigureRespawnEvent
	{
		WaitTime = 5,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_CS03Finished"},
			AvatarFlagIsFalse{Name = "af_P304_FirstReturnToGoldenFields"},	
			MapFlagIsTrue{Name = "mf_P304_Windhammer_Dead_Anim_Stop"},
		},
		Actions = 
		{
			--ObjectVanish{Tag = "WindhammerDown"},
			AvatarFlagSetTrue{Name = "af_P304_DwarfEmbassadorAlive"},
		},
	    -- sobald dritte Cutscene um ist, erscheint Windhammer wieder
	    -- (aber nicht mehr, sobald Spieler zum 1. Mal auf die Golden Fields zurückkehrt)
	},


    
    OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithJared", Value = 2 },
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald Jared wieder lebt, schaltet Windhammer seinen Dialog frei
	},
	
	
	OnIdleGoHomeFake
	{
		X = 519.34,
		Y = 636.9,
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_DwarfEmbassadorAlive"},
			AvatarValueIsEqual{Name = "av_P304_TalkWithWindhammer", Value = 1 },
			MapFlagIsTrue{Name = "mf_UnderhallUnlocked"},
		},
		Actions = 
		{
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},	
		},
		Actions = 
		{
			FigureVanish	{Tag = "default"},
		}, -- sobald Spieler von Underhall zurückkehrt, wird Jandrin gelöscht
	},
	
};                                                                            