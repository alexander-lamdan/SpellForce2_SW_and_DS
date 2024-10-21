PortalX = 297.275
PortalY = 371.505
-- Koordinaten des Portals zum Laboreingang (Klangrätsel-Altar)

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
		},
		Actions =
		{
			--PortalDisable{Tag = "PortalToSteelShore"},
			--PortalDisable{Tag = "PortalToSongglass"},
			--PortalDisable{Tag = "Portal_Start"},
			
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "CrystalWastesPart1ToCrystalForest"},
			QuestSetActive {Quest = "CrystalForestPart1CrystalMountain"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 20, Tag = "Erdessenz", Range = 20, Height = default},
			-- FOW um die Erdessenz aufdecken
		}, 
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindEarthEssence"},
			AvatarHasItemMisc	{ItemId = 55, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindEarthEssence"},
			QuestSetSolved {Quest = "CrystalWastesPart2GargoyleTome"},
		}, -- Wenn man die Erdessenz gefunden hat
		-- wird Quest ausgegraut
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P319_CS02Finished"},
		},
		Actions =
		{
			QuestSetActive {Quest = "UseShadowsToOpenGates"},
			
			PlayerResourceSilverGive{Player = "pl_Human", Amount = 1000},
			PlayerResourceLenyaGive{Player = "pl_Human", Amount = 1000},
			PlayerResourceStoneGive{Player = "pl_Human", Amount = 1000},
		},
		-- kommt der Spieler in die Nähe des gut bewachten Tores, startet
		-- die 2. Cutscene
		-- und der Spieler bekommt die Quest "Schleich die mit dem Unsichtbaren
		-- rein und öffne von innen die Tore"
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
			QuestIsActive {Quest = "FindEarthEssence"},
			AvatarHasItemMisc	{ItemId = 55, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindEarthEssence"},
			QuestSetSolved {Quest = "CrystalWastesPart2GargoyleTome"},
		}, -- Erdessenz-Quest wird hier ebenfalls nochmal kontrolliert
		-- falls der Spieler sie erst nachträglich holt
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "UseShadowsToOpenGates"},
			AvatarFlagIsTrue{Name = "af_P319_OneGateOpenend"},	
		},
		Actions =
		{
			QuestSetSolved {Quest = "UseShadowsToOpenGates"},
			QuestSetActive {Quest = "ReachLabOnMountain"},
			QuestSetActive {Quest = "DestroyRealmGuards"},
		}, -- sobald Avatar eines der Tore geöffnet hat, bekommt
		-- er die Quest "Geh zum Labor"
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
			QuestIsActive {Quest = "FindEarthEssence"},
			AvatarHasItemMisc	{ItemId = 55, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindEarthEssence"},
			QuestSetSolved {Quest = "CrystalWastesPart2GargoyleTome"},
		}, -- Erdessenz-Quest wird hier ebenfalls nochmal kontrolliert
		-- falls der Spieler sie erst nachträglich holt
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "DestroyRealmGuards"},
			AvatarFlagIsTrue{Name = "af_P319_EnemyHQDestroyed"},	
		},
		Actions =
		{
			QuestSetSolved{Quest = "DestroyRealmGuards"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10 , X = PortalX, Y = PortalY},
		},
		Actions =
		{
			QuestSetActive{Quest = "GetCrystalPiecesForGate"},
			
			FogOfWarRevealAtEntity	{Tag = "Crystal01", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{Tag = "Crystal02", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{Tag = "Crystal03", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{Tag = "Crystal04", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{Tag = "Crystal05", Range = 15, Height = default},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "GetCrystalPiecesForGate"},
			AvatarHasItemMisc{ItemId = 58 , Amount = 1 },
			AvatarHasItemMisc{ItemId = 59 , Amount = 1 },
			AvatarHasItemMisc{ItemId = 60 , Amount = 1 },
			AvatarHasItemMisc{ItemId = 61 , Amount = 1 },
			AvatarHasItemMisc{ItemId = 62 , Amount = 1 },
		},
		Actions =
		{
			QuestSetSolved{Quest = "GetCrystalPiecesForGate"},
			QuestSetActive{Quest = "FindMelodyToOpenFinalGate"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "FindMelodyToOpenFinalGate"},
			AvatarFlagIsTrue{Name = "af_P319_SoundRiddleSolved"}, 
		},
		Actions =
		{
			QuestSetSolved{Quest = "FindMelodyToOpenFinalGate"},
			
			AvatarItemMiscTake{ItemId = 58 , Amount = 1 },
			AvatarItemMiscTake{ItemId = 59 , Amount = 1 },
			AvatarItemMiscTake{ItemId = 60 , Amount = 1 },
			AvatarItemMiscTake{ItemId = 61 , Amount = 1 },
			AvatarItemMiscTake{ItemId = 62 , Amount = 1 },
		},
		GotoState = "QuestState03_a"
	},
}

State
{
	StateName = "QuestState03_a",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "ReachLabOnMountain"},
			AvatarFlagIsTrue {Name = "af_P319_CS03Finished"},
			-- falls Laborcutscene gelaufen ist
		},
		Actions =
		{
			QuestSetSolved{Quest = "ReachLabOnMountain"},
			QuestSetSolved{Quest = "CrystalForestPart1CrystalMountain"},
			QuestSetActive{Quest = "CrystalForestPart2TheLab"},
			QuestSetActive{Quest = "SearchForPortalPieces"},
			QuestSetActive{Quest = "InsertPortalPieces"},
		},
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
			QuestIsActive {Quest = "FindEarthEssence"},
			AvatarHasItemMisc	{ItemId = 55, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindEarthEssence"},
			QuestSetSolved {Quest = "CrystalWastesPart2GargoyleTome"},
		}, -- Erdessenz-Quest wird hier ebenfalls nochmal kontrolliert
		-- falls der Spieler sie erst nachträglich holt
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "DestroyRealmGuards"},
			AvatarFlagIsTrue{Name = "af_P319_EnemyHQDestroyed"},	
		},
		Actions =
		{
			QuestSetSolved{Quest = "DestroyRealmGuards"},
		}, -- "Zerstöre Realm-HQ" wird hier noch einmal kontrolliert
		-- falls der Spieler es nachträglich nachholt
	},
	
	
	--------------------------------------------------------------
	--- ABFRAGEN FÜR DIE 8 SCHABLONEN 
	--- SOBALD DER SPIELER SIE ZUM ERSTEN MAL FINDET
	--- WIRD EIN ZAEHLER ERHOEHT
	--- IST DER ZAEHLER = 8, DANN WIRD DIE QUEST
	--- "SEARCHFORPIECES" GESOLVED
	--------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 63, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 64, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 65, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 66, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 67, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 68, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 69, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{ItemId = 70, Amount = 1},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P319_StencilsCollected", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "SearchForPortalPieces"},
			AvatarValueIsEqual{Name = "av_P319_StencilsCollected", Value = 8},
		},
		Actions =
		{
			QuestSetSolved{Quest = "SearchForPortalPieces"},
		},
	},
	
	
	-----------------------------ENDE !-----------------------------
	--- ABFRAGEN FÜR DIE 8 SCHABLONEN 
	--- SOBALD DER SPIELER SIE ZUM ERSTEN MAL FINDET
	--- WIRD EIN ZAEHLER ERHOEHT
	--- IST DER ZAEHLER = 8, DANN WIRD DIE QUEST
	--- "SEARCHFORPIECES" GESOLVED ----------------------- ENDE!
	--------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive{Quest = "InsertPortalPieces"},
			MapFlagIsTrue{Name = "mf_StencilRiddleSolved"},
		},
		Actions =
		{
			PlayerTravelEnable{},
			
			PortalEnable{Tag = "PortalToSteelShore"},
			PortalEnable{Tag = "PortalToSongglass"},
			PortalEnable{Tag = "Portal_Start"},
			
			QuestSetSolved{Quest = "InsertPortalPieces"},
			QuestSetActive{Quest = "TravelThroughtPortalToSteelShore"},
		},
	},
	
	
}