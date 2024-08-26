
-- SingleMapLoadEvent einladen
dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

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
			QuestSetSolved {Quest = "Ghostwatch_ToTheCityShip"},
			QuestSetActive {Quest = "CityShip1_TracesOfTheSoulcarrier"},
		},
		GotoState = "QuestState01",
	},
}


State
{	
	StateName = "QuestState01",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SoulcarrierInfoGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_TracesOfTheSoulcarrier"},
			QuestSetActive {Quest = "CityShip1_SearchForMoreSecrets"},
		},
		GotoState = "QuestState02",
	},
}


State
{	
	StateName = "QuestState02",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiDiscovered"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_SearchForMoreSecrets"},
			QuestSetActive {Quest = "CityShip1_TheFrozenSkerg"},
			QuestSetActive {Quest = "CityShip1_ExamineTheSkerg"},
		},
		GotoState = "QuestState03",
	},
}


State
{	
	StateName = "QuestState03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiToldThatHesFrozen"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_ExamineTheSkerg"},
			QuestSetActive {Quest = "CityShip1_DefrostUrgi"},	
		},
		GotoState = "QuestState04",
	},
}


State
{	
	StateName = "QuestState04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_UrgiState", Value = 3}, -- wenn Urgi seinen Wärmetrank bekam
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_DefrostUrgi"},
			QuestSetSolved {Quest = "CityShip1_TheFrozenSkerg"},
			QuestSetActive {Quest = "CityShip1_TravelToCitadel"},
			QuestSetActive {Quest = "CityShip1_FindNavigationObject"},	
			QuestSetActive {Quest = "CityShip1_SetCourseToCitadel"},	
		},
		GotoState = "QuestState05",
	},
}


State
{	
	StateName = "QuestState05",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DiscoveredNavigationObject"},
			MapFlagIsTrue{Name = "mf_ToldPlayerThatCitadelMapIsMissing"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_FindNavigationObject"},	
			QuestSetActive {Quest = "CityShip1_SpeakToUrgi01"},	
		},
		GotoState = "QuestState06",
	},
}

State
{	
	StateName = "QuestState06",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiToldToLookAfterLibrary"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Door10"},
			QuestSetSolved {Quest = "CityShip1_SpeakToUrgi01"},	
			QuestSetActive {Quest = "CityShip1_FindNavigationCard"},
			ObjectSpawn	{ObjectId = 1591, X = 383.328, Y = 317.698, Direction = 1, Tag = "LibraryQuestmarker"}, -- für Questmarker	
		},
		GotoState = "QuestState07",
	},
}


State
{	
	StateName = "QuestState07",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CitadelCoordsGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_FindNavigationCard"},	
		},
		GotoState = "QuestState08",
	},
}


State
{	
	StateName = "QuestState08",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ToldPlayerThatCityDoesNotMove"},
		},
		Actions =
		{
			QuestSetActive {Quest = "CityShip1_SpeakToUrgi02"},	
		},
		GotoState = "QuestState09",
	},
}

State
{	
	StateName = "QuestState09",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiToldToLookAfterCraftingRoom"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Door02"},
			QuestSetSolved {Quest = "CityShip1_SpeakToUrgi02"},	
			QuestSetActive {Quest = "CityShip1_RepairPowerCrystal"},	
			ObjectSpawn	{ObjectId = 1591, X = 302.421, Y = 308.591, Direction = 1, Tag = "CrafterQuestmarker"}, -- für Questmarker
			
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 321, Amount = 1},
		},
		GotoState = "QuestState10",
	},
}


State
{	
	StateName = "QuestState10",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CrystalDone"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_RepairPowerCrystal"},
			
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 321, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 322, Amount = 1},
			
			-- Urgi macht Info-Outcry
			FigureOutcry{TextTag = "CrystalInfo", Tag = "Urgi"},
		},
		GotoState = "QuestState11",
	},
}


