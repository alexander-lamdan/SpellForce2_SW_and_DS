------------------------------------------------------------------------
--
--	Plattformscript P314 Tuscari Wasteland
--
----------------------------------------------------------------------------

State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasNotItemMisc{Player = "pl_Human", ItemId = 124, Amount = 1},
			-- nicht übergeben, wenn Spieler PILZ OF THE UBERCHAR hat	
		},
		Actions =
		{
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 159},
			-- Spieler erhält Keulenschnitzer
			
			-- Zarachtempel erst, sobald er ihn übergeben bekommen hat (nach 3. Cutscene)
			-- ebenso Heiligtum des Zorns
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 10},
			FigureIsAlive{Tag = "Torshak"},
			FigureIsDead{Tag = "RealmSoldier01"},
			FigureIsDead{Tag = "RealmSoldier02"},
			FigureIsDead{Tag = "RealmSoldier03"},
			FigureIsDead{Tag = "RealmSoldier04"},
			FigureIsDead{Tag = "RealmSoldier05"},
			FigureIsDead{Tag = "RealmSoldier06"},
			FigureIsDead{Tag = "RealmSoldier07"},
			FigureIsDead{Tag = "RealmSoldier08"},
			FigureIsDead{Tag = "RealmSoldier09"},
			FigureIsDead{Tag = "RealmSoldier10"},
			FigureIsDead{Tag = "RealmSoldier11"},
			FigureIsDead{Tag = "RealmSoldier12"},
			FigureIsDead{Tag = "RealmSoldier13"},
			FigureIsDead{Tag = "RealmSoldier14"},
			FigureIsDead{Tag = "RealmSoldier15"},
			FigureIsDead{Tag = "RealmSoldier16"},
			FigureIsDead{Tag = "RealmSoldier17"},
			FigureIsDead{Tag = "RealmSoldier18"},
			FigureIsDead{Tag = "RealmSoldier19"},
			FigureIsDead{Tag = "RealmSoldier20"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P314_Cutscene01Begin"},
		},
	},
	
    

    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P314_CS01Finished"},
    	},
    	Actions =
    	{
    		PlayerKitTransfer{Player = "pl_Human", PlayerKit = "pk_Uebergabe"},
    		-- Aufbau wird übergeben, sobald 1. Cutscene beendet wurde
    		
    		FogOfWarReveal	{X = 383.835, Y = 173.758, Range = 40, Height = default},
    		-- Aufbauplatz wird aufgedeckt
    		
    		FigurePlayerTransfer	{Tag = "Ork01", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork02", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork03", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork04", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork05", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork06", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork07", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork08", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork09", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork10", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork11", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork12", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork13", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork14", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork15", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork16", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork17", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork18", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork19", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork20", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork21", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork22", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork23", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Ork24", Player = "pl_Human"},
    		-- überlebende Orks werden übergeben
    	},
    },
    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead{Tag = "OutpostChief"},
    		FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 20, X = 378 , Y = 175},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P314_OrcCampFreed"},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureTeamIsInRange{Team = "tm_Team1", Range = 20, X = 378 , Y = 175},
    	},
    	Actions =
    	{
    		FigureOutcry{TextTag = "TheyCome01", Tag = "Reetho"},
    		FigureOutcry{TextTag = "TheyCome02", Tag = "Sym"},
    		FigureOutcry{TextTag = "TheyCome03", Tag = "Eisenfuerst"},
    		FigureOutcry{TextTag = "TheyCome04", Tag = "Eisenfuerst"},
    	},
    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P314_OrcCampFreed"},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P314_Cutscene02Begin"},
    	}, -- sobald der Außenposten befreit wurde
    	-- beginnt die 2. Cutscene
    },
    
    
    OnOneTimeEvent
    -- Wenn Shygalla erschien und dann getötet wurde, wird
    -- 'SorokMissionFulfilled' auf true gesetzt
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_ShygallaSpawned"},
    		FigureIsDead{Tag = "Shygalla"},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P314_SorokMissionFulfilled"},
    	},
    },
 
 
 	OnOneTimeEvent
    -- Wenn die SoulSacrifice gewählt wurde und Sorok bis zur 6. Höhle kam, wird
    -- 'SorokMissionFulfilled' auf true gesetzt
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P314_SoulSacrifice"},
    		AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 7},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P314_SorokMissionFulfilled"},
    	},
    },
 
 
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			AvatarFlagIsTrue{Name = "af_P314_SorokMissionFulfilled"},
 		},
 		Actions =
 		{
 			AvatarFlagSetTrue {Name = "af_P314_Cutscene03Begin"},
 		},
 	},
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P314_CS03Finished"},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P314_GriffonsAttack"},
    		-- Greifen greifen jetzt an
    		PlayerActivate	{Player = "pl_EndHQRealm"},
    		PlayerKitTransfer{Player = "pl_Human", PlayerKit = "pk_Zarach"},
    		MapTimerStart{Name = "mt_CountdownTillGateOpens"},
    		
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 160},
			-- Spieler erhält Heiligtum des Zorns
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 35 },
			-- Spieler erhält Zarachtempel
			
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed{Name = "mt_CountdownTillGateOpens", Seconds = 120},
    	},
    	Actions =
    	{
    		GateSetOpen	{Tag = "HQGate01"},
    		GateSetOpen	{Tag = "HQGate02"},
    		FigureOutcry{TextTag = "Aramin01", Tag = "Aramin"},
    		FigureOutcry{TextTag = "Aramin02", Tag = "Aramin"},
    		FigureOutcry{TextTag = "IronLord03", Tag = "Eisenfuerst"},
    		FigureOutcry{TextTag = "IronLord04", Tag = "Eisenfuerst"},
    	},
    },
    
    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		BuildingIsDead{Tag = "EndHQ"},
    		PlayerHasNotBuildingAmount{Player = "pl_EndHQRealm", Amount = 3, OnlyCompleted = default},
    		PlayerHasNotFigureAmountEx	{Player = "pl_EndHQRealm", Amount = 5, CountWorkers = false, CountAvatarAndHeroes = false},
    		--PlayerHasNotFigureAmount{Player = "pl_EndHQRealm", Amount = 1},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P314_EndHQKilled"},
    		AIPlayerDeactivate	{Player = "pl_EndHQRealm"},
    		FigureOutcry{TextTag = "IronLord06", Tag = "Eisenfuerst"},
    		FigureOutcry{TextTag = "IronLord07", Tag = "Eisenfuerst"},
    	},
    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead{Tag = "Sorok"},
    		AvatarFlagIsFalse{Name = "af_P314_SorokMissionFulfilled"},
    	},
    	Actions =
    	{
    		--FigureOutcry{TextTag = "TesterInfo01", Tag = "Avatar"},
    		--PlayerGameOver	{Player = "pl_Human"},
    		PlayerGameOver	{Player = "pl_Human", Tag = "Sorok_DEAD", LocaTag = "GameOverSF2SorokDied"},
    	},
    	-- falls Sorok stirbt, bevor seine Mission erfüllt wurde
    	-- herrscht Game Over
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead{Tag = "Eisenfuerst"},
    	},
    	Actions =
    	{
    		PlayerGameOver	{Player = "pl_Human", Tag = "Eisenfuerst_DEAD", LocaTag = "GameOverSF2IronlordDied"},
    	},
    	-- falls Eisenfuerst stirbt,
    	-- herrscht Game Over
    },
    
    
   -- Dark Legion Axtkopf
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {Amount = 1, ItemId = 238},
    		AvatarHasItemMisc {Amount = 1, ItemId = 237},
    		QuestIsKnown {Quest = "DarkLegionSearchAxeblade"}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "DarkLegionSearchAxeblade"},
    		QuestSetSolved {Quest = "GoSDarkLegion"},
    		AvatarItemMiscTake {ItemId = 238, Amount = 1},
    		AvatarItemMiscTake {ItemId = 237, Amount = 1},
    		AvatarItemEquipmentGive	{ItemId = 539, Amount = 1},
    		FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "LegionAxe1"}
    	},
    },
    
    ----------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills ---------------------------------
	----------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Sym"},
			-- Sergeant Sym im Vorposten
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_SergeantSymKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Aramin"},
			-- General Aramin im Hauptlager
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_GeneralAraminKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Steinklaue"},
			-- Großer Raptor auf Weg hinab zum Camp
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_BossRaptorKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			FigureIsDead{Tag = "OberWaechterin"}, 
		},
		-- Sehr dicke Spinne im Südosten der Karte
		Actions = 
		{ 
			MapFlagSetTrue{ Name = "mf_BossSpiderKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapFlagIsTrue {Name = "mf_ShygallaSpawned"},
			FigureIsDead{Tag = "Shygalla"}, 
		},
		-- Shygalla gekillt
		Actions = 
		{ 
			MapFlagSetTrue{ Name = "mf_ShygallaKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Alle Greifen gekillt
		Conditions =
		{
			SetUpdateInterval {Steps = 10},
			FigureIsDead{Tag = "GriffonA01"},
			FigureIsDead{Tag = "GriffonA02"},
			FigureIsDead{Tag = "GriffonA03"},
			FigureIsDead{Tag = "GriffonB01"},
			FigureIsDead{Tag = "GriffonB02"},
			FigureIsDead{Tag = "GriffonB03"},
			FigureIsDead{Tag = "GriffonC01"},
			FigureIsDead{Tag = "GriffonC02"},
			FigureIsDead{Tag = "GriffonC03"},
			FigureIsDead{Tag = "GriffonD01"},
			FigureIsDead{Tag = "GriffonD02"},
			FigureIsDead{Tag = "GriffonD03"},
			FigureIsDead{Tag = "GriffonE01"},
			FigureIsDead{Tag = "GriffonE02"},
			FigureIsDead{Tag = "GriffonE03"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_GriffonsKilled"},
		},
	},
	
 	-- Der Spieler sucht die Axt
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			QuestIsActive {Quest = "DarkLegionSearchAxeblade"},
 			AvatarHasItemMisc {ItemId = 237, Amount = 1},
 			AvatarHasItemMisc {ItemId = 238, Amount = 1},
 		},
 		Actions =
 		{
 			QuestSetSolved {Quest = "DarkLegionSearchAxeblade"},
 			AvatarItemMiscTake {ItemId = 237, Amount = 1},
 			AvatarItemMiscTake {ItemId = 238, Amount = 1},
 			AvatarItemEquipmentGive {ItemId = 539, Amount = 1},
 		}
 	},
 	-- Der Spieler findet die Axt ohne sie zu suchen
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			QuestIsNotKnown {Quest = "DarkLegionSearchAxeblade"},
 			AvatarHasItemMisc {ItemId = 237, Amount = 1},
 			AvatarHasItemMisc {ItemId = 238, Amount = 1},
 		},
 		Actions =
 		{
 			QuestSetActive {Quest = "DarkLegionSearchAxeblade"},
 			QuestSetSolved {Quest = "DarkLegionSearchAxeblade"},
 			AvatarItemMiscTake {ItemId = 237, Amount = 1},
 			AvatarItemMiscTake {ItemId = 238, Amount = 1},
 			AvatarItemEquipmentGive {ItemId = 539, Amount = 1},
 		}
 	},
 	--Axtspawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 481, Y = 494},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 862, X = 481, Y = 494, Tag = "Axe", Direction = 27},
			ObjectLootItemMiscAdd	{Tag = "AxeBlade", ItemId = 238},
			
		}
	},
 	-- hat der Spieler sowohl Rüstung als auch Axt, kann auch die Mainquest gesolved werden
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			QuestIsSolved {Quest = "DarkLegionSearchPartsNorthOfWall"},
 			QuestIsSolved {Quest = "DarkLegionSearchAxeblade"},
 		},
 		Actions =
 		{
 			QuestSetSolved {Quest = "GoSDarkLegion"}
 		}
 	}
}