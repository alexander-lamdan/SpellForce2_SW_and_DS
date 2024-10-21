---------------------
-- P406_The_Citadel
-- Platformscript
---------------------


--*******************************************************
--***                                                 ***
--***               The Citadel 		              ***
--***                                                 ***
--*******************************************************

State
{
	StateName = "MAIN",
	--Spieler kommt von der Dragh`Lur
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsSolved {Quest = "DraghLurA1_TalkToNightsong"},
				AvatarFlagIsTrue {Name = "af_P406_Part2"},
			},
		},
		Actions =
		{
			
		},
		GotoState = "CitadelPart2",
	},
	
--*******************************************************
--***                                                 ***
--***               The Citadel Part1	              ***
--***                                                 ***
--*******************************************************	
	
	--Spieler hat die Quest auf der Dragh`Lur noch nicht gesolved
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P406_StartIntroCS"},
			PlayerTravelDisable {},
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
			DialogTypeSetMainQuest	{Tag = "GateCitadel1"},
    		DialogSetEnabled	{Tag = "GateCitadel1"},
    		DialogTypeSetMainQuest	{Tag = "GateCitadel2"},
    		DialogSetEnabled	{Tag = "GateCitadel2"},
    		FogOfWarReveal	{X = 267, Y = 268, Range = 15, Height = 120},
    		FigureAbilityAdd	{Tag = "GateMonster", AbilityId = Ability.Immortal},
    		PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 750},
    		MapValueSet	{Name = "mv_PactCollection", Value = 7},    
    		
		},
	},
	
	-- Das Portal für den Spieler de/aktivieren
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P406_StartIntroCS"},
		},
		Actions =
		{
			-- PS: ObjectChange ersetzt durch globales CityShipTeleporter.lua script
			
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
		}
	},
	--Teleporter wird wieder freigeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Test"},
				QuestIsActive {Quest = "Citadel1_GoToDraghLur"},
			},
		},
		Actions =
		{
			PlayerTravelEnable {},
			
			-- Teleporter aktivieren, da Reisen wieder erlaubt ist
			MapFlagSetFalse	{Name = "mf_PlayerTravelDisabled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "GateMonster", Range = 8},
			},
		},
		Actions =
		{
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_giantmonster_scream", X = 552, Y = 15, Z = 553, MaxRange = 30, FallOffRange = 5},
		},
	},
	
	--Timer für 2 Cutszene wird gesetzt.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				GateIsOpen	{Tag = "DoorCitadel1"},
				GateIsOpen	{Tag = "DoorCitadel2"},
			},
			OR
			{
				AND
				{
					FigureHasNotHealth	{Tag = "pl_HumanAvatar", Percent = 80},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "GateMonster", Range = 4},
				},
				AND
				{
					FigureHasNotHealth	{Tag = "pl_HumanHeroWhisper", Percent = 80},
					FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "GateMonster", Range = 4},
				},
				AND
				{
					FigureHasNotHealth	{Tag = "pl_HumanHeroWind", Percent = 80},
					FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "GateMonster", Range = 4},
				},
				AND
				{
					FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "GateMonster", Range = 4},
					FigureHasNotHealth	{Tag = "pl_HumanHeroCaine", Percent = 80},
				},
			},
			
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_CutszeneStartTimer"},
		},
	},

	--Zweite Cutszene wird gestartet
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				GateIsOpen	{Tag = "DoorCitadel1"},
				GateIsOpen	{Tag = "DoorCitadel2"},
			},
			OR
			{
				AND
				{
					FigureHasNotHealth	{Tag = "pl_HumanAvatar", Percent = 50},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "GateMonster", Range = 4},
				},
				MapTimerIsElapsed	{Name = "mt_CutszeneStartTimer", Seconds = 20},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "GateMonster", Team = "tm_Neutral"},
			MapFlagSetTrue {Name = "mf_P406_StartGate1CS"},
		},
	},

	--Wenn die zweite Cutszene beendet wurde.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P406_EndGate1CS"},
		},
		Actions =
		{
			PlayerMapTravelAddon1	{Player = "pl_Human", Map = "Campaign/P405_The_City_Ship", TargetTag = "CityShip_Ghostwatch"},
		},
	},


};	
--*******************************************************
--***                                                 ***
--***               The Citadel Part 2                ***
--***                                                 ***
--*******************************************************

