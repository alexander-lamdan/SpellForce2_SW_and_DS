--*******************************************************
--***                                                 ***
--***                  URAM GOR                       ***
--***                                                 ***
--*******************************************************

-- SchutzkreisVerhaltenEvent Funktion einladen
dofile(GetScriptPath() .. "SchutzkreisVerhalten.lua")

--Schutzkreisstandorte
Schutzkreis01X = 71
Schutzkreis01Y = 249 
Schutzkreis02X = 79
Schutzkreis02Y = 407
Schutzkreis03X = 273
Schutzkreis03Y = 491
Schutzkreis04X = 306
Schutzkreis04Y = 382
Schutzkreis05X = 215
Schutzkreis05Y = 133    

--Angriffszeiten der 6 verschiedenen DämonenTürme, Sobald das Tor zur Asche geöffnet wurde.
AngriffswelleTimerTower01 = 180
AngriffswelleTimerTower02 = 750
AngriffswelleTimerTower03 = 500
AngriffswelleTimerTower04 = 250
AngriffswelleTimerTower05 = 600
AngriffswelleTimerTower06 = 320

--Teleporter NQ BLutrache
Teleporter01X = 348
Teleporter01Y = 634
Teleporter02X = 432
Teleporter02Y = 541
TeleporterArenaX = 424
TeleporterArenaY = 600

--OrogLights
OrogLight01X = 425
OrogLight01Y = 656
OrogLight02X = 445
OrogLight02Y = 639
OrogLight03X = 443
OrogLight03Y = 615
OrogLight04X = 406
OrogLight04Y = 616
OrogLight05X = 406
OrogLight05Y = 639

--OrogWaveTimer
OrogWaveTimer = 60

