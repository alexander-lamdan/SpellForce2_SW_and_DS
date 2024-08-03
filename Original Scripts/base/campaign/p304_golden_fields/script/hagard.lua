
State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_CutsceneB01_Hagard_Spawn"},
				AvatarFlagIsTrue{Name = "af_P304_TalkedWithIdara"},
			},				
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
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithIdara"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- EINSCHALTBEDINGUNG: Mit Idara gesprochen
	},    
 
 	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 1 },
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- Nach dem ersten Gespräch mit Hagard wird er abgeschaltet
	},    
 
 	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithFool"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- Nach Aufklärung durch Narr wieder an
	},    
 
 
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 2 },
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
			GateSetOpen	{Tag = "HagardGate"},
		}, 	-- Nach dem zweiten Gespräch mit Hagard wird er abgeschaltet
		-- Das Tor nach oben öffnet sich
	},    
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS04Finished"},
		},
		Actions =
		{
			FigureVanish{Tag = "default"},
		},
		-- Hagard verschwindet nach der 4. Cutscene
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 639 ,
		Y = 619,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_ShadowsongKidnapperTold"},
			EntityFlagIsFalse{Name = "ef_RespawnedForPart3"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_RespawnedForPart3"},
		},
		-- Hagard respawnt in Teil 3 nach dem Gespräch mit Redmund
	},


	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "SearchNighsongNE"},
			FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Hagard", Range = 20 },
		},
		Actions =
		{
			FigureOutcry{TextTag = "HagardMocks01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "HagardMocks02", Tag = "Hagard"},
			FigureOutcry{TextTag = "HagardMocks03", Tag = "Hagard"},
			FigureOutcry{TextTag = "HagardMocks04", Tag = "Hagard"},
			FigureOutcry{TextTag = "HagardMocks05", Tag = "Hagard"},
			AvatarFlagSetTrue{Name = "af_P304_KidnappedNightsongDiscovered"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 129, Amount = 1},
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 137, Amount = 1},
				-- wenn Spieler kleine oder großeTaschendiebstahlklaue hat
			},
			FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 3},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 103, Amount = 1 },
			FigureOutcry{TextTag = "Pickpocketing01", Tag = "pl_HumanAvatar"},
			-- SCHÄDELMÜNZE ABGREIFEN
		},
	},
	
	OnOneTimeDeadEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_RespawnedForPart3"},
			-- wenn Hagard für den 3. Teil respawnt ist
		},
		Actions =
		{
			-- Flag für XP
			MapFlagSetTrue{Name = "mf_HagardKilled"},

		},
	},
                                                                      
};                                                                         