
FirstWaveTime = 500
--FirstWaveTime = 500 (sollte 500 sein! Wert 1000 nur für JoWooD)
-- Nach Beendigung von Cutscene 01 dauert es so lange, bis die gescriptete Orkwelle losläuft
FirstWaveOutcryDelay = 30
-- Nach FirstWaveTime + FirstWaveOutcryDelay kommt der Outcry "Sie kommen"

FootSoldierCountdown = 120
AirForceCountdown = 360
-- Sekunden nach dem Ende der 2. Cutscene, bis die Fußsoldaten und dieAirforce ihre Wellen startet



POSXHQ1 = 188
POSYHQ1 = 512
POSXHQ2 = 435
POSYHQ2 = 322
POSXHQ3 = 459
POSYHQ3 = 151
POSXHQBulwark = 597
POSYHQBulwark = 505
-- X- und Y-Koordinaten der 3 feindlichen Haupthäuser und Bulwark





State
{
	StateName = "MainState",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{	
			-- 1. Cutscene
			AvatarFlagSetTrue {Name = "af_P307_Cutscene01"},
			FogOfWarTeamAdd	{Team = "tm_Team1"},
		},
		-- Zur Sicherheit wird Team 1 nochmal ins FOWAdd reingenommen
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MatricusDialogFinished"},
		},
		Actions =
		{
			PlayerKitTransfer	{PlayerKit = "pk_HumUebergabe"},
		},
		-- nach dem Dialog mit Matricus wird das HQ übergeben
	},




	---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	---+                        Getimete Orkwelle                             +
	---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CS01Finished"},
			-- wenn die Cutscene 1 beendet ist
		},
		Actions =
		{
			MapTimerStart  {Name = "mt_OrcWaveTimer"},
			-- wird ein Timer für die OrcWave gestellt
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_OrcWaveTimer", Seconds = FirstWaveTime},
			-- X Sekunden nach dem Starten des OrcWaveTimers
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_OrcWaveGo"},
			-- bekommen die Orcs ihr "Go"
		},
	},	

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_OrcWaveTimer", 
			Seconds = (FirstWaveTime + FirstWaveOutcryDelay)},
			-- X Sekunden nach dem Starten des OrcWaveTimers
		},
		Actions =
		{
			FigureOutcry{TextTag = "Warning01", Tag = "Einar"},
			-- Outcry "Sie kommen!"
		},
	},	

	---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	---+                        Getimete Orkwelle                             +
	---+                               Ende                                   +
	---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






	---!----------------------------------------------------------------!
	---!                           2. Cutscene                          !
	---!         sobald die erste Orkwelle geschlagen wurde             !
	---!----------------------------------------------------------------!

	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 20},
			FigureIsDead {Tag = "OrcWave01"},
			FigureIsDead {Tag = "OrcWave02"},
			FigureIsDead {Tag = "OrcWave03"},
			FigureIsDead {Tag = "OrcWave04"},
			FigureIsDead {Tag = "OrcWave05"},
			FigureIsDead {Tag = "OrcWave06"},
			FigureIsDead {Tag = "OrcWave07"},
			FigureIsDead {Tag = "OrcWave08"},
			
			FigureIsDead {Tag = "OrcWave10"},
			FigureIsDead {Tag = "OrcWave11"},
			FigureIsDead {Tag = "OrcWave12"},
			
			FigureIsDead {Tag = "OrcWave14"},
			FigureIsDead {Tag = "OrcWave15"},
			FigureIsDead {Tag = "OrcWave16"},
			FigureIsDead {Tag = "OrcWave17"},
			
			FigureIsDead {Tag = "OrcWave19"},
			FigureIsDead {Tag = "OrcWave20"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Cutscene02"},
			PlayerActivate	{Player = "pl_Feind-AI_2"},
		},
	},

	---!----------------------------------------------------------------!
	---!                    2. Cutscene - Ende                          !
	---!----------------------------------------------------------------!




	---!----------------------------------------------------------------!
	---!       Matricus darf nicht sterben - sonst Game Over            !
	---!----------------------------------------------------------------!
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse{Name = "mf_MatricusGoHome"},
			FigureIsDead {Tag = "Matricus"},
		},
		Actions =
		{
			--FigureOutcry{TextTag = "QAInfo03", Tag = "pl_HumanAvatar"},
			PlayerGameOver	{Player = "pl_Human", Tag = "Matricus_DEAD", LocaTag = "GameOverSF2MatricusDied"},
		},
	},




	---!----------------------------------------------------------------!
	---!                 Befreiung von Greifen-Horst                     !
	---!----------------------------------------------------------------!
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 20},
			FigureIsDead{ Tag = "OrcGriffonWarden01" },
			FigureIsDead{ Tag = "OrcGriffonWarden02" },
			FigureIsDead{ Tag = "OrcGriffonWarden03" },
			FigureIsDead{ Tag = "OrcGriffonWarden04" },
			FigureIsDead{ Tag = "OrcGriffonWarden05" },
			FigureIsDead{ Tag = "OrcGriffonWarden06" },
			FigureIsDead{ Tag = "OrcGriffonWarden07" },
			FigureIsDead{ Tag = "OrcGriffonWarden08" },
			FigureIsDead{ Tag = "OrcGriffonWarden09" },
			
			MapFlagIsTrue { Name = "mf_PlayerGotTaskToFreeGriffons"},
			-- wird im Questbook-Script true gesetzt
			-- Sicherheitsabfrage, daß man den Aufbaupart nicht komplett aushebeln kann (bug 19412)
		},
		Actions =
		{
			AvatarFlagSetTrue { Name = "af_P307_GriffonsFree" },
			PlayerKitTransfer {Player = "pl_Human", PlayerKit = "pk_GriffonHut"},
			PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 14 },
		},
		-- Spieler bekommt Greifenhorst direkt (Playerkit) und als Gebäudeplan
	},	

	---!----------------------------------------------------------------!
	---!           Befreiung des Greifenhorsts - ENDE                   !
	---!----------------------------------------------------------------!





	


	---##########################################################################
	---###                                                                    ###
	---###                      MAIN-MILITARY-KREMPEL                         ###
	---###                                                                    ###
	---##########################################################################
	
	
	
	--- Scriptverhalten Truppen Einar & Karan
	--- Wenn Angriff-Auftrag gegeben, starte Map-Timer
	--- Wenn Maptimer abgelaufen (5 Minuten), dann setze Avatarflag "Go!" true
	--- Nach 5,1 Minuten setze Avatarflag "Go!" false, starte Avatar-Timer neu
	--- Auf Figurenebene: Wenn Avatarflag "Go!" true und Entity auf ihr persönliches "Greif an!"
	--- wartet, dann setze Entityflag "Greif an!" auf true (und warte nicht länger auf
	--- persönliches "Greif an!"
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_Cutscene02"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_AlliedTroopWaveTimer"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_AlliedTroopWaveTimer", Seconds = 30},
			EntityFlagIsFalse {Name = "ef_DoNotExecuteThisEventTwice"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_GlobalTroopsGo"},
			EntityFlagSetTrue {Name = "ef_DoNotExecuteThisEventTwice"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_AlliedTroopWaveTimer", Seconds = 35},
		},
		Actions =
		{
			AvatarFlagSetFalse {Name = "af_P307_GlobalTroopsGo"},
			MapTimerStart {Name = "mt_AlliedTroopWaveTimer"},
			EntityFlagSetFalse {Name = "ef_DoNotExecuteThisEventTwice"},
		},
	},
	
	
	------------ OUCTRIES ------------------------
	---!!! Outrcies, wenn Camps geplättet wurden
   
   OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ1"},
			AvatarFlagIsTrue {Name = "af_P307_EinarAttack01"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "EinarCamp1Busted", Tag = "Einar"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ2"},
			AvatarFlagIsTrue {Name = "af_P307_EinarAttack02"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "EinarCamp2Busted", Tag = "Einar"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ3"},
			AvatarFlagIsTrue {Name = "af_P307_EinarAttack03"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "EinarCamp3Busted", Tag = "Einar"},
		},
	},
   
   
   OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ1"},
			AvatarFlagIsTrue {Name = "af_P307_KaranAttack01"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "KaranCamp1Busted", Tag = "Karan"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ2"},
			AvatarFlagIsTrue {Name = "af_P307_KaranAttack02"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "KaranCamp2Busted", Tag = "Karan"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ3"},
			AvatarFlagIsTrue {Name = "af_P307_KaranAttack03"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "KaranCamp3Busted", Tag = "Karan"},
		},
	},
   
   ---!!! ENDE: Outrcies, wenn Camps geplättet wurden
	
	
	
	
	
	---!!! Überprüfung der drei gegnerischen Camps: Sind sie platt?
	--- Falls ja, verlieren die Einar & Karan die betreffenden Aufträge 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ1"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Camp1Busted"},
			
			AvatarFlagSetFalse {Name = "af_P307_EinarAttack01"},
			AvatarFlagSetFalse {Name = "af_P307_KaranAttack01"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ2"},

		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Camp2Busted"},
			
			AvatarFlagSetFalse {Name = "af_P307_EinarAttack02"},
			AvatarFlagSetFalse {Name = "af_P307_KaranAttack02"},
		},
	},
  
  	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "FoeHQ3"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Camp3Busted"},
			
			AvatarFlagSetFalse {Name = "af_P307_EinarAttack03"},
			AvatarFlagSetFalse {Name = "af_P307_KaranAttack03"},
		},
	},
  
   ---!!! ENDE: Überprüfung der drei gegnerischen Camps: Sind sie platt?
   
   
   OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "PatrolSpawnA"},
			BuildingIsDead{Tag = "PatrolSpawnB"},
			BuildingIsDead{Tag = "FoeHQBulwark"},
			BuildingIsDead{Tag = "PatrolSpawnD"},
			BuildingIsDead{Tag = "PatrolSpawnE"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_CampBulwarkBusted"},
			
			AvatarFlagSetFalse {Name = "af_P307_EinarAttackBulwark"},
			AvatarFlagSetFalse {Name = "af_P307_KaranAttackBulwark"},
		},
	},
  
   ---!!! ENDE: Überprüfung des Bulwarks?: Sind sie platt?
  
  
  
	---!----------------------------------------------------------------!
	---!                   Angriffe der Flugeinheiten                   !
	---!                    aus dem Flugeinheitencamp                   !
	---!                  und den beiden Lagern starten                 !
	---!----------------------------------------------------------------!
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
			-- hängt bisher noch an Ende der 2. Cutscene (evtl. später)
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OrcAttackTimer"},
			
			FogOfWarReveal	{X = 177.345, Y = 385.378, Range = 30, Height = default},
			FogOfWarReveal	{X = 267.653, Y = 156.316, Range = 30, Height = default},
			-- Die Lager von Einar und Karan werden aufgedeckt
		},
	},
  
  
 	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OrcAttackTimer", Seconds = FootSoldierCountdown},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_OrcAttacksStart"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OrcAttackTimer", Seconds = AirForceCountdown},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_AirForceAttackStart"},
		},
	},
  
  
	---!----------------------------------------------------------------!
	---!                     Die Dunkelelfen werden                     !
	---!                       aggro auf die Orcs                       !
	---!----------------------------------------------------------------!
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
		},
		Actions =
		{
			MapTimerStart{Name = "mt_WaitBeforeBulwarkAggroStarts"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_WaitBeforeBulwarkAggroStarts", Seconds = 120},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_DarkElvesGetAggro"},
		},
	},
    

  	---##########################################################################
	---###                       you're leaving now                           ###
	---###                      MAIN-MILITARY-KREMPEL                         ###
	---###                 Auf Wiedersehen in diesem Theater                  ###
	---########################################################################## 





	-- Weitere Outcries
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue { Name = "af_P307_TacticChosen"},
			AvatarFlagIsFalse { Name = "af_P307_GriffonsFree" },
		},
		Actions =
		{
			FigureOutcry{TextTag = "Matricus01", Tag = "Matricus"},
		}, -- Matricus: "Vergesst nicht, wir müssen die Greifen befreien!"
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse{ Name = "af_P307_GriffonsFree" },
			FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "GriffonHut", Range = 10},
		},
		Actions =
		{
			FigureOutcry{TextTag = "Matricus02", Tag = "Matricus"},
		}, -- Matricus: "Da ist die Zitadelle der Greifen! Vertreibt die Angreifer!"
	},

	-------------------------------
	-------------------------------


	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CampBulwarkBusted"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_KeyOrcsSpawn"},
		},-- sobald Bulwark platt, spawnen die KeyOrcs
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_KeyOrcsSpawn"},
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 43, Amount = 1},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Rampart_Gate01"},
			AvatarFlagSetTrue {Name = "af_P307_Cutscene03"},
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 43, Amount = 1},
		},
		-- sobald Spieler KEy hat, wird Tor geöffnet. Key wird danach weggenommen
		-- Soll noch ein Dialog mit dem Tor rein?
		
	},
	
	

	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 25, X = 537, Y = 447},
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 25, X = 612.475, Y = 379.491 },
			},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_PlayerEnteredBulwark"},
		},-- überprüfen, ob der Spieler sich dem Bulwark genähert hat
	},


	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KazizEndFight_Has_Spawned"},
			FigureIsDead {Tag = "KazizEndFight"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_KazizEndFight_Hack_N_Slayed"},
		}, -- kurzer Timer damit Kaziz noch umkippen kann bevor die Cutscene anfängt
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KazizEndFight_Hack_N_Slayed", Seconds = 2},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Cutscene04"},
		}, -- wenn Kaziz tot ist, wird die 4. Cutscene abgespielt
	},




	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse{Name = "af_P307_CS04Finished"},
			FigureIsDead{Tag = "Einar"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P307_EinarDiedOnNeedle"},
		},
		-- Falls Einar stirbt, BEVOR die Karte verlassen werden darf, wird das Flag für Jochen
		-- gesetzt
		-- Abfrage mit Karte verlassen, soll verhindern, daß das Flag auch true, wenn er nach Karteverlassen
		-- gevanished wird
	},


	------------------------------------------------------------------------------------------------


	--- OUTCRIES ZUM KAMPF IM BULWARK
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_PlayerEnteredBulwark"},
			AvatarFlagIsFalse {Name = "af_P307_CampBulwarkBusted"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "BattleScene01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "BattleScene02", Tag = "KorOutcry"},
			FigureOutcry{TextTag = "BattleScene03", Tag = "TothOutcry"},
			FigureOutcry{TextTag = "BattleScene04", Tag = "KorOutcry"},
			FigureOutcry{TextTag = "BattleScene05", Tag = "KorOutcry"},
			FigureOutcry{TextTag = "BattleScene06", Tag = "TothOutcry"},
		},
	},



	-----------------------------------------------------------------------------------------------
	


	--- SIDEQUEST: WARRADS TOCHTER
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 3},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RescueKaraFromNeedle"},
			QuestSetActive {Quest = "BringNewsToWarrad"},
		},
	},	
	
	-- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintNeedle"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 359, Y = 590, Direction = 0},
		}
	},
	-- Bild von Needle malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintNeedle"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintNeedle"},
			ObjectVanish	{Tag = "PaintingMarker"},
		}
	},
	-- Alle Bilder gemalt, Rückkehrquest starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyPaintRushwater"},
			QuestIsSolved {Quest = "HouseOfGreyPaintNeedle"},
			QuestIsSolved {Quest = "HouseOfGreyPaintGF"},
			QuestIsSolved {Quest = "HouseOfGreyPaintFireforge"},
			QuestIsSolved {Quest = "HouseOfGreyPaintMagnetStones"},
			QuestIsNotKnown  {Player = "pl_Human", Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			QuestSetActive {Quest = "HouseOfGreyReturnMyra"},
			AvatarItemMiscTake {ItemId = 222, Amount = 1},
		}
	},
	
	
	--------------------------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills & Mordecay-Deal ---------------------------------
	--------------------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "OrcWave19"},
			-- Boss der Orcwelle
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_FirstWaveBossKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "BossNordCamp"},
			-- Boss des Nordcamps
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_NorthCampBossKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "BossNordCamp"},
			-- Boss des Nordcamps
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_NorthCampBossKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "BossWestCamp"},
			-- Boss des Nordcamps
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_WestCampBossKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "BossMiddleCamp"},
			-- Boss des Nordcamps
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MiddleCampBossKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KazizEndFightIsAggro"},
			FigureIsDead{Tag = "KazizEndFight"},
			-- Kaziz
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_KazizKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_MordecayDeal"},
			-- MordecayDeal
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_MordecayDeal"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HongSpawned"},
			FigureIsDead{Tag = "Hong"},
			-- Hong
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HongKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "GhostOpponent"},
			-- Skelett-Mob in den Ruinen ganz unten
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_GhostOpponentKilled"},
		},
	},


	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	-- STEINE VANISHEN, SOBALD SPIELER MALQUEST HAT
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintNeedle"},
		},
		Actions =
		{
			ObjectVanish{Tag = "Barricade01"},
			ObjectVanish{Tag = "Barricade02"},
			ObjectVanish{Tag = "Barricade03"},
			ObjectVanish{Tag = "Barricade04"},
			ObjectVanish{Tag = "Barricade05"},
			ObjectVanish{Tag = "Barricade06"},
			ObjectVanish{Tag = "Barricade07"},
			ObjectVanish{Tag = "Barricade08"},
			ObjectVanish{Tag = "Barricade09"},
			ObjectVanish{Tag = "Barricade10"},
			ObjectVanish{Tag = "Barricade11"},
			ObjectVanish{Tag = "Barricade12"},
			ObjectVanish{Tag = "Barricade13"},
			ObjectVanish{Tag = "Barricade14"},
			ObjectVanish{Tag = "Barricade15"},
			ObjectVanish{Tag = "Barricade16"},
			ObjectVanish{Tag = "Barricade17"},
		},
	},
	
	
	
	-------------------------------------------------------------------------------------------
    --- EISEN-SAMMELN -------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------
    
    OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 252 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 252 , Amount = 1},
			PlayerResourceSilverGive{Player = "pl_Human", Amount = 50},
		},
		-- 50 Silber
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 253 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 253 , Amount = 1},
			PlayerResourceSilverGive{Player = "pl_Human", Amount = 100},
		},
		-- 100 Silber
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 254 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 254 , Amount = 1},
			PlayerResourceSilverGive{Player = "pl_Human", Amount = 200},
		},
		-- 200 Silber
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 255 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 255 , Amount = 1},
			PlayerResourceLenyaGive{Player = "pl_Human", Amount = 50},
		},
		-- 50 Lenya
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 257 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 257 , Amount = 1},
			PlayerResourceLenyaGive{Player = "pl_Human", Amount = 200},
		},
		-- 200 Lenya
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 256 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 256 , Amount = 1},
			PlayerResourceLenyaGive{Player = "pl_Human", Amount = 100},
		},
		-- 100 Silber
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 258 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 258 , Amount = 1},
			PlayerResourceStoneGive{Player = "pl_Human", Amount = 50},
		},
		-- 50 Stein
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 259 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 259 , Amount = 1},
			PlayerResourceStoneGive{Player = "pl_Human", Amount = 100},
		},
		-- 100 Stein
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 260 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 260 , Amount = 1},
			PlayerResourceStoneGive{Player = "pl_Human", Amount = 200},
		},
		-- 200 Stein
	},

}