State
{	
	StateName = "QuestState11",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtCitadel},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_SetCourseToCitadel"},
			QuestSetActive {Quest = "CityShip1_TeleportToCitadel"},	
			
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 322, Amount = 1},
		},
		GotoState = "QuestState12",
	},
}


State
{	
	StateName = "QuestState12",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Cheat02"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_TeleportToCitadel"},
			QuestSetActive {Quest = "Citadel1_IntoTheCitadel"},	
			QuestSetActive {Quest = "Citadel1_GoToDraghLur"},
			
			-- Avatar von Lvl 20 auf 22 bringen
			AvatarXPGive	{Player = "default", Amount = 26480},
			
			AvatarFlagSetTrue{Name = "af_P406_ReadyToReturnToCityShip"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P406_ReadyToReturnToCityShip"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_SecondArrival"},
		},
		GotoState = "QuestState13",
	},
}


-- !---------------------------------------------------------------------------------------------!
--
-- !                                          AB HIER PART 2                                     !
--
-- !---------------------------------------------------------------------------------------------!

State
{	
	StateName = "QuestState13",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel1_GoToDraghLur"},
			QuestSetSolved {Quest = "Citadel1_IntoTheCitadel"},
			QuestSetSolved {Quest = "CityShip1_TravelToCitadel"},
			QuestSetActive {Quest = "CityShip2_To_Dragh_Lur"},
			QuestSetActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		GotoState = "QuestState14",
	},
}


State
{	
	StateName = "QuestState14",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
		},
		Actions =
		{
			QuestSetActive {Quest = "CityShip2_GhostEntity"},
			QuestSetActive {Quest = "CityShip2_HinderGhosts"},
		},
		GotoState = "QuestState15",
	},
}

State
{	
	StateName = "QuestState15",
	
	-- diese Quest wird auch später noch einmal zur Sicherheitabgefragt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_FindCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_SetCoordsDraghLur"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_EvilThoughtsGoneAndUrgiInfo"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_HinderGhosts"},
			QuestSetActive {Quest = "CityShip2_TalkToUrgi"},
		},
		GotoState = "QuestState16",
	},
}

State
{	
	StateName = "QuestState16",
	
	-- diese Quest wird auch später noch einmal zur Sicherheitabgefragt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_FindCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_SetCoordsDraghLur"},
		},
	},
	
	OnOneTimeEvent
	{	
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_UrgiToldToLookAfterSpiderRoom"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "CityShip2_TalkToUrgi"},
			QuestSetActive {Quest = "CityShip2_ActivateSpiders"},
			QuestSetActive {Quest = "CityShip2_BeatUpGhostEntity"},
			ObjectSpawn	{ObjectId = 1591, X = 436.171, Y = 377.12, Direction = 1, Tag = "SpiderQuestmarker"}, -- für Questmarker
			GateSetOpen	{Tag = "Door11"},
		},
		GotoState = "QuestState17",
	},
}

State
{	
	StateName = "QuestState17",
	
	-- diese Quest wird auch später noch einmal zur Sicherheitabgefragt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_FindCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_SetCoordsDraghLur"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue{Name = "mf_Spider01Ready"},
					MapFlagIsTrue{Name = "mf_Spider02Ready"},
					MapFlagIsTrue{Name = "mf_Spider03Ready"},
					MapFlagIsTrue{Name = "mf_Spider04Ready"},
					MapFlagIsTrue{Name = "mf_Spider05Ready"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
					FigureIsDead{Tag = "MindEntity"},
				},
			},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_ActivateSpiders"},
		},
		GotoState = "QuestState18",
	},
}


State
{	
	StateName = "QuestState18",
	
	-- diese Quest wird auch später noch einmal zur Sicherheitabgefragt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_FindCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_SetCoordsDraghLur"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
			FigureIsDead{Tag = "MindEntity"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_BeatUpGhostEntity"},
			QuestSetSolved {Quest = "CityShip2_GhostEntity"},
		},
		GotoState = "QuestState19",
	},
}