State
{
	StateName = "CitadelPart2",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "GateMonster", Team = "tm_Creep"},
			MapFlagSetTrue	{Name = "mf_CitadelPart2"},
			DialogTypeSetMainQuest	{Tag = "GargoyleCommander"},
    		DialogSetEnabled	{Tag = "GargoyleCommander"},
			AvatarFlagSetTrue {Name = "af_P406_GeneralsReady"},
			GateSetOpen	{Tag = "GatePlayerBase"},
			GateSetOpen	{Tag = "GatePlayerBase2"},
    	
    		MapFlagSetTrue {Name = "mf_PlayerTravelDisabled"},
    		  		
    		FigureAbilityRemove	{Tag = "GateMonster", AbilityId = Ability.Immortal},
    		
    		PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
    		PlayerResourceSilverGive	{Player = "pl_Human", Amount = 300},
    		PlayerResourceStoneGive	{Player = "pl_Human", Amount = 300},
    		
    		PlayerBuildingAdd {BuildingId = 200}, -- Blades Soulforge
			PlayerBuildingAdd {BuildingId = 199}, -- Blades Nexus
 			
			PlayerBuildingUpgradeAdd {UpgradeId = 49}, -- Blade Tower Upgrade
			PlayerBuildingUpgradeAdd {UpgradeId = 46}, -- Blades Headquarter Upgrade
    		
    		PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 048},
    		PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 051},
    		PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 056},
    		
    		PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 017},
			PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 018},
    		
    		--Für QA zum Testen des II Teils
    		ObjectVanish	{Tag = "GateCitadel1"},
    		ObjectVanish	{Tag = "GateCitadel2"},
    		BuildingDestroy	{Tag = "UndeadSpawnpoint1"},
    		BuildingDestroy	{Tag = "UndeadSpawnpoint2"},
    		BuildingDestroy	{Tag = "UndeadSpawnpoint3"},
    		BuildingDestroy	{Tag = "UndeadSpawnpoint4"},
    		BuildingDestroy	{Tag = "CrystalGolemSpawnpoint1"},
    		BuildingDestroy	{Tag = "CrystalGolemSpawnpoint2"},
    		BuildingDestroy	{Tag = "MudGolemSpawnpoint1"},
    		BuildingDestroy	{Tag = "MudGolemSpawnpoint2"},
    		FigureVanish	{Tag = "1MudGolemPat1"},
    		FigureVanish	{Tag = "1MudGolemPat2"},
    		FigureVanish	{Tag = "1MudGolemPat3"},
    		FigureVanish	{Tag = "1MudGolemPat4"},
    		FigureVanish	{Tag = "2MudGolemPat1"},
    		FigureVanish	{Tag = "2MudGolemPat2"},
    		FigureVanish	{Tag = "2MudGolemPat3"},
    		FigureVanish	{Tag = "2MudGolemPat4"},
    		FigureVanish	{Tag = "1CrystalGolemPat1"},
    		FigureVanish	{Tag = "1CrystalGolemPat2"},
    		FigureVanish	{Tag = "1CrystalGolemPat3"},
    		FigureVanish	{Tag = "1CrystalGolemPat4"},
    		FigureVanish	{Tag = "2CrystalGolemPat1"},
    		FigureVanish	{Tag = "2CrystalGolemPat2"},
    		FigureVanish	{Tag = "2CrystalGolemPat3"},
    		FigureVanish	{Tag = "2CrystalGolemPat4"},
    		FigureVanish	{Tag = "1UndeadPat1"},
    		FigureVanish	{Tag = "1UndeadPat2"},
    		FigureVanish	{Tag = "2UndeadPat1"},
    		FigureVanish	{Tag = "2UndeadPat2"},
    		FigureVanish	{Tag = "3UndeadPat1"},
    		FigureVanish	{Tag = "3UndeadPat2"},
    		FigureVanish	{Tag = "4UndeadPat1"},
    		FigureVanish	{Tag = "4UndeadPat2"},
    		FigureVanish	{Tag = "Golem1"},
    		FigureVanish	{Tag = "Golem2"},
    		FigureVanish	{Tag = "Golem3"},
    		FigureVanish	{Tag = "Golem4"},
    		FigureVanish	{Tag = "Golem5"},
    		FigureVanish	{Tag = "Golem6"},
    		FigureVanish	{Tag = "Golem7"},
    		FigureVanish	{Tag = "Golem8"},
    		FigureVanish	{Tag = "Golem9"},
    		FigureVanish	{Tag = "Golem10"},
    		FigureVanish	{Tag = "Golem11"},
    		FigureVanish	{Tag = "Golem12"},
    		FigureVanish	{Tag = "Golem13"},
    		FigureVanish	{Tag = "Golem14"},
    		FigureVanish	{Tag = "Golem15"},
    		FigureVanish	{Tag = "Golem16"},
    		FigureVanish	{Tag = "Golem17"},
    		FigureVanish	{Tag = "Golem18"},
    		FigureVanish	{Tag = "Golem19"},
    		FigureVanish	{Tag = "Golem20"},
    		FigureVanish	{Tag = "Golem21"},
    		FigureVanish	{Tag = "Golem22"},
    		FigureVanish	{Tag = "Golem23"},
    		FigureVanish	{Tag = "Golem24"},
    		FigureVanish	{Tag = "Skeleton1"},
    		FigureVanish	{Tag = "Skeleton2"},
    		FigureVanish	{Tag = "Skeleton3"},
    		FigureVanish	{Tag = "Skeleton4"},
    		FigureVanish	{Tag = "Skeleton5"},
    		FigureVanish	{Tag = "Skeleton6"},
    		FigureVanish	{Tag = "Skeleton7"},
    		FigureVanish	{Tag = "Skeleton8"},
    		FigureVanish	{Tag = "Skeleton9"},
    		FigureVanish	{Tag = "Skeleton10"},
    		FigureVanish	{Tag = "Skeleton11"},
    		FigureVanish	{Tag = "Skeleton12"},
    		
    		FigureVanish	{Tag = "LeadStatist"},
    		FigureVanish	{Tag = "Statist1"},
    		FigureVanish	{Tag = "Statist2"},
    		FigureVanish	{Tag = "Statist3"},
    		FigureVanish	{Tag = "Statist4"},
    		FigureVanish	{Tag = "Statist5"},
    		FigureVanish	{Tag = "Statist6"},
    		
    	
    		PlayerTravelDisable {},
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "GateMonster", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "GateMonster", Range = 8},
			},
		},
		Actions =
		{
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_giantmonster_scream", X = 552, Y = 15, Z = 553, MaxRange = 30, FallOffRange = 5},
		},
	},
	
	--Wenn der Torwächter getötet wurde
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "GateMonster"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_GuardianDead"},
			AvatarFlagSetTrue {Name = "af_P406_GeneralsReady2"},
			DialogTypeSetMainQuest	{Tag = "GroundCommander"},
    		DialogSetEnabled	{Tag = "GroundCommander"},
    		DialogTypeSetMainQuest	{Tag = "GargoyleCommander"},
    		DialogSetEnabled	{Tag = "GargoyleCommander"},	
    		
    		PlayerActivate	{Player = "pl_Gegner1"},
    		PlayerActivate	{Player = "pl_Gegner2"},
    		PlayerActivate	{Player = "pl_Gegner3"},
    		PlayerActivate	{Player = "pl_Gegner4"},
    		
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Base"}, 
    		PlayerKitTransfer	{Player = "pl_Gegner1", PlayerKit = "pk_kit2"},
    		PlayerKitTransfer	{Player = "pl_Gegner2", PlayerKit = "pk_kit3"},
    		PlayerKitTransfer	{Player = "pl_Gegner3", PlayerKit = "pk_kit4"},
    		PlayerKitTransfer	{Player = "pl_Gegner4", PlayerKit = "pk_kit5"},	
    		
    		FogOfWarTeamAdd	{Team = "tm_Team1"},
		},
	},
	
	--Eiserne werden dem Spieler übergeben.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Blade2Alive"},
			MapFlagIsTrue	{Name = "mf_Blade3Alive"},
			MapFlagIsTrue	{Name = "mf_Blade4Alive"},
		},
		Actions =
		{
		    		
    		FigurePlayerTransfer	{Tag = "Blade2", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Blade3", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Blade4", Player = "pl_Human"},
    		
		},
	},
	--Ressourcen Woodencart
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 268, Amount = 1},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 500},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 268, Amount = 1},
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 251, Amount = 1},
		},
		Actions =
		{
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = 500},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 251, Amount = 1},
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 267, Amount = 1},
		},
		Actions =
		{
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = 500},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 267, Amount = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower6"},
			BuildingIsDead	{Tag = "Tower7"},
			BuildingIsDead	{Tag = "Tower8"},
			BuildingIsDead	{Tag = "Tower9"},
			BuildingIsDead	{Tag = "Tower10"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart1", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart1", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart1", DropChance = 100, ItemId = 268},
		},
	},	
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart1"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks1"},
			ObjectVanish	{Tag = "1Stone1"},
			ObjectVanish	{Tag = "1Stone2"},
			ObjectVanish	{Tag = "1Stone3"},

		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower1"},
			BuildingIsDead	{Tag = "Tower2"},
			BuildingIsDead	{Tag = "Tower3"},
			BuildingIsDead	{Tag = "Tower4"},
			BuildingIsDead	{Tag = "Tower5"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart2", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart2", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart2", DropChance = 100, ItemId = 268},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart2"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks2"},
			ObjectVanish	{Tag = "2Stone1"},
			ObjectVanish	{Tag = "2Stone2"},
			ObjectVanish	{Tag = "2Stone3"},

		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower6"},
			BuildingIsDead	{Tag = "Tower7"},
			BuildingIsDead	{Tag = "Tower8"},
			BuildingIsDead	{Tag = "Tower9"},
			BuildingIsDead	{Tag = "Tower10"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart3", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart3", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart3", DropChance = 100, ItemId = 268},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart3"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks3"},
			ObjectVanish	{Tag = "Chest1"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower6"},
			BuildingIsDead	{Tag = "Tower7"},
			BuildingIsDead	{Tag = "Tower8"},
			BuildingIsDead	{Tag = "Tower9"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart4", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart4", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart4", DropChance = 100, ItemId = 268},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart4"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks4"},
			ObjectVanish	{Tag = "Chest2"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower1"},
			BuildingIsDead	{Tag = "Tower2"},
			BuildingIsDead	{Tag = "Tower3"},
			BuildingIsDead	{Tag = "Tower4"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart5", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart5", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart5", DropChance = 100, ItemId = 268},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart5"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks5"},
			ObjectVanish	{Tag = "Chest3"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower1"},
			BuildingIsDead	{Tag = "Tower2"},
			BuildingIsDead	{Tag = "Tower3"},
			BuildingIsDead	{Tag = "Tower4"},
			BuildingIsDead	{Tag = "Tower5"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "Woodencart6", DropChance = 100, ItemId = 251},
			ObjectLootItemMiscAdd	{Tag = "Woodencart6", DropChance = 100, ItemId = 267},
			ObjectLootItemMiscAdd	{Tag = "Woodencart6", DropChance = 100, ItemId = 268},
		},
	},	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = "Woodencart6"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sacks6"},
			ObjectVanish	{Tag = "Chest4"},
		},
	},	
	--RessourcenGive, GargoyleCommander.
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveResources"},
			EntityFlagIsFalse	{Name = "ef_RessourcenSchalter"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_StoneRessourcesTimer"},
			EntityFlagSetTrue	{Name = "ef_RessourcenSchalter"},
		},
	},	

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveResources"},
			MapTimerIsElapsed	{Name = "mt_StoneRessourcesTimer", Seconds = 30},
			EntityFlagIsTrue	{Name = "ef_RessourcenSchalter"},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 10},
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = 10},
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = 10},
			MapTimerStop	{Name = "mt_StoneRessourcesTimer"},
			EntityFlagSetFalse	{Name = "ef_RessourcenSchalter"},
		},
	},	

