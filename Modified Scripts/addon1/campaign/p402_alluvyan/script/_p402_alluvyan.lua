--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1                   ***
--***                                                 ***
--*******************************************************

--Die Mission ist wie folgt auf die Lua Scripte verteilt:

--*******************************************************
--***                                                 ***
--***               Globale Scripte		              ***
--***                                                 ***
--*******************************************************

--_P402_Alluvyan
--MainQuest
--Outcries
--Rewards

--*******************************************************
--***                                                 ***
--***        Akt1 Haupttor einreisen			      ***
--***                                                 ***
--*******************************************************



--*******************************************************
--***                                                 ***
--***  			Akt2 Baumeister befreien	 		  ***
--***                                                 ***
--*******************************************************

--NQ Haldor 

--*******************************************************
--***                                                 ***
--***         	Akt3 Alluvyan befreien		   	      ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***   Akt4 mit Zwerge nach Sevenkeeps flüchten      ***
--***                                                 ***
--*******************************************************


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
				--Cutszene wird gestartet			
    			MapFlagSetTrue {Name = "mf_P402_StartIntroCS"},
				
				--MilitaryAI-Clan_Playercamps werden aktiviert
--				PlayerActivate	{Player = "pl_Orc1"},
--				PlayerActivate	{Player = "pl_Orc2"},
--				PlayerActivate	{Player = "pl_Realm1"},
				
				
				--Fog Aufdeckungen			
    	   		FogOfWarReveal	{X = 371, Y = 229, Range = 15, Height = 120},
    	   		FogOfWarReveal	{X = 375, Y = 411, Range = 15, Height = 120},
    	   		FogOfWarReveal	{FogOfWarId = 1, X = 322, Y = 246, Range = 15, Height = 120},
    	   		FogOfWarReveal	{FogOfWarId = 2, X = 414, Y = 266, Range = 15, Height = 120},
    	   		FogOfWarReveal	{X = 368, Y = 442, Range = 10, Height = 120},
    	   		FogOfWarReveal	{X = 382, Y = 442, Range = 10, Height = 120},
    	   		--FogOfWarReveal	{X = 635, Y = 676, Range = 15, Height = 125},
    	   		
    	   		FogOfWarTeamAdd	{Team = "tm_Team1"},
    	   		
				DialogSetDisabled	{Tag = "Master_Builder"},
				DialogSetDisabled	{Tag = "Haldor"},
				DialogSetDisabled	{Tag = "Satras"},
				
				
				--Portal/Reisestein Deaktivierung
				PortalDisable	{Tag = "Alluvyan_Winterlight"},
				PortalDisable	{Tag = "Alluvyan_GoldenFields"},
				PlayerTravelDisable	{},
				
				PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_Headquarter"},
				FigureAbilityAdd	{Tag = "Kulkar", AbilityId = Ability.Immortal},	
				
		},
		GotoState = "MainGate",
	},
};

--*******************************************************
--***                                                 ***
--***     			  		Akt1-4 		   			  ***
--***                                                 ***
--*******************************************************