State
{	
	StateName = "QuestState19",
	
	-- zur Sicherheit hier noch einmal
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_FindCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_SetCoordsDraghLur"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip2_SetCoordsDraghLur"},
			AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtDraghLur},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_SetCoordsDraghLur"},
			QuestSetActive {Quest = "CityShip2_TeleportToDraghLur"},
		},
		GotoState = "QuestState20",
	},
}


State
{	
	StateName = "QuestState20",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Cheat03"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip2_TeleportToDraghLur"},
			QuestSetSolved {Quest = "CityShip2_To_Dragh_Lur"},	
			QuestSetSolved {Quest = "SF1A1_2_Akt_Kapitel1"},
			QuestSetActive {Quest = "SF2A1_2_Akt_Kapitel4"},
			QuestSetActive {Quest = "Citadel_ToRefuge"},
			QuestSetActive {Quest = "CityShip3_ReturnToCityShip"},
				
			-- Avatar von Lvl 22 auf 26 bringen
			AvatarXPGive	{Player = "default", Amount = (69280-15190)},
			
			AvatarFlagSetTrue{Name = "af_P407_SecondReturnToCityShip"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P407_SecondReturnToCityShip"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThirdArrival"},
		},
		GotoState = "QuestState21",
	},
}


-- !---------------------------------------------------------------------------------------------!
--
-- !                                          AB HIER PART 3                                    !
--
-- !---------------------------------------------------------------------------------------------!

State
{	
	StateName = "QuestState21",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip3_ReturnToCityShip"},
			QuestSetActive {Quest = "CityShip3_FindCoordsRefuge"},
		},
		GotoState = "QuestState22",
	},
}

State
{	
	StateName = "QuestState22",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_RefugeCoordsGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip3_FindCoordsRefuge"},
			QuestSetActive {Quest = "CityShip3_SetCoordsRefuge"},
		},
		GotoState = "QuestState23",
	},
}

State
{	
	StateName = "QuestState23",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtRefuge},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip3_SetCoordsRefuge"},
			QuestSetActive {Quest = "CityShip3_TeleportRefuge"},
		},
		GotoState = "QuestState24",
	},
}


State
{	
	StateName = "QuestState24",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Cheat04"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip3_TeleportRefuge"},
			QuestSetSolved {Quest = "Citadel_ToRefuge"},	
			QuestSetSolved {Quest = "SF2A1_2_Akt_Kapitel4"},
			QuestSetSolved {Quest = "SF2A1_2_Akt"},
			
			QuestSetActive {Quest = "SF2A1_3_Akt"},
			QuestSetActive {Quest = "SF2A1_3_Akt_Kapitel1"},
			QuestSetActive {Quest = "Refuge_ToWestguard"},
			QuestSetActive {Quest = "CityShip4_ReturnToCityShip"},
				
			-- Avatar von Lvl 26 auf 28 bringen
			AvatarXPGive	{Player = "default", Amount = 43760},
			
			AvatarFlagSetTrue{Name = "af_P409_ThirdReturnToCityShip"},
			
			PlayerHeroAdd	{Player = "pl_Human", HeroId = 010},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P409_ThirdReturnToCityShip"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_FourthArrival"},
		},
		GotoState = "QuestState25",
	},
}


-- !---------------------------------------------------------------------------------------------!
--
-- !                                          AB HIER PART 4                                    !
--
-- !---------------------------------------------------------------------------------------------!


State
{	
	StateName = "QuestState25",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_ReturnToCityShip"},
		},
	},
	
	OnOneTimeEvent
	{
		-- nach der 3. Cutscene
		-- werden die Invasions-Questen geöffnet
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = "Blessed14", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Blessed26", AbilityId = 94},
			-- Geweihte bekommen Immortal
			
			QuestSetActive {Quest = "CityShip4_InvasionOfTheCityShip"},
			QuestSetActive {Quest = "CityShip4_FreeUrgi"},
		},
		GotoState = "QuestState27",
	},
}


