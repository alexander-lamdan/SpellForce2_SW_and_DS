  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
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
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- nach der 1. Cutscene
		-- wird der Charakter freigeschaltet
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithDrehlein", Value = 2},
		},
		Actions =
		{	
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
		-- sobald Spieler den Auftrag bekommen hat, Lela zu befreien
		-- wird Dialog erstmal abgeschaltet
	},
    
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithDrehlein", Value = 3},
		},
		Actions =
		{	
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
		-- sobald Lela frei ist
		-- wird Dialog wieder angeschaltet
		-- (Value wird im SidequestOther-Script auf 3 gesetzt)
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithDrehlein", Value = 5},
		},
		Actions =
		{	
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
		-- sobald der Spieler seine Wahl getroffen hat (Drehlein-Belohnung)
		-- wird Dialog ganz abgeschaltet
	},
    
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P309_LelaInGoS"}
		},
		Actions = 
		{
			FigureVanish{Tag = "default"},
		},
	};


                                                              
};                                                                              