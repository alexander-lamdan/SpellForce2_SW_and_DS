
-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Intro"},
		},
		GotoState = "QuestState01",
		--GotoState = "DecideToWhichPartToGo",
	},
}

--State
--{
--	StateName = "DecideToWhichPartToGo",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsFalse{Name = "af_P304_FirstReturnToGoldenFields"},
--			AvatarFlagIsFalse{Name = "af_P304_SecondReturnToGoldenFields"},
--		},
--		Actions =
--		{
--		},
--		GotoState = "QuestState01",
--	}, -- IN PART 1 SPRINGEN
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
--			AvatarFlagIsFalse{Name = "af_P304_SecondReturnToGoldenFields"},
--		},
--		Actions =
--		{
--		},
--		GotoState = "QuestState09",
--	}, -- IN PART 2 SPRINGEN
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
--			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
--		},
--		Actions =
--		{
--		},
--		GotoState = "QuestState18",
--	}, -- IN PART 3 SPRINGEN
--}

State
{
	StateName = "QuestState01",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 1000},
			
--			PortalDisable	{Tag = "PortalUnderhall"},
--			PortalDisable	{Tag = "PortalDunMora"},
--			PortalDisable	{Tag = "PortalTuscari"},
--			PortalDisable	{Tag = "PortalToNeedle"},
--			PortalDisable	{Tag = "PortalToWestguard"},
			-- Portale sind direkt im Editor disabled, damit sie bei Kartenstart nicht aufgedeckt werden	
	
			
			QuestSetSolved {Quest = "RushwaterPart6UndeadZone"},
			QuestSetSolved {Quest = "GotoGF"},
			-- RushwaterQuesten solven
			
			QuestSetActive {Quest = "GFPart1ToKing"},
			--QuestSetActive {Quest = "ToPalace"},
		}, -- zu Beginn der Karte den ersten Teil triggern
		GotoState = "QuestState02"
	},
}


State
{
	StateName = "QuestState02",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GFPart1ToKing"},
			QuestSetActive {Quest = "GFPart2TalkToEinar"},
			
			-- Portal zur Westgard wird in Script von Utrecht enabled
			
		}, -- Wenn Cutscene mit König Ulf um, dann 
			-- Quest "Sprich mit Einar"
		GotoState = "QuestState03"
	},
}


State
{
	StateName = "QuestState03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithEinar", Value = 1 },
		},
		Actions =
		{
			--QuestSetSolved {Quest = "TalkToEinar"},
			QuestSetSolved {Quest = "GFPart2TalkToEinar"},
			QuestSetSolved {Quest = "1_Kapitel"},
			QuestSetActive {Quest = "2_Kapitel"},
			QuestSetActive {Quest = "GFPart3TalkToDwarf"},
			
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneDwarf"},
			
		}, 	-- Wenn mit Einar gesprochen, dann
			-- Quest "Gehe zum Zwergenbotschafter"
		GotoState = "QuestState04"
	},
}


State
{
	StateName = "QuestState04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS02Finished"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFPart4GetMedicine"},
			QuestSetActive {Quest = "TalkToJared"},
		}, -- Wenn Cutscene um ist,
			-- soll Player mit Jared sprechen
		 GotoState = "QuestState05"
	},
}