--SklavenLevel
SklavenLevel = 8
SklavenID01 = 863
SklavenID02 = 864
SklavenID03 = 865
SklavenID04 = 866


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
    	Conditions =
    	{
    	
    	},
    	Actions =
    	{
    		MapFlagSetTrue	{Name = "mf_SchutzkreiseAktiviert"},
    		MapTimerStart	{Name = "mt_StadtFeuerSet"},
    		 	
		 			 	
		 	--NebenQuestAonirsAugenSet
		 	--QuestSetActive {Quest = "UramGorPart2EyesOfAonir"},
		 	MapFlagSetTrue	{Name = "mf_AonirsAugenQuestSet"},	 	
		 	--MapFlagSetTrue{Name = "mf_AonirsRechtesAugeInBesitz"},
			--MapFlagSetTrue{Name = "mf_AonirsLinkesAugeInBesitz"},
		 	DialogTypeSetSideQuest	{Tag = "AonirStatue"},
		 	DialogSetEnabled	{Tag = "AonirStatue"},
		 	DialogTypeSetSideQuest	{Tag = "Schrifttafel01"},
		 	DialogSetEnabled	{Tag = "Schrifttafel01"},
		 	DialogTypeSetSideQuest	{Tag = "Schrifttafel02"},
		 	DialogSetEnabled	{Tag = "Schrifttafel02"},
		 	DialogTypeSetSideQuest	{Tag = "Schrifttafel03"},
		 	DialogSetEnabled	{Tag = "Schrifttafel03"},
		 	DialogTypeSetSideQuest	{Tag = "Schrifttafel04"},
		 	DialogSetEnabled	{Tag = "Schrifttafel04"},
		 	
		 	
		 	--Building Add
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 150},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 152},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 153},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 154},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 158},
    		PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 021},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 029},
		
			--Lenyaübergabe um den Avatar wiederzubeleben
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 800},
		 		 	
		 	--NQ Blutrache
		 	MapFlagSetTrue {Name = "mf_OrogLight01On"},
		 	MapFlagSetTrue {Name = "mf_OrogLight02On"},
		 	MapFlagSetTrue {Name = "mf_OrogLight03On"},
		 	MapFlagSetTrue {Name = "mf_OrogLight04On"},
		 	MapFlagSetTrue {Name = "mf_OrogLight05On"},
		 	
		 	FigureVanish	{Tag = "Feuerwichtel01"},
		 	FigureVanish	{Tag = "Feuerwichtel02"},
		 	FigureVanish	{Tag = "Feuerwichtel03"},
		 	FigureVanish	{Tag = "Feuerwichtel04"},
		 	FigureVanish	{Tag = "Feuerwichtel05"},
		 	FigureVanish	{Tag = "Feuerwichtel06"},
		 	FigureVanish	{Tag = "Feuerwichtel07"},
		 	FigureVanish	{Tag = "Feuerwichtel08"},
		 	FigureVanish	{Tag = "Feuerwichtel09"},
		 	FigureVanish	{Tag = "Feuerwichtel10"},
		 	FigureVanish	{Tag = "Feuerwichtel11"},
		 	FigureVanish	{Tag = "Feuerwichtel12"},
		 	FigureVanish	{Tag = "Feuerwichtel13"},
		 	FigureVanish	{Tag = "Feuerwichtel14"},
		 	FigureVanish	{Tag = "Feuerwichtel15"},
		 	
		 	FigureVanish	{Tag = "Feuerwichtel16"},
		 	FigureVanish	{Tag = "Feuerwichtel17"},
		 	FigureVanish	{Tag = "Feuerwichtel18"},
		 	FigureVanish	{Tag = "Feuerwichtel19"},
		 	FigureVanish	{Tag = "Feuerwichtel20"},
		 	FigureVanish	{Tag = "Feuerwichtel21"},
		 	FigureVanish	{Tag = "Feuerwichtel22"},
		 	FigureVanish	{Tag = "Feuerwichtel23"},
		 	FigureVanish	{Tag = "Feuerwichtel24"},
		 	FigureVanish	{Tag = "Feuerwichtel25"},
		 	FigureVanish	{Tag = "Feuerwichtel26"},
		 	FigureVanish	{Tag = "Feuerwichtel27"},
		 	FigureVanish	{Tag = "Feuerwichtel28"},
		 	FigureVanish	{Tag = "Feuerwichtel29"},
		 	FigureVanish	{Tag = "Feuerwichtel30"},
		 	
		 	FigureVanish	{Tag = "OrogLight01burner"},
		 	FigureVanish	{Tag = "OrogLight02burner"},
		 	FigureVanish	{Tag = "OrogLight03burner"},
		 	FigureVanish	{Tag = "OrogLight04burner"},
		 	FigureVanish	{Tag = "OrogLight05burner"},
			
			--Spawngebäude werden auf brennend gestellt
			BuildingHealthSet	{Tag = "SpawnBuilding01", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding03", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding04", Percent = 60},
			BuildingHealthSet	{Tag = "SpawnBuilding05", Percent = 40},
			BuildingHealthSet	{Tag = "SpawnBuilding06", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding07", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding08", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding09", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding10", Percent = 40},
			
			BuildingHealthSet	{Tag = "SpawnBuilding11", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding12", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding13", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding14", Percent = 60},
			BuildingHealthSet	{Tag = "SpawnBuilding15", Percent = 40},
			BuildingHealthSet	{Tag = "SpawnBuilding16", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding17", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding18", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding19", Percent = 50},
		
			
			BuildingHealthSet	{Tag = "SpawnBuilding21", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding23", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding24", Percent = 60},
			BuildingHealthSet	{Tag = "SpawnBuilding25", Percent = 40},
			BuildingHealthSet	{Tag = "SpawnBuilding26", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding27", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding28", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding29", Percent = 50},
			
			
			
			BuildingHealthSet	{Tag = "SpawnBuilding32", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding33", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding34", Percent = 60},
			BuildingHealthSet	{Tag = "SpawnBuilding35", Percent = 40},
			BuildingHealthSet	{Tag = "SpawnBuilding36", Percent = 40},
			BuildingHealthSet	{Tag = "SpawnBuilding37", Percent = 70},
			
			BuildingHealthSet	{Tag = "SpawnBuilding39", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding40", Percent = 40},
			
			BuildingHealthSet	{Tag = "SpawnBuilding41", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding42", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding43", Percent = 70},
			
			
			BuildingHealthSet	{Tag = "SpawnBuilding46", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding47", Percent = 70},
			BuildingHealthSet	{Tag = "SpawnBuilding48", Percent = 30},
			BuildingHealthSet	{Tag = "SpawnBuilding49", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding50", Percent = 50},
			
			BuildingHealthSet	{Tag = "SpawnBuilding51", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnBuilding52", Percent = 50},
			
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen01", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen02", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen03", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen04", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen05", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen06", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen061", Percent = 50},
			BuildingHealthSet	{Tag = "SpawnpointUndeadCitizen07", Percent = 50},
		
       	},
		GotoState = "MainState"
	},
	
}

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "MainState",

	 -- Nyanos Brandy auch hier solven, falls der Spieler den Brandy schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		-- hat der Spieler Item.Misc.DwarfenBrandy
    		QuestIsActive {Quest = "HouseOfGreyNyanosBrandy"},
    		AvatarHasItemMisc {ItemId = 200, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyNyanosBrandy"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToNyano"},
    	}
    },

	OnOneTimeEvent
	{
		EventName = "Portal",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
		},
		Actions =
		{
			PlayerTravelDisable	{},
			PortalDisable	{Tag = "Start_Portal"},
			PortalDisable	{Tag = "End_Portal"},
			QuestSetActive {Quest = "UramGorPart1ToGate"},
			QuestSetActive {Quest = "ReachCamp"},
			--QuestSetActive {Quest = "UseCircles"},
		 	QuestSetActive {Quest = "OpenGate"},
			QuestSetSolved {Quest = "ToUramGor"},
			FogOfWarReveal	{X = 250, Y = 150, Range = 20, Height = 130},
			FogOfWarReveal	{X = 71, Y = 249, Range = 15, Height = 140},
		},
	},
	--Der zweite Schutzkreis wird aufgedeckt sobald der Spieler den ersten betreten hat...
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 71, Y = 249},			
		},
		Actions =
		{
			FogOfWarReveal	{X = 273, Y = 491, Range = 15, Height = 147},
		},
	},
	--Der dritte Schutzkreis wird aufgedeckt sobald der Spieler den zweiten betreten hat...
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 273, Y = 491},			
		},
		Actions =
		{
			FogOfWarReveal	{X = 306, Y = 382, Range = 15, Height = 145},
		},
	},
	--Der vierte Schutzkreis wird aufgedeckt sobald der Spieler den dritten betreten hat...
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 306, Y = 382},			
		},
		Actions =
		{
			FogOfWarReveal	{X = 256, Y = 130, Range = 15, Height = 130},
		},
	},
    
     --Tor SpielerStart02 öffnet sich wenn Avatar in die Nähe kommt
    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		 FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 4, X = 68, Y = 200},	
    	},
    	Actions =
    	{
    		GateSetOpen	{Tag = "DoorStart02"},
       	},
    },
  
	
	--Wenn der Spieler in die Nähe des ersten Altar des Lebens kommt wird dieser in die Spielerfarbe umgeändert
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 68, Y = 277},
			
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_BuildingPlayer"},    
		},
		
	},
	
	--Wenn der Spieler in die Nähe des zweiten Altar des Lebens kommt wird dieser in die Spielerfarbe umgeändert
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 284, Y = 109},
			MapFlagIsFalse {Name = "mf_AltarDesLebens02Aktiviert"}, 
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_BuildingPlayer02"},  
			MapFlagSetTrue {Name = "mf_AltarDesLebens02Aktiviert"},  
		},
		
	},
	