State
{	
	StateName = "MainGate",
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_TreantHoldPosition01"},
				MapFlagIsTrue {Name = "mf_TreantHoldPosition02"},
				MapFlagIsTrue {Name = "mf_TreantHoldPosition03"},
			},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_MagicDefenseMainGateTimer"},	
			VisualTimerStart	{Seconds = 30},
		},
		
	},
	
	--Wenn kein Zwerg mehr da ist, wird der FOG ausgeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotUnitAmount	{Player = "pl_Human", UnitId = 1060, Amount = 1},
		},
		Actions =
		{
			FogOfWarCloak	{FogOfWarId = 1},
			FogOfWarCloak	{FogOfWarId = 2},
			
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_MagicDefenseMainGateTimer", Seconds = 30},
			VisualTimerIsNotActive	{},
			OR
			{
				FigureIsAlive	{Tag = "Treant01"},
				FigureIsAlive	{Tag = "Treant02"},
				FigureIsAlive	{Tag = "Treant03"},	
			}
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_DestroyMagicDefense"},
			ObjectVanish	{Tag = "Protection"},
			MapFlagSetTrue {Name = "mf_P402_MainGateCS"},
		},
		
	},
	
	--Recruit Observer
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_RecruitObserver"},
		},
		Actions =
		{
			FigurePlayerTransfer	{Tag = "Observer", Player = "pl_Human"},
		},
		
	},
		
	
	--Nach der Cutszene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			
		},
		Actions =
		{
				SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_fanfare_human"},
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Haupthaus"},
				--Gebäudepläne werden übergeben
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 191},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 192},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 193},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 194},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 195},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 196},
				PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 197},
				PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 52},
				PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 009},
				PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 010},
				PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 011},
				PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 012},
				PlayerActivate	{Player = "pl_Realm2"},
				PlayerKitTransfer	{Player = "pl_Realm2", PlayerKit = "pk_kit3"},
				ObjectVanish	{Tag = "invisible_blocker_001"},
				ObjectVanish	{Tag = "invisible_blocker_002"},
				ObjectVanish	{Tag = "invisible_blocker_003"},
				ObjectVanish	{Tag = "invisible_blocker_004"},
				ObjectVanish	{Tag = "invisible_blocker_005"},
				ObjectVanish	{Tag = "invisible_blocker_006"},
				ObjectVanish	{Tag = "invisible_blocker_007"},
				MapTimerStart	{Name = "mt_SoundHornRealmTimer"},
		},
		
	},
	--HornSound 2x abgespielt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SoundHornRealmTimer", Seconds = 3.5},
		},
		Actions =
		{
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_fanfare_human"},
		},
		
	},
	
	
	--Wenn die ersten Orccamps vernichtet wurden
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp1"},
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp2"},
		},
		Actions =
		{
			AIEnemyListClear	{Player = "pl_Realm1"},
			AIEnemyListClear	{Player = "pl_Realm2"},
		},
		
	},
	
	
	
	
	--Sobald die InnerGates geöffnet wurden, rücken die befreundeten Military Ki`s weiter vor.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				GateIsOpen	{Tag = "InnerGate01"},
				GateIsOpen	{Tag = "InnerGate02"},
			},
		},
		Actions =
		{
			GateSetOpen	{Tag = "OrcGate"},
			
			PlayerActivate	{Player = "pl_Orc3"},
			PlayerKitTransfer	{Player = "pl_Orc3", PlayerKit = "pk_Orc3"},
			PlayerActivate	{Player = "pl_Orc4"},
			PlayerKitTransfer	{Player = "pl_Orc4", PlayerKit = "pk_Orc4"},	
			
			AIEnemyAdd	{Player = "pl_Realm1", Tag = "pl_Orc3"},
			AIEnemyAdd	{Player = "pl_Realm1", Tag = "tm_Team2"},
			AIEnemyAdd	{Player = "pl_Realm2", Tag = "pl_Orc4"},
			AIEnemyAdd	{Player = "pl_Realm2", Tag = "tm_Team2"},
			FigureAbilityRemove	{Tag = "Kulkar", AbilityId = Ability.Immortal},
		},
	},
				
	--Sobald eines der Inneren Gates geöffnet wurde
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndSideQuests"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Haldor"},
			DialogSetDisabled	{Tag = "Master_Builder"},	
		},
		
	},	
		
	--Sobald das Tor von Haldor geöffnet wurde wird ein Dialog eingeschaltet
	OnOneTimeLeverEvent	
	{
		Lever = "Haldor_Lever", 
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Haldor_Lever", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 590.5, Y = 457},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "Haldor_Gate"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_woodcage_open", X = 585, Y = 12, Z = 456, MaxRange = 20, FallOffRange = 5},
			--MapTimerStart	{Name = "mt_HaldorGateTimer"},
		},
	},
	
	--Sobald das Tor offen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapTimerIsElapsed	{Name = "mt_HaldorGateTimer", Seconds = 5},
			GateIsOpen	{Tag = "Haldor_Gate"},
			MapFlagIsFalse {Name = "mf_HaldorNotAccepted"},
		},
		Actions =
		{
			FigureForcedWalk	{Tag = "Haldor", X = 585, Y = 452},
		},
	},
	
	--Sobald das Tor offen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "Haldor_Gate"},
			MapFlagIsFalse {Name = "mf_HaldorNotAccepted"},
			FigureIsInRange	{Tag = "Haldor", Range = 2, X = 585, Y = 452},
		},
		Actions =
		{
			FigureLookAtEntity	{Tag = "Haldor", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "Haldor" },   
			DialogTypeSetMainQuest	{Tag = "Haldor"},
			MapFlagSetTrue {Name = "mf_HaldorFree"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 304, Amount = 3},
			MapFlagIsTrue {Name = "mf_HaldorFree"},
			MapFlagIsFalse {Name = "mf_HaldorNotAccepted"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Haldor" },   
			DialogTypeSetMainQuest	{Tag = "Haldor"},
		},
	},
	
	
	--Das Gate vom Baumeister wird geöffnet sobald der Avatar in Range ist und kein Orc.
	OnOneTimeLeverEvent	
	{
		Lever = "Lever_Prison02", 
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Lever_Prison02", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 140, Y = 399},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "Gate_Prison02"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_woodcage_open", X = 142, Y = 14, Z = 396, MaxRange = 20, FallOffRange = 5},
			--MapTimerStart	{Name = "mt_MasterBuilderGateTimer"},
		},
	},
	
	--Sobald das Tor offen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "Gate_Prison02"},
			--MapTimerIsElapsed	{Name = "mt_MasterBuilderGateTimer", Seconds = 5},
		},
		Actions =
		{
			FigureForcedWalk	{Tag = "Master_Builder", X = 141, Y = 399},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "Gate_Prison02"},
			FigureIsInRange	{Tag = "Master_Builder", Range = 2, X = 141, Y = 399},
		},
		Actions =
		{
			FigureLookAtEntity	{Tag = "Master_Builder", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "Master_Builder" },   
			DialogTypeSetMainQuest	{Tag = "Master_Builder"},
			MapFlagSetTrue {Name = "mf_MasterBuilder"},
		},
	},
	
	
	--Sobald das Orclager 15 oder 16 fällt wird die Orcarmee im Süden gespawned die dan in Richtung Spielerhaupthaus marschiert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			OR
			{
				BuildingIsDead	{Tag = "HaupthausOrc1"},
				BuildingIsDead	{Tag = "HaupthausOrc1_1"},
				BuildingIsDead	{Tag = "HaupthausOrc2"},
				BuildingIsDead	{Tag = "HaupthausOrc2_1"},
			},
			
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_no_01_horn"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			OR
			{
				BuildingIsDead	{Tag = "HaupthausOrc1"},
				BuildingIsDead	{Tag = "HaupthausOrc1_1"},
				BuildingIsDead	{Tag = "HaupthausOrc2"},
				BuildingIsDead	{Tag = "HaupthausOrc2_1"},
			},
			
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_no_01_horn"},
			MapTimerStart	{Name = "mt_HornSoundTimer"},
			
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_HornSoundTimer", Seconds = 0.5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P402_StartAttackSouthCS"},
			MapTimerStart	{Name = "mt_OrcArmeeTimer"},
			MapFlagSetTrue {Name = "mf_OrcAmbush"},
			GateSetOpen	{Tag = "OrcGateSouth01"},
			GateSetOpen	{Tag = "OrcGateSouth02"},
			FogOfWarReveal	{X = 126, Y = 122, Range = 15, Height = 115},
			FogOfWarReveal	{X = 98, Y = 120, Range = 15, Height = 115},
			FogOfWarReveal	{X = 83, Y = 115, Range = 15, Height = 115},
			FogOfWarReveal	{X = 67, Y = 94, Range = 15, Height = 115},
			MapTimerStop	{Name = "mt_HornSoundTimer"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndAttackSouthCS"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_AlarmTimer"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AlarmTimer", Seconds = 35},
		},
		Actions =
		{
			SoundStopAddon1	{File = "06_level/lvl_palace_alarm"},
			MapTimerStop	{Name = "mt_AlarmTimer"},
		},
		
	},
	
	--Das InnerGate01 wird geöffnet sobald der Avatar den Hebel dazu zieht.
	OnOneTimeLeverEvent
	{
		Lever = "LeverInnerGate01",
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "LeverInnerGate01", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 340, Y = 471},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "InnerGate01"},
		},
	},
	
	--Wenn man einen Deal mit Haldor gemacht hat wird eine Cutszene gestartet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorCast"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 438, Y = 456},
			MapFlagIsFalse {Name = "mf_EndSideQuests"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P402_InnerGate02CS"},
		},
		
	},
	
	
	--Sobald alle feindlichen Military KI`s ausgeschaltet wurden
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			BuildingIsDead	{Tag = "HaupthausOrc1"},
			BuildingIsDead	{Tag = "HaupthausOrc1_1"},
			BuildingIsDead	{Tag = "HaupthausOrc2"},
			BuildingIsDead	{Tag = "HaupthausOrc2_1"},
			BuildingIsDead	{Tag = "HaupthausOrc3"},
			BuildingIsDead	{Tag = "HaupthausOrc3_1"},
			BuildingIsDead	{Tag = "HaupthausOrc4"},
			BuildingIsDead	{Tag = "HaupthausOrc4_1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P402_EndcutszeneCS"},
		},
		
	},
	--Haldor wird zum Marktplatz teleportiert.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P402_EndcutszeneCS"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Haldor"},
			FigureTeleport	{Tag = "Haldor", X = 406, Y = 453},
		},
		
	},
	--Wenn der Endboss und seine Schergen getötet wurden begibt sich Haldor zum Portal.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMonsterAlive"},
			FigureIsDead	{Tag = "EndMonster"},
			FigureIsDead	{Tag = "ShamanEndfight01"},
			FigureIsDead	{Tag = "ShamanEndfight02"},
			FigureIsDead	{Tag = "ShamanEndfight03"},
			FigureIsDead	{Tag = "ShamanEndfight04"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Haldor", X = 376, Y = 586},
		},
		
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndcutszeneCS"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Door01_Endfight"},
			GateSetOpen	{Tag = "Door02_Endfight"},
			--MapFlagSetTrue {Name = "mf_P402_EndbossDeath"},	
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "EndMonster", Range = 5, Height = 127},
		},
		
	},
	
	--Das Gate von dem Shaikanhauptmann wird geöffnet sobald der Avatar in Range ist und kein Orc.
	OnOneTimeLeverEvent
	{
		Lever = "Lever_Prison",
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Lever_Prison", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 380, Y = 553},
			MapFlagIsFalse {Name = "mf_SatrasDialogOver"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "Gate_Prison"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_woodcage_open", X = 376, Y = 27, Z = 554, MaxRange = 20, FallOffRange = 5},
			DialogSetEnabled	{Tag = "Satras"},   
			DialogTypeSetSideQuest	{Tag = "Hauptmann"},
		},
	},
	
	--Sobald das Tor offen ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "Gate_Prison"},
		},
		Actions =
		{
			FigureWalkToEntity	{Tag = "Satras", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "Satras" },   
		},
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SatrasDialogOver"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Satras" }, 
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P402_EndcutszeneCS"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	
---- DIALOGKONTROLLE Haldor
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorOffer"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 304, Amount = 1},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Haldor" }, 
		},
	},


	-- Sidequest Gate öffnen wenn eine der beiden Sidequests (Hero Yasha oder Hero Wind) aktiv ist
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Quest = "HeroYasha_Alluvyan"},
				QuestIsActive	{Quest = "HeroWindFightWestWind"},
			},
		},
		Actions =
		{
			GateSetOpen	{Tag = "SQGate"},
		},
	},
	
	
	
	
	
};