State
{
	StateName = "QuestState05",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithJared", Value = 1 },
		},
		Actions =
		{
			QuestSetSolved {Quest = "TalkToJared"},
			QuestSetActive {Quest = "GetHerbsFromPatriarch"},
			QuestSetActive {Quest = "GetVialFromCraftsman"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "GuildmasterCardogan", Range = 25, Height = default},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 2, Tag = "PatriarchAlastar", Range = 25, Height = default},
			
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstonePriests"},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneCrafter"},
			
		}, -- Wenn mit Jared gesprochen
		   -- soll man das Zeug besorgen
		   -- Priester und Handwerker werden aufgedeckt
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
			AvatarFlagIsTrue{Name = "af_P304_GivePriestTaskQuest"},
		},
		Actions =
		{
			QuestSetActive {Quest = "DoTaskPriests"},
		}, -- hat man mit Alastar gesprochen
			-- soll man Aufrag für Priester erfüllen 
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_PriestJobDone"},
			QuestIsActive {Quest = "DoTaskPriests"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DoTaskPriests"},
		}, 
			
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_GiveCrafterTaskQuest"},
		},
		Actions =
		{
			QuestSetActive {Quest = "DoTaskForCraftsmen"},
		}, -- hat man mit Cardogan gesprochen
			-- soll man Auftrag für Handwerker erfüllen
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_CrafterJobDone"},
			QuestIsActive {Quest = "DoTaskForCraftsmen"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DoTaskForCraftsmen"},
		}, 
			
	},    
	
	
	
	--- QUEST "DoTaskPriests" wird im Script von Alastar gesolved
	--- QUEST "DoTaskCraftsmen" wird im Script von "PriestGalius" gesolved
	
	
	-- Spieler hat Chemikalien
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetHerbsFromPatriarch"},
			AvatarHasItemMisc {ItemId = 44, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetHerbsFromPatriarch"},
		},
	},
	
	-- Spieler hat Phiole
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetVialFromCraftsman"},
			AvatarHasItemMisc {ItemId = 45, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetVialFromCraftsman"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "GetHerbsFromPatriarch"},
			QuestIsSolved	{Quest = "GetVialFromCraftsman"},
		},
		Actions =
		{
			QuestSetActive {Quest = "BringStuffToJared"},
			AvatarFlagSetTrue{ Name = "af_P307_JaredUmspawnAshaTalk"},
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
			AvatarValueIsEqual{Name = "av_P304_TalkWithJared", Value = 2 },
		},
		Actions =
		{
			QuestSetSolved{Quest = "BringStuffToJared"},
			QuestSetSolved{Quest = "GFPart4GetMedicine"},
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
			AvatarValueIsEqual{Name = "av_P304_TalkWithWindhammer", Value = 1 },
		},
		Actions =
		{
			ObjectVanish{Tag = "LockGateUnderhall01"},
			ObjectVanish{Tag = "LockGateUnderhall02"},
			
			QuestSetSolved{Quest = "GFPart3TalkToDwarf"},
			QuestSetActive{Quest = "GFPart5ActivatePortal"},
			
			MapFlagSetTrue{Name = "mf_UnderhallUnlocked"},
		},
		GotoState = "QuestState09",
	},
}

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!        AB HIER PART 2       !!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


State
{
	StateName = "QuestState09",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
			QuestIsActive{Player = "default", Quest = "ReturnGF"},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 1000},
			
			QuestSetSolved{Quest = "ReturnGF"},
			QuestSetSolved{Quest = "UnderhallPart1SaveDwarves"},
			QuestSetActive{Quest = "GFPart6TalkToEinar"},
		},
		GotoState = "QuestState10",
		-- Abfrage für NORMALEN SPIELVERLAUF: Falls Spieler auf Underhall war
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
			QuestIsNotActive{Player = "default", Quest = "ReturnGF"},
		},
		Actions =
		{
			QuestSetActive{Quest = "GFPart6TalkToEinar"},
		},
		GotoState = "QuestState10",
		-- Abfrage für Cheating: Falls Spieler per Konsolenkommando die 3 Teile der GF durchspielt
	},
}