--RessourcenGive, GroundCommander.
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveResourcesGround"},
			EntityFlagIsFalse	{Name = "ef_RessourcenSchalter2"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_StoneRessourcesTimer2"},
			EntityFlagSetTrue	{Name = "ef_RessourcenSchalter2"},
		},
	},	

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveResourcesGround"},
			MapTimerIsElapsed	{Name = "mt_StoneRessourcesTimer2", Seconds = 30},
			EntityFlagIsTrue	{Name = "ef_RessourcenSchalter2"},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 10},
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = 10},
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = 10},
			MapTimerStop	{Name = "mt_StoneRessourcesTimer2"},
			EntityFlagSetFalse	{Name = "ef_RessourcenSchalter2"},
		},
	},	

--RealmCamp ist zerstört.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Gegner1", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Gegner1", Amount = 10},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_RealmCampDestroyed"},
			MapFlagSetFalse	{Name = "mf_AttackAimGround1"},
			MapFlagSetFalse	{Name = "mf_AttackAim1"},
		},
	},	
--ClanCamp East ist zerstört.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Gegner4", Amount = 1, OnlyCompleted = default},
			--PlayerHasNotFigureAmount	{Player = "pl_Gegner4", Amount = 20},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_EastClanCampDestroyed"},
			MapFlagSetFalse	{Name = "mf_AttackAimGround4"},
			MapFlagSetFalse	{Name = "mf_AttackAim4"},
		},
	},	
	
