------------------------------------------------------------------------
--
--	Wie fr¸her N 0, Handling von Vars, die f¸r mehrere Entities gelten etc
--
----------------------------------------------------------------------------

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "OpenGate",
		Conditions =
		{
		},
		Actions =
		{
			QuestSetActive {Quest = "SF2_2_Akt"},

			QuestSetSolved  {Quest = "1_KapitelAkt2"},
			QuestSetSolved  {Quest = "IronFieldsPart23FleeToGoS"},
			
			-- Hold Position Test f¸r Mauern
			FigureHoldPosition {Tag = "TestOrc1"},
			FigureHoldPosition {Tag = "TestOrc2"},
			FigureHoldPosition {Tag = "TestOrc3"},
			FigureHoldPosition {Tag = "TestOrc4"},
			FigureHoldPosition {Tag = "TestOrc5"},
			FigureHoldPosition {Tag = "TestOrc6"},
			FigureHoldPosition {Tag = "TestOrc7"},
			FigureHoldPosition {Tag = "TestOrc8"},
			FigureHoldPosition {Tag = "TestOrc9"},
			FigureHoldPosition {Tag = "TestOrc10"},
			FigureHoldPosition {Tag = "TestOrc11"},
			FigureHoldPosition {Tag = "TestOrc12"},
			FigureHoldPosition {Tag = "TestOrc13"},
			FigureHoldPosition {Tag = "TestOrc14"},
			FigureHoldPosition {Tag = "TestOrc15"},
			FigureHoldPosition {Tag = "TestOrc16"},
			FigureHoldPosition {Tag = "TestOrc17"},
			FigureHoldPosition {Tag = "TestOrc18"},
			FigureHoldPosition {Tag = "TestOrc19"},
			FigureHoldPosition {Tag = "TestOrc20"},
			FigureHoldPosition {Tag = "TestOrc21"},
			PlayerTravelDisable {},
			PortalDisable {Tag = "UramGor"},
			PortalDisable {Tag = "Needle"},
			PortalDisable {Tag = "MagnetStones"},
			PortalDisable {Tag = "TuscariWastelands"},
			PortalDisable {Tag = "PortalStart"},
			AvatarFlagSetTrue {Name = "af_P309_IVisitedGateOfSwords"},
			PlayerBuildingAdd {BuildingId = 149},
			PlayerBuildingAdd {BuildingId = 150},
		},
	},
}

-- Teil eins der Npc Part, Tor ˆffnen etc.
State
{
	StateName = "OpenGate",
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P307_DealAccepted"}
    	},
    	
    	-- Lenya¸bergabe an den Spieler, damit er Helden rufen kann
    	Actions =
    	{
    	},
    },

    -- Testcase
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
    	},
    	Actions =
    	{
    		FigureOutcry {Tag = "Osal", TextTag = "Osal1"},
    		FigureOutcry {Tag = "Osal", TextTag = "Osal2"},
    		EntityTimerStart {Name = "et_OsalDelay"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed {Name = "et_OsalDelay", Seconds = 10},
    		AvatarFlagIsTrue {Name = "af_P303_PrisonerFreed"},
    	},
    	Actions =
    	{
    		FigureOutcry {TextTag = "Avatar2", Tag = "pl_HumanAvatar"}
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed {Name = "et_OsalDelay", Seconds = 10},
    		AvatarFlagIsFalse {Name = "af_P303_PrisonerFreed"},
    	},
    	Actions =
    	{
    		-- FigureOutcry {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
    		FigureOutcry {TextTag = "Osal3", Tag = "Osal"},
    		FigureOutcry {TextTag = "Osal4", Tag = "Osal"},
    		FigureOutcry {TextTag = "Osal5", Tag = "Osal"},
    	}
    },
    -- Ist Mordecay in der Arena zum COmpanion geworden --> Zanza freischalten
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "SaveMordecayFromArena"},
    	},
    	Actions =
    	{
    		QuestSetActive {Quest = "TalkToZanzaAgain"},
    		DialogSetEnabled {Tag = "Zanza"},
    	}
    },
    -- Wen der Spieler Mardrag w‰hrend der Blumensuche tˆtet gibt es XP
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "FindFlowers"},
    		FigureIsDead {Tag = "Mardrag"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_MardragKilledDuringFlowerSearch"}
    	}
    },
    OnOneTimeEvent
    {
    	GotoState = "PartII",
    	Conditions =
    	{
    		QuestIsSolved {Quest = "3_KapitelAkt2"},
    	},
    	Actions =
    	{
    		
    	}
    },
    -- Wenn der Spieler die Grau suchen Quest hat und schon Entschuldigungen von Letho Åberbringen soll, muss finde Graus gelˆst werden
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyFindGreys"},
    		OR
    		{
    			AvatarFlagIsTrue {Name = "af_P309_WhatsUp"},
    			AvatarFlagIsTrue {Name = "af_P309_TellStory"}
    		}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyFindGreys"},
    	},
    },
     -- Nyanos Brandy auch hier solven, falls der Spieler den Brandy schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyNyanosBrandy"},
    		-- hat der Spieler Item.Misc.DwarfenBrandy
    		AvatarHasItemMisc {ItemId = 200, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyNyanosBrandy"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToNyano"},
    	}
    },
    -- Darios Dialog wieder anmachen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyReturnToDario"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "DarioGrey"}
    	}
    },
   
    -- Nyanos Brandy auch hier solven, falls der Spieler den Brndy schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyNyanosBrandy"},
    		-- hat der Spieler Item.Misc.DwarfenBrandy
    		AvatarHasItemMisc {ItemId = 200, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyNyanosBrandy"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToNyano"},
    	}
    },
    -- Rachequest
    OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillLakash"},
			FigureIsDead {Tag = "Lakash"},
			FigureIsDead {Tag = "LakashsWolf"},
			AvatarHasItemMisc {ItemId = 217, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RevengeKillLakash"},
			QuestSetActive {Quest = "RevengeBringLakashHead"}
		},
	},
	
	
}

