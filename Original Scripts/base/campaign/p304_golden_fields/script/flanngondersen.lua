

State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"}, 
		},
		DelayedActions = 
		{
		},
	};

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	


	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name = "ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name = "ef_DialogOff"},
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
			EntityFlagSetTrue {Name = "ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	};
    
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_EnableDialogAlyreRedmundFlannAfterHagardDialog"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name = "ef_DialogOff"},
		}, -- sobald Spieler den Auftrag bekommt, die Gildenmeister zu fragen
		-- wird der Charakter freigeschaltet
		-- (schaltet auch Flann Gondersen frei)
	},  
 
	
    
     OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P304_TalkWithGondersen", Value = 1 },
    	},
    	Actions =
    	{
    		EntityFlagSetTrue {Name = "ef_DialogOff"},
    		QuestSetActive{Quest = "GFLostDeliveries"},
    		QuestSetActive{Quest = "FindTheLostDeliveries"},
    		FogOfWarRevealAtEntity	{FogOfWarId = 40, Tag = "GondersenChest", Range = 25, Height = default},
    	},	-- Sobald Dialog abgeschlossen, abschalten
    },
    
    OnIdleGoHomeFake
	{
		X = 632.626,
		Y = 64.5318,
		Range = 8,
		UpdateInterval = 10,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithGondersen", Value = 1 },
		},
		HomeActions = 
		{
			FigureVanish{Tag = "default"},
		},
		-- Sobald Dialog abgeschlossen, läuft er zum Portal und verschwindet dort
		
	};
	
	
	
	----------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_MarcIsCheating"},
		},
		Actions = 
		{
			-- Cheat für Marc
			EntityFlagSetFalse {Name = "ef_DialogOff"},
		}, 
	},

                                          
};                                                                            