--XP Verteilung
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "EyeKeeperLeft"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_EyeKeeperLeftDead"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "EyeKeeperRight"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_EyeKeeperRightDead"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster2"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead2"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster3"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead3"},
		},
		
	},

	--Wenn der Spieler das ZwergenCamp erreicht hat
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 20},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 215, Y = 133},
			--FigureIsInRange	{Tag = "pl_HumanKor", Range = 10, X = 215, Y = 133},
			OR	
			{
				FigureIsInRange	{Tag = "OrkArbeiter01", Range = 10, X = 215, Y = 133},
				FigureIsInRange	{Tag = "OrkArbeiter02", Range = 10, X = 215, Y = 133},
				FigureIsInRange	{Tag = "OrkArbeiter03", Range = 10, X = 215, Y = 133},
				FigureIsInRange	{Tag = "OrkArbeiter04", Range = 10, X = 215, Y = 133},
				FigureIsInRange	{Tag = "OrkArbeiter05", Range = 10, X = 215, Y = 133},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_ZwergenCampErreicht"},
		},
		
	},
	
	--Game Over Bedingungen 01
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 10},
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "OrkArbeiter01"},
			FigureIsDead	{Tag = "OrkArbeiter02"},
			FigureIsDead	{Tag = "OrkArbeiter03"},
			FigureIsDead	{Tag = "OrkArbeiter04"},
			FigureIsDead	{Tag = "OrkArbeiter05"},
			MapFlagIsFalse {Name = "mf_ZwergenCampErreicht"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "pl_Human", Tag = "default", LocaTag = "GameOverHeroDeath"},
		},
		
	},
	
   
   ------------------------------------------------------------------------------------------
	--Neuer State wird initialisiert sobald der Spieler das ZwergenCamp erreicht hat
	OnOneTimeEvent
	{
		
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ZwergenCampErreicht"},
		},
		Actions =
		{
    		MapFlagSetTrue	{Name = "mf_UramGorPart2"},
			MapFlagSetFalse	{Name = "mf_SchutzkreiseAktiviert"},
		},
		
		GotoState = "UramGorPart2",
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
};