State
{
	StateName = "QuestState10",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsGreaterOrEqual{Name = "av_P304_TalkWithEinar", Value = 2 },
		},
		Actions =
		{
			QuestSetSolved{Quest = "GFPart6TalkToEinar"},
			QuestSetSolved{Quest = "2_Kapitel"},
			QuestSetActive{Quest = "3_Kapitel"},
			QuestSetActive{Quest = "GFPart7ElvenAmbassador"},
			QuestSetActive{Quest = "FindTheElvenAmbassador"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 3, Tag = "Idara", Range = 25, Height = default},
			-- Idara wird aufgedeckt
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
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithIdara"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindTheElvenAmbassador"},
			QuestSetActive{Quest = "SpeakToHagard"},
			
			--FogOfWarRevealAtEntity	{FogOfWarId = 4, Tag = "Hagard", Range = 25, Height = default},
			FogOfWarReveal	{FogOfWarId = 4, X = 248.103, Y = 624.153 , Range = 15, Height = default},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneNorth"},
			-- Hagard wird aufgedeckt
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
			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 1 }, 
		},
		Actions =
		{
			QuestSetSolved{Quest = "SpeakToHagard"},
			QuestSetActive{Quest = "FindSnakenettle"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 20, Tag = "GuildmasterLaudinia", Range = 25, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = 21, Tag = "GuildmasterAlyre", Range = 25, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = 22, Tag = "GeneralRedmund", Range = 25, Height = default},
			
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneMarket"},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneMages"},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneMilitia"},
			-- Die restlichen Gildenmeister werden aufgedeckt
		},
		GotoState = "QuestStateFoolIntermezzo",
	},
}


State
{
	StateName = "QuestStateFoolIntermezzo",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsGreaterOrEqual{Name = "av_P304_NesselQuestionCounter", Value = 5},
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindSnakenettle"},
			QuestSetActive{Quest = "TalkToFool"},
		},
		GotoState = "QuestState13",
	},
}

State
{
	StateName = "QuestState13",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithFool"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "TalkToFool"},
			QuestSetActive{Quest = "ConfrontHagard"},
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
			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 2 }, 
		},
		Actions =
		{
			QuestSetSolved{Quest = "ConfrontHagard"},
			QuestSetActive{Quest = "GetHelpMages"},
			QuestSetActive{Quest = "GetHelpMilitia"},
		},
		GotoState = "QuestState15",
	},
}


State
{
	StateName = "QuestState15",
	   
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_GiveMageTaskQuest"},
		},
		Actions =
		{
			QuestSetActive {Quest = "DoTaskMages"},
		}, -- hat man mit Alyre gesprochen
			-- soll man Aufrag für Magier erfüllen 
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_MageJobDone"}, 
			QuestIsActive {Quest = "DoTaskMages"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DoTaskMages"},
		}, 
			
	},    
	
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_GiveMiltiaTaskQuest"},
		},
		Actions =
		{
			QuestSetActive {Quest = "DoTaskMilitia"},
		}, -- hat man mit Redmund gesprochen
			-- soll man Auftrag für Miliz erfüllen
	},
	   
	
	OnOneTimeEvent
	{
		Conditions =
		{		
			AvatarFlagIsTrue{Name = "af_P304_MilitiaJobDone"}, 
			QuestIsActive {Quest = "DoTaskMilitia"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DoTaskMilitia"},
		}, 
			
	},    
	
	
	-- Spieler hat Magierunterstützung
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetHelpMages"},
			AvatarFlagIsTrue{Name = "af_P304_GiveMageTroops"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetHelpMages"},
		},
	},
	
	-- Spieler hat Milizunterstützung
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetHelpMilitia"},
			AvatarFlagIsTrue{Name = "af_P304_GiveSoldierTroops"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetHelpMilitia"},
		},
	},
	
	--- QUEST "DoTaskPriests" wird im Script von Alastar gesolved
	--- QUEST "DoTaskCraftsmen" wird im Script von "PriestGalius" gesolved
	--- QUEST "DoTaskMilitia" wird im Script von Redmund gesolved
	--- QUEST "DoTaskMages" wird im Script von Alyre gesolved
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "GetHelpMilitia"},
			QuestIsSolved	{Quest = "GetHelpMages"},
		},
		Actions =
		{
			FogOfWarRevealAtEntity	{FogOfWarId = 40, Tag = "Ylia", Range = 25, Height = default},
			
			QuestSetActive {Quest = "DefeatHagard"},
		},
		GotoState = "QuestState16",
	},
}


