
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
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
		OnConditions = 
		{
			OR
			{
				-- Urgi ist noch Eisblock
				MapValueIsEqual{Name = "mv_UrgiState", Value = 0},
				
				-- Urgi zittert und friert und will dies kundtun
				MapValueIsEqual{Name = "mv_UrgiState", Value = 1},
				
				-- Urgi hat seinen Frost kundgetan und der Spieler hat den Wärmetrank
				AND
				{
					MapValueIsEqual{Name = "mv_UrgiState", Value = 2},
					AvatarHasItemMisc	{Player = "pl_Human", ItemId = 314, Amount = 1},
				},
				
				-- Urgi ist defrosted und ist in der Nähe des Navigationsobjektes
				-- und Spieler hat Quest, ihn anzusprechen
				AND
				{
					QuestIsActive {Quest = "CityShip1_SpeakToUrgi01"},	
					MapValueIsEqual{Name = "mv_UrgiState", Value = 3},
				},
				
				-- Urgi bietet Info zu verbrauchtem Kraftkristall an
				AND
				{
					QuestIsActive {Quest = "CityShip1_SpeakToUrgi02"},	
					MapValueIsEqual{Name = "mv_UrgiState", Value = 4},
				},
				
				-- Urgi bietet Infos zur GeistEntität an
				AND
				{
					QuestIsActive {Quest = "CityShip2_TalkToUrgi"},
					MapValueIsEqual{Name = "mv_UrgiState", Value = 5},
				},
				-- Urgi wurde befreit und bietet Infos zu Kampf gegen Geweihte an
				AND
				{
					QuestIsActive {Quest = "CityShip4_TalkToUrgi"},
					MapValueIsEqual{Name = "mv_UrgiState", Value = 6},
				},
				-- Tickendes Herz
				QuestIsActive	{Quest = "TickingHeartTalkToUrgi"},
				
				AND
				{
					QuestIsNotKnown	{Quest = "ThoughtsOfGlass"},
					MapValueIsGreaterOrEqual	{Name = "mv_UrgiState", Value = 3},
				},
				
				-- Urgi verschwindet
				AND
				{
					MapValueIsEqual{Name = "mv_UrgiState", Value = 7},
					QuestIsSolved	{Quest = "TickingHeartTalkToUrgi"},
					QuestIsKnown	{Quest = "ThoughtsOfGlass"},
					QuestIsSolved {Quest = "CityShip4_SetCoordsWestguard"},
				},
			},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			NotOR
			{
				-- Urgi ist noch Eisblock
				MapValueIsEqual{Name = "mv_UrgiState", Value = 0},
				
				-- Urgi zittert und friert und will dies kundtun
				MapValueIsEqual{Name = "mv_UrgiState", Value = 1},
				
				-- Urgi hat seinen Frost kundgetan und der Spieler hat den Wärmetrank
				AND
				{
					MapValueIsEqual{Name = "mv_UrgiState", Value = 2},
					AvatarHasItemMisc	{Player = "pl_Human", ItemId = 314, Amount = 1},
				},
				
				-- Urgi ist defrosted und ist in der Nähe des Navigationsobjektes
				-- und Spieler hat Quest, ihn anzusprechen
				AND
				{
					QuestIsActive {Quest = "CityShip1_SpeakToUrgi01"},	
					MapValueIsEqual{Name = "mv_UrgiState", Value = 3},
				},
				
				-- Urgi bietet Info zu verbrauchtem Kraftkristall an
				AND
				{
					QuestIsActive {Quest = "CityShip1_SpeakToUrgi02"},	
					MapValueIsEqual{Name = "mv_UrgiState", Value = 4},
				},
				
				-- Urgi bietet Infos zur GeistEntität an
				AND
				{
					QuestIsActive {Quest = "CityShip2_TalkToUrgi"},
					MapValueIsEqual{Name = "mv_UrgiState", Value = 5},
				},
				-- Urgi wurde befreit und bietet Infos zu Kampf gegen Geweihte an
				AND
				{
					QuestIsActive {Quest = "CityShip4_TalkToUrgi"},
					MapValueIsEqual{Name = "mv_UrgiState", Value = 6},
				},
				-- Tickendes Herz
				QuestIsActive	{Quest = "TickingHeartTalkToUrgi"},
				
				AND
				{
					QuestIsNotKnown	{Quest = "ThoughtsOfGlass"},
					MapValueIsGreaterOrEqual	{Name = "mv_UrgiState", Value = 3},
				},
				
				-- Urgi verschwindet
				AND
				{
					MapValueIsEqual{Name = "mv_UrgiState", Value = 7},
					QuestIsSolved	{Quest = "TickingHeartTalkToUrgi"},
					QuestIsKnown	{Quest = "ThoughtsOfGlass"},
					QuestIsSolved {Quest = "CityShip4_SetCoordsWestguard"},
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
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_ChangeUrgi"},
			AvatarIsNotTalking	{},	-- wichtig! sonst kann es zu Dialogfehlern wg. UnitChange kommen!
		},
		Actions =
		{
			FigureUnitChange	{Tag = "default", UnitId = 1395, Level = 5},
			-- Dialog muss hier nochmal gestartet werden
			-- da er beim UnitChange immer verloren geht
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "FunnyUrgi01", Tag = "Urgi"},
			FigureOutcry{TextTag = "FunnyUrgi02", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FunnyUrgi03", Tag = "Urgi"},
			FigureOutcry{TextTag = "FunnyUrgi04", Tag = "pl_HumanHeroCaine"},
		},
	},

	OnFollowEvent
	{
		Tag = "Urgi",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
		},
		Actions = 
		{
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn Urgi dem Spieler folgt, in der Nähe der Bibliothek ist
			-- und der Spieler die Quest hat, die Koordinaten zu suchen
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
			QuestIsKnown{Quest = "CityShip1_FindNavigationCard"},
			OR
			{
				FigureIsInEntityRange{Tag = "Urgi", TargetTag = "LibraryObject", Range = 12},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "LibraryObject", Range = 5},
			},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "UrgiAsGuide02", Tag = "Urgi"},
			MapFlagSetTrue{Name = "mf_DiscoveredLibraryObject"},
			
			--ObjectSpawn	{ObjectId = 1591, X = 383.328, Y = 317.698, Direction = 1, Tag = "LibraryQuestmarker"}, -- für Questmarker
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
			OR
			{
				FigureIsInEntityRange{Tag = "Urgi", TargetTag = "NavigationObject", Range = 12},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "NavigationObject", Range = 5},
			},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "UrgiAsGuide01", Tag = "Urgi"},
			MapFlagSetTrue{Name = "mf_DiscoveredNavigationObject"},
			
			AvatarFlagSetTrue{Name = "af_P405_DiscoveredNavigationObject"}, -- Avatarflag für SQ Herz aus Eis
			
			ObjectSpawn	{ObjectId = 1591, X = 341.937, Y = 330.411, Direction = 1, Tag = "NavigationQuestmarker"}, -- für Questmarker
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn Urgi dem Spieler folgt, in der Nähe dee Craftingsraums ist
			-- und der Spieler die Quest hat, den Energiekristall aufzufüllen
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
			QuestIsKnown{Quest = "CityShip1_RepairPowerCrystal"},
			OR
			{
				FigureIsInEntityRange{Tag = "Urgi", TargetTag = "CrafterObject", Range = 12},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "CrafterObject", Range = 5},
			},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "UrgiAsGuide03", Tag = "Urgi"},
			MapFlagSetTrue{Name = "mf_DiscoveredCrafterObject"},
			
			--ObjectSpawn	{ObjectId = 1591, X = 302.421, Y = 308.591, Direction = 1, Tag = "CrafterQuestmarker"}, -- für Questmarker
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn Urgi dem Spieler folgt, in der Nähe des Spinnenraums ist
			-- hängt NICHT an Quest, da der Raum auch für eine Nebenquest geöffnet werden muß
			EntityFlagIsTrue{Name = "ef_UrgiFollowsAvatar"},
			OR
			{
				FigureIsInEntityRange{Tag = "Urgi", TargetTag = "Door11", Range = 12},
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Door11", Range = 5},
			},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "UrgiAsGuide04", Tag = "Urgi"},
			MapFlagSetTrue{Name = "mf_DiscoveredSpiderObject"},
			
			--ObjectSpawn	{ObjectId = 1591, X = 436.171, Y = 377.12, Direction = 1, Tag = "SpiderQuestmarker"}, -- für Questmarker
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_FourthArrival"},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "default", TargetTag = "PlaceUrgiTortured"},
			EntityFlagSetFalse{Name = "ef_UrgiFollowsAvatar"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiFree"},
		},
		Actions =
		{
			EntityFlagSetTrue{Name = "ef_UrgiFollowsAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_UrgiState", Value = 8},
		},
		Actions =
		{
			EntityFlagSetFalse{Name = "ef_UrgiFollowsAvatar"},
		},
	},
	
	OnIdleGoHomeFake
	{
		X = 347.849, Y = 389.836, 
		Range = 8,
		--GotoForced = ,
		UpdateInterval = 0,
		--StopFigureWhenConditionsAreFalse = ,
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_UrgiState", Value = 8},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			AvatarFlagSetTrue{Name = "af_P405_UrgiLeftCityShip"},
			FigureVanish{Tag = "Urgi"},
		},
		
	};


    

}