--*******************************************************
--***                                                 ***
--***                URAM GOR Part II                 ***
--***                                                 ***
--*******************************************************


State
{
	StateName = "UramGorPart2",

    OnOneTimeEvent
    {
    	-- Wenn Cutscene Tor beendet wurde
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "ReachCamp"},
			--QuestSetSolved	{Player = "pl_Human", Quest = "UseCircles"},
			--QuestSetSolved	{Player = "pl_Human", Quest = "RemoveBanestone"},
			QuestSetSolved	{Player = "pl_Human", Quest = "OpenGate"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "UramGorPart1ToGate"},
    		QuestSetActive {Quest = "UramGorPart3ThroughTheValley"},
    		QuestSetActive {Quest = "ThroughValley"},
		 	QuestSetActive {Quest = "DestroyTowers"},
		 	FogOfWarReveal	{X = 390, Y = 115, Range = 15, Height = 130},
		 	FogOfWarReveal	{X = 403, Y = 233, Range = 15, Height = 130},
		 	FogOfWarReveal	{X = 453, Y = 97, Range = 15, Height = 130},
		 	FogOfWarReveal	{X = 536, Y = 266, Range = 15, Height = 130},
		 	FogOfWarReveal	{X = 588, Y = 86, Range = 15, Height = 130},
		 	FogOfWarReveal	{X = 493, Y = 152, Range = 15, Height = 130},
		 	
		 	QuestSetActive {Quest = "KillStewart"},
		 	FogOfWarReveal	{X = 671, Y = 165, Range = 15, Height = 130},
		 	
		 	PlayerResourceSilverGive	{Amount = 5000},
		 	PlayerResourceLenyaGive	{Amount = 5000},
		 	PlayerResourceStoneGive	{Amount = 5000},
		 	--TorTimer wird gestartet
		 	--VisualTimerStart	{Seconds = 600},
		 	MapTimerStart	{Name = "mt_DemonGateOpen"},
		 	
		 	FigureOutcry	{Tag = "pl_HumanKor", TextTag = "Kor01"},
		 	FigureOutcry	{Tag = "pl_HumanKor", TextTag = "Kor02"},
		 	FogOfWarReveal	{X = 425, Y = 303, Range = 25, Height = 145},
		 	FogOfWarReveal	{X = 82, Y = 651, Range = 25, Height = 170},
		 	FogOfWarReveal	{X = 671, Y = 165, Range = 15, Height = 135},
		 	FigureOutcry	{Tag = "pl_HumanKor", TextTag = "Kor03"},
		 			 	
		 
		 	--Sorgt dafür das Malacay wieder verschwindet
		 	MapTimerStart	{Name = "mt_MalacayVanish"},
		 	--UntotenKi01 wird gestartet
			PlayerActivate	{Player = "pl_Untote1"},
			PlayerActivate	{Player = "pl_Untote2"},
			ObjectVanish	{Tag = "rock01"},
    		ObjectVanish	{Tag = "rock02"},
    		ObjectVanish	{Tag = "rock03"},
    		ObjectVanish	{Tag = "rock04"},
					
			--Timer für Demons
			--MapTimerStart	{Name = "mt_DemonSpawnAfterGateOpen"},
			
       	},
    },
   
   --Wenn der Spieler in die Nähe des zweiten Altar des Lebens kommt und dieser nach der 2 Cutszene aktiviert werden soll.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 284, Y = 109},
			MapFlagIsFalse {Name = "mf_AltarDesLebens02Aktiviert"}, 
			
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_BuildingPlayer02"},  
			MapFlagSetTrue {Name = "mf_AltarDesLebens02Aktiviert"},  
		},
		
	},
   
    --XP Verteilung
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadBoss01"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadBoss01Dead"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadBos02"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadBoss02Dead"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "DemonBoss"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_DemonBossDead"},
		},
		
	},
    
    --Abfrage ob DemonEnergyTower 01 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower01"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower01destoyed"},
    		TeamCastSpell	{Spell = 54, Power = 1, Team = "tm_Demon", X = 382, Y = 107},
    		
       	},
    },
     --Abfrage ob DemonEnergyTower 02 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower02"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower02destoyed"},
    		TeamCastSpell	{Spell = 53, Power = 1, Team = "tm_Team1", X = 422, Y = 238},
       	},
    },
     --Abfrage ob DemonEnergyTower 03 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower03"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower03destoyed"},
    		TeamCastSpell	{Spell = 97, Power = 1, Team = "tm_Demon", X = 443, Y = 85},
       	},
    },
     --Abfrage ob DemonEnergyTower 04 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower04"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower04destoyed"},
    		TeamCastSpell	{Spell = 53, Power = 1, Team = "tm_Team1", X = 541, Y = 257},
       	},
    },
     --Abfrage ob DemonEnergyTower 05 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower05"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower05destoyed"},
    		TeamCastSpell	{Spell = 92, Power = 1, Team = "tm_Demon", X = 569, Y = 89},
       	},
    },
     --Abfrage ob DemonEnergyTower 06 zerstört wurden
     OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		BuildingIsDead	{Tag = "DemonEnergyTower06"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonTower06destoyed"},
    		TeamCastSpell	{Spell = 54, Power = 1, Team = "tm_Demon", X = 502, Y = 148},
       	},
    },
    --Die Türme wurden zerstört
      OnOneTimeEvent
    {
    	
    
    	Conditions =
    	{
    		
			SetUpdateInterval {Steps = 10},
    		MapFlagIsTrue {Name = "mf_DemonTower01destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower02destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower03destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower04destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower05destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower06destoyed"},
    				
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "DestroyTowers"},
    		FigureOutcry	{Tag = "DemonKing", TextTag = "Truchsess01"},
		 	FigureOutcry	{Tag = "DemonKing", TextTag = "Truchsess02"},
		 	FigureOutcry	{Tag = "DemonKing", TextTag = "Truchsess03"},
		 	MapTimerStart	{Name = "mt_GateopenerTimer"},
       	},
    },
   
    --Die Tore gehen auf
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GateopenerTimer", Seconds = 2},
    	},
    	Actions =
    	{
    		GateSetOpen	{Tag = "GateDemon01"},
    		GateSetOpen	{Tag = "GateDemon02"},
    		GateSetOpen	{Tag = "GateDemon03"},
       	},
    },
      
    --Demons greifen an
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_DemonGateOpen", Seconds = 600},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_SpawnDemonAttackWaves"},
       	},
    },
    --Der Truchsess stirbt
      OnOneTimeEvent
    {
    	Conditions =
    	{
			SetUpdateInterval {Steps = 10},
    		FigureIsDead	{Tag = "DemonKing"}, 
    		MapFlagIsTrue {Name = "mf_DemonTower01destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower02destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower03destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower04destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower05destoyed"},
    		MapFlagIsTrue {Name = "mf_DemonTower06destoyed"},
    	
       	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_DemonKingDeath"},
    		MapFlagSetTrue {Name = "mf_P310_DemonKingDeath"},
       	},
    },
   --Der Truchsess stirbt
      OnOneTimeEvent
    {
    	Conditions =
    	{
			MapFlagIsTrue {Name = "mf_DemonKingDeath"},
    		MapFlagIsTrue {Name = "mf_DemonWhisperSpawn"},
       	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "DemonWhisper", TextTag = "Demon01"},
   			FigureOutcry	{Tag = "DemonWhisper", TextTag = "Demon02"},
    		FigureOutcry	{Tag = "DemonWhisper", TextTag = "Demon03"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "KillStewart"},
			QuestSetSolved	{Player = "pl_Human", Quest = "ThroughValley"},
			QuestSetSolved	{Player = "pl_Human", Quest = "UramGorPart3ThroughTheValley"},
			--QuestSetSolved	{Player = "pl_Human", Quest = "2_KapitelAkt2"},
			--QuestSetSolved	{Player = "pl_Human", Quest = "SF2_2_Akt"},
			QuestSetActive {Quest = "ThroughPortalToFF"},
			MapTimerStart {Name = "mt_DemonWhispervanish"},
			MapFlagSetTrue {Name = "mf_DemonEnd"},	
			PlayerTravelEnable	{},	
			PortalEnable	{Tag = "Start_Portal"},
			PortalEnable	{Tag = "End_Portal"}, 	
       	},
    },
 
	--XP Verteilung
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "EyeKeeperLeft"},
			MapFlagIsFalse {Name = "mf_P310_EyeKeeperLeftDead"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_EyeKeeperLeftDead"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "EyeKeeperRight"},
			MapFlagIsFalse {Name = "mf_P310_EyeKeeperRightDead"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_EyeKeeperRightDead"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster"},
			MapFlagIsFalse {Name = "mf_P310_UndeadMonsterDead"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster2"},
			MapFlagIsFalse {Name = "mf_P310_UndeadMonsterDead2"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead2"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
			FigureIsDead	{Tag = "UndeadMonster3"},
			MapFlagIsFalse {Name = "mf_P310_UndeadMonsterDead3"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P310_UndeadMonsterDead3"},
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
 
};



    	