State
{
	StateName = "QuestState16",

	OnOneTimeEvent
	{
		Conditions =
		{
			--AvatarFlagIsTrue {Name = "af_P304_YliaFreed"},
			AvatarValueIsEqual{Name = "av_P304_TalkWithYlia", Value = 1 },
		},
		Actions =
		{
			QuestSetSolved{Quest = "DefeatHagard"},
			QuestSetActive{Quest = "TalkToElvenAmbassador"},
		},
		GotoState = "QuestState17",
	},
}


State
{
	StateName = "QuestState17",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithYlia", Value = 2 },
		},
		Actions =
		{
			GateSetOpen	{Tag = "GateDunMora"},
			
			QuestSetSolved{Quest = "TalkToElvenAmbassador"},
			QuestSetActive{Quest = "OpenPortal"},
			
		},
		GotoState = "QuestState18",
	},
}


--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!        AB HIER PART 3       !!!!!!!!!!!!!!!!!!!!!!!!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


State
{
	StateName = "QuestState18",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
			QuestIsActive{Player = "default", Quest = "ReturnToGF"},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 1000},
			
			--QuestSetSolved{Quest = "OpenPortal"},
			--QuestSetSolved{Quest = "GFPart7ElvenAmbassador"},
			
			QuestSetSolved{Player = "default", Quest = "ReturnToGF"},
			QuestSetSolved{Player = "default", Quest = "DunMoraPart3Final"},
			QuestSetSolved{Quest = "3_Kapitel"},
			
			QuestSetActive{Quest = "4_Kapitel"},
			--QuestSetActive{Quest = "NightsongMustLiveTilGoS"},
			QuestSetActive{Quest = "GFPart10NightsongRescue"},
			QuestSetActive{Quest = "TalkToRedmund"},
		},
		GotoState = "QuestState19",
		-- Abfrage für NORMALEN SPIELVERLAUF: Falls Spieler auf Dun Mora war
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
			QuestIsNotActive{Player = "default", Quest = "ReturnToGF"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "OpenPortal"},
			QuestSetSolved{Quest = "GFPart7ElvenAmbassador"},
			QuestSetSolved{Quest = "3_Kapitel"},
			QuestSetActive{Quest = "4_Kapitel"},
			--QuestSetActive{Quest = "NightsongMustLiveTilGoS"},
			QuestSetActive{Quest = "GFPart10NightsongRescue"},
			QuestSetActive{Quest = "TalkToRedmund"},
		},
		GotoState = "QuestState19",
		-- Abfrage für Testhack über Konsolenkommandos
	},
}

State
{
	StateName = "QuestState19",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_ShadowsongKidnapperTold"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "TalkToRedmund"},
			QuestSetActive{Quest = "SearchNighsongNE"},
			
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneEast"},
			FogOfWarRevealAtEntity	{FogOfWarId = 45, Tag = "RS_BindstoneEast", Range = 15, Height = default},
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
			OR
			{
				AvatarFlagIsTrue{Name = "af_P304_KidnappedNightsongDiscovered"},
				AvatarFlagIsTrue{Name = "af_P304_ShadowsongFreed"},
			},
		},
		Actions =
		{
			QuestSetSolved{Quest = "SearchNighsongNE"},
			QuestSetActive{Quest = "DefeatHagardFinally"},
		},
		GotoState = "QuestState21",
	},
}

State
{
	StateName = "QuestState21",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_ShadowsongFreed"},
			MapFlagIsTrue{Name = "mf_GiveShadowsongAgainToAvatar"},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DefeatHagardFinally"},
			QuestSetActive{Quest = "TravelToNeedle"},
			
			PortalEnable{Tag = "PortalToNeedle"},
			FogOfWarRevealAtEntity	{FogOfWarId = 41, Tag = "PortalToNeedle", Range = 25, Height = default},
		},
	},
}