State
{
	StateName = "PartII",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetEnabled {Tag = "IronLord"},
			PlayerTravelDisable {},
		},
	},
	-- GOS Part III kˆnnte also noch mal aufgespalten werden
	-- Hat man die Quest mit dem steinernen Gott werden die Lager angeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SolveStoneGodRiddle"}
		},
		Actions =
		{
			PlayerActivate {Player = "pl_Beast"}
		}
	},
	-- Nur wenn der Spieler auch die QUest hat die Items zu holen darf der Dialog angehen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = 56, Amount = 1},
    		AvatarHasItemMisc {ItemId = 57, Amount = 1},
    		QuestIsActive {Quest = "SolveStoneGodRiddle"}
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "StoneGod"},
    	}
    },
    -- Nur wenn der Spieler auch die QUest hat die Items zu holen darf der Dialog angehen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {Player = "default", ItemId = 57, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
    		QuestIsActive {Quest = "SolveStoneGodRiddle"}
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "StoneGod"},
    	}
    },
    -- Der Spieler hat Ragnar etc get;tet, das Portal geht auf
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			AND
    			{
    				FigureIsDead {Tag = "Ragnar"},
    				FigureIsDead {Tag = "RagnarArmy1"},
    				FigureIsDead {Tag = "RagnarArmy2"},
    				FigureIsDead {Tag = "RagnarArmy3"},
    				FigureIsDead {Tag = "RagnarArmy4"},
    				FigureIsDead {Tag = "RagnarArmy5"},
    				FigureIsDead {Tag = "RagnarArmy6"},
    				FigureIsDead {Tag = "RagnarArmy7"},
    				FigureIsDead {Tag = "RagnarArmy8"},
    			},
    			MapFlagIsTrue {Name = "mf_P309_SafetyFirst"},
    		},
    		
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_RagnarsArmyDead"},
    		PlayerTravelEnable {},
    		PortalEnable {Tag = "TuscariWastelands"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {Player = "default", ItemId = 56, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "StoneGod"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "TalkToZanzaAboutMagnetStones"},
    		FigureIsAlive {Tag = "Librarian"},
    	},
    	Actions =
    	{
    		FogOfWarRevealAtEntity {Tag = "Librarian", Range = 5}
    	}
    },
    -- Kor wird wieder "normal"
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved	{Quest = "ForgeRing"},
    	},
    	Actions =
    	{
    		PlayerHeroRemove {Tag = "Kor"},
    		FigureOutcry {TextTag = "System2", Tag = "System_Npc"},
    		MapFlagSetTrue {Name = "mf_P309_SpawnKorALastTime"}
    	}
    },
    -- Der Spieler betritt die Karte und hat auf Rushwater zwar von Berengar Grauquest angenommen, aber nicht mit Letho gesprochen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyLethoRushwaterStart"},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyLethoRushwaterStart"},
    		--QuestSetActive {Quest = "HouseOfGreyFindGreys"},
    	}
    },
    -- Wenn der Spieler die Grau suchen Quest hat und schon Entschuldigungen von Letho Åberbringen soll, muss finde Graus gelˆst werden
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyFindGreys"},
    		OR
    		{
    			AvatarFlagIsTrue {Name = "af_P309_WhatsUp"},
    			AvatarFlagIsTrue {Name = "af_P309_TellStory"}
    		}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyFindGreys"},
    	},
    },
     -- Nyanos Brandy auch hier solven, falls der Spieler den Brandy schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyNyanosBrandy"},
    		-- hat der Spieler Item.Misc.DwarfenBrandy
    		AvatarHasItemMisc {ItemId = 200, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyNyanosBrandy"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToNyano"},
    	}
    },
     -- Darios Dialog wieder anmachen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyReturnToDario"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "DarioGrey"}
    	}
    },
    -- Wenn der Spieler die Grau suchen Quest hat und schon Entschuldigungen von Letho Åberbringen soll, muss finde Graus gelˆst werden
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyFindGreys"},
    		OR
    		{
    			AvatarFlagIsTrue {Name = "af_P309_WhatsUp"},
    			AvatarFlagIsTrue {Name = "af_P309_TellStory"}
    		}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyFindGreys"},
    	},
    },
    -- Nyanos Brandy auch hier solven, falls der Spieler den Brandy schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyNyanosBrandy"},
    		-- hat der Spieler Item.Misc.DwarfenBrandy
    		AvatarHasItemMisc {ItemId = 200, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyNyanosBrandy"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToNyano"},
    	}
    },
    
    -- Rachequest
    OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillLakash"},
			FigureIsDead {Tag = "Lakash"},
			FigureIsDead {Tag = "LakashsWolf"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RevengeKillLakash"},
			QuestSetActive {Quest = "RevengeBringLakashHead"}
		},
	},
   
}
