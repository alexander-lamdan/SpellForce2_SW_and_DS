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
			AvatarFlagIsTrue {Name = "af_P312_SiegeSkelsAllDead"},
		},
		Actions = 
		{
			EntityTimerStart{Name = "et_SpeakToMe"},
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald erste Cutscene beendet (König), Dialog anschalten
	};
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P312_SiegeSkelsAllDead"},
    		QuestIsActive{Player = "pl_Human", Quest = "GoSPart8FindArdar"},
    	},
    	Actions =
    	{
    		QuestSetSolved{Player = "pl_Human", Quest = "GoSPart8FindArdar"},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed{Name = "et_SpeakToMe", Seconds = 120},
    		AvatarFlagIsFalse{Name = "af_P312_MagnetStonesInfoGiven"},
    	},
    	Actions =
    	{
    		EntityFlagSetTrue {Name ="ef_DialogOff"},
    		FigureOutcry{TextTag = "ArdarInfo01", Tag = "Ardar"},
    		FigureOutcry{TextTag = "ArdarInfo02", Tag = "Ardar"},
    		FigureOutcry{TextTag = "ArdarInfo03", Tag = "Ardar"},
    		FigureOutcry{TextTag = "ArdarInfo04", Tag = "Ardar"},
    		FigureOutcry{TextTag = "ArdarInfo05", Tag = "Ardar"},
    		FigureOutcry{TextTag = "ArdarInfo06", Tag = "Ardar"},
    		AvatarFlagSetTrue{Name = "af_P312_MagnetStonesInfoGiven"},	
    	},
    },
    
    OnIdleGoHomeFake
	{
		X = 622,
		Y = 307.5,
		Range = 1.5,
		UpdateInterval = 10,
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P312_MagnetStonesInfoGiven"},
			AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureVanish{Tag = "default"},
		},
	};

                    
};                                                                            