State
{	
	StateName = "QuestState27",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_FreeUrgi"},
			MapFlagIsTrue{Name = "mf_UrgiFree"},	
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_FreeUrgi"},
			QuestSetActive {Quest = "CityShip4_TalkToUrgi"},
		},
		GotoState = "QuestState28",
	},
}

State
{	
	StateName = "QuestState28",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_TalkToUrgi"},
			MapFlagIsTrue{Name = "mf_UrgiToldToTraumatize"},	
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_TalkToUrgi"},
			QuestSetActive {Quest = "CityShip4_CallHateThoughts"},
			QuestSetActive {Quest = "CityShip4_CallWrathThoughts"},
			QuestSetActive {Quest = "CityShip4_CallGrossThoughts"},
			QuestSetActive {Quest = "CityShip4_CallFearThoughts"},
			QuestSetActive {Quest = "CityShip4_CallMadnessThoughts"},
		},
		GotoState = "QuestState29",
	},
}

State
{	
	StateName = "QuestState29",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_CallHateThoughts"},
			MapValueIsGreaterOrEqual{Name = "mv_CounterHateThoughts", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			QuestSetSolved {Quest = "CityShip4_CallHateThoughts"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_CallWrathThoughts"},
			MapValueIsGreaterOrEqual{Name = "mv_CounterWrathThoughts", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			QuestSetSolved {Quest = "CityShip4_CallWrathThoughts"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_CallFearThoughts"},
			MapValueIsGreaterOrEqual{Name = "mv_CounterFearThoughts", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			QuestSetSolved {Quest = "CityShip4_CallFearThoughts"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_CallGrossThoughts"},
			MapValueIsGreaterOrEqual{Name = "mv_CounterGrossThoughts", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			QuestSetSolved {Quest = "CityShip4_CallGrossThoughts"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_CallMadnessThoughts"},
			MapValueIsGreaterOrEqual{Name = "mv_CounterMadnessThoughts", Value = 4},
		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_ThoughtsAreOnTheirWay"}, -- für CryStatuen-Dialogabschaltung
			QuestSetSolved {Quest = "CityShip4_CallMadnessThoughts"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "CityShip4_CallMadnessThoughts"},
			QuestIsSolved {Quest = "CityShip4_CallGrossThoughts"},	
			QuestIsSolved {Quest = "CityShip4_CallFearThoughts"},
			QuestIsSolved {Quest = "CityShip4_CallHateThoughts"},
			QuestIsSolved {Quest = "CityShip4_CallWrathThoughts"},
		},
		Actions =
		{
			QuestSetActive {Quest = "CityShip4_TalkToGhostEntity"},	
		},
		GotoState = "QuestState30",
	},
}

State
{	
	StateName = "QuestState30",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TraumGhostTeams"},	
		},
		Actions =
		{
						
			FigureAbilityRemove	{Tag = "Blessed14", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Blessed26", AbilityId = 94},
			-- Immortal wird von Geweihten removed			

			QuestSetSolved {Quest = "CityShip4_TalkToGhostEntity"},
			QuestSetActive {Quest = "CityShip4_KillTheBlessed"},
		},
		GotoState = "QuestState31",
	},
}

State
{	
	StateName = "QuestState31",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_BlessedKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_KillTheBlessed"},
			QuestSetSolved {Quest = "CityShip4_InvasionOfTheCityShip"},
			QuestSetActive {Quest = "CityShip4_FindCoordsWestguard"},
		},
		GotoState = "QuestState32",
	},
}

State
{	
	StateName = "QuestState32",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_FindCoordsWestguard"},
			MapFlagIsTrue{Name = "mf_WestguardCoordsGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_FindCoordsWestguard"},
			QuestSetActive {Quest = "CityShip4_SetCoordsWestguard"},
		},
		GotoState = "QuestState33",
	},
}

State
{	
	StateName = "QuestState33",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWestguard},
			QuestIsActive{Quest = "CityShip4_SetCoordsWestguard"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip4_SetCoordsWestguard"},
			QuestSetActive {Quest = "CityShip4_TeleportWestguard"},
		},
	},
}