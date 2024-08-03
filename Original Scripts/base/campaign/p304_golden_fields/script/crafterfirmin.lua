ChestPosX = 598
ChestPosY = 323
-- Koordinaten der Kiste, wohin Firmin geht


State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			OR
			{
				QuestIsActive{Player = "default", Quest = "DeliveryFirmin"},
				QuestIsActive{Player = "default", Quest = "TalkToFirmin"},
				AND
				{
					QuestIsActive{Player = "default", Quest = "OpenChestOrLetItOpen"},
					MapFlagIsFalse{Name = "mf_JorgesChestIsOpen"},
				},
				AND
				{
					AvatarFlagIsTrue{Name = "af_P304_CardoganKnown"},
					EntityFlagIsFalse{Name ="ef_SaidNoTask"},
				},
			},
			EntityFlagIsFalse {Name ="ef_DialogOff"},
			
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			OR
			{
				EntityFlagIsTrue {Name ="ef_DialogOff"},
				
				AND
				{
					QuestIsNotActive{Player = "default", Quest = "DeliveryFirmin"},
					QuestIsNotActive{Player = "default", Quest = "TalkToFirmin"},
					NotAND
					{
						QuestIsActive{Player = "default", Quest = "OpenChestOrLetItOpen"},
						MapFlagIsFalse{Name = "mf_JorgesChestIsOpen"},
					},
					NotAND
					{
						AvatarFlagIsTrue{Name = "af_P304_CardoganKnown"},
						EntityFlagIsFalse{Name ="ef_SaidNoTask"},
					},		
				},
			},
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
			DialogSetDisabled{},
		}, -- zu Beginn der Karte Dialog abschalten
	};
    
    
	
	
	OnOneTimeEvent
	{ 
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_GoAndOpenChest"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		},
		GotoState = "GoAndOpenChest"
		-- sobald man Firmin gesagt hat, daß er die Kiste öffnen soll
		-- (Sidequest), schaltet er seinen Dialog ab, springt in einen anderen
		-- State, läuft zur Kiste, läuft wieder zurück
		-- und kehrt zurück in diesen State
	},
	
	                                                                   
}    



State
{
	StateName = "GoAndOpenChest",
	
	OnIdleGoHomeFake
	{
		X = 598,
		Y = 323,
		Range = 1.5,
		Conditions = 
		{
			EntityFlagIsFalse{Name = "ef_ChestReached"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue{Name = "ef_ChestReached"},
		},
	};

	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 1.5,
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ChestReached"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue{Name = "ef_DoneChestStuff"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_DoneChestStuff"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
		GotoState = "MainState"
	},
}                                                                               