--BeastCamp ist zerstört.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Gegner3", Amount = 1, OnlyCompleted = default},
			--PlayerHasNotFigureAmount	{Player = "pl_Gegner3", Amount = 20},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BeastCampDestroyed"},
			MapFlagSetFalse	{Name = "mf_AttackAimGround3"},
			MapFlagSetFalse	{Name = "mf_AttackAim3"},
		},
	},	
	
--ClanCamp North ist zerstört.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Gegner2", Amount = 1, OnlyCompleted = default},
			--PlayerHasNotFigureAmount	{Player = "pl_Gegner2", Amount = 20},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_NorthClanCampDestroyed"},
			MapFlagSetFalse	{Name = "mf_AttackAimGround2"},
			MapFlagSetFalse	{Name = "mf_AttackAim2"},
		},
	},	
		
--Sobald der Spieler die Bibliothek betritt werden die gegnerischen Camps deaktiviert und die Generäle ausgeschaltet.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
		},
		Actions =
		{
			AIPlayerDeactivate	{Player = "pl_Gegner1"},
			AIPlayerDeactivate	{Player = "pl_Gegner2"},
			AIPlayerDeactivate	{Player = "pl_Gegner3"},
			AIPlayerDeactivate	{Player = "pl_Gegner4"},
			DialogSetDisabled	{Tag = "GargoyleCommander"},
			DialogSetDisabled	{Tag = "GroundCommander"},
		},
	},	



--letzte Cutszene wird gestartet, wenn der Spieler Mordecay getötet hat.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Mordecay"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P406_StartEndCS"},	
			AvatarFlagSetTrue{Name = "af_P407_SecondReturnToCityShip"},	
			MapFlagSetFalse {Name = "mf_PlayerTravelDisabled"},	--Teleporter Cityship wird freigeschaltet
			PlayerTravelEnable {},
		},
	},

	--letzte Cutszene ist vorbei.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P406_EndLastCS"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_OutcriesMordecayStart"},	
		},
	},

	
};
