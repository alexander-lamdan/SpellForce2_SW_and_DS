State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "StoneGodDefeatWestCamp"}, 
			FigureIsDead {Tag = "Wolfwoman"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_BeastCampBoss1Dead"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "StoneGodDefeatEastCamp"},
			FigureIsDead {Tag = "Windbride"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_BeastCampBoss2Dead"}
		},
	},
	 -- Der Drache ist tot, die Portale gehen auf und es gibt XP
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "FindPortalToMagnetStones"},
    		FigureIsDead {Tag = "Mistdragon"},
    		--MapFlagIsTrue {Name = "mf_P309_Dragon"},
    	},
    	Actions = 
    	{
    		MapFlagSetTrue {Name = "mf_P309_DragonDead"},
    		PlayerTravelEnable {},
    		PortalEnable {Tag = "MagnetStones"},
    	},
    },
    --
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsAlive {Tag = "LeutnantRagnar"},
    		AvatarFlagIsTrue {Name = "af_P309_CutsceneGateEnd"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_RagnarAlive"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead {Tag = "LeutnantRagnar"},
    		MapFlagIsTrue {Name = "mf_P309_RagnarAlive"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_RagnarDead"},
    	}
    },
    -- Erst wenn Ragnar lebt kann er sterben
   OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsAlive {Tag = "StoneGodBoss"},
    		AvatarFlagIsTrue {Name = "af_P309_CutsceneGateEnd"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_StoneGodBossAlive"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P309_StoneGodBossAlive"},
    		FigureIsDead {Tag = "StoneGodBoss"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_StoneGodBossDead"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead {Tag = "GateBoss"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_GateBossDead"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsDead {Tag = "BoneBoss"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_BoneBossDead"},
    	}
    },
    -- Erst wenn Sharduk mal gelebt hat kann er sterben
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsAlive {Tag = "Sharduk"},
    		AvatarFlagIsTrue {Name = "af_P309_CutsceneGateEnd"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_ShardukLives"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P309_ShardukLives"},
    		FigureIsDead {Tag = "Sharduk"}
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_AssassinBossDead"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsGreaterOrEqual {Name = "mv_P309_FightNumber", Value = 5},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Arena1"},
    		ObjectSpawn {ObjectId = 1918, X = 572, Y = 336, Direction = 90, Tag = "ArenaCircleOne"},
    		ObjectLootItemEquipmentAdd {Tag = "ArenaCircleOne", ItemId = 528},
    		ObjectLootItemEquipmentAdd {Tag = "ArenaCircleOne", ItemId = 535},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsGreaterOrEqual {Name = "mv_P309_FightNumber", Value = 12},
    		FigureIsDead {Tag = "TorHalicos"}
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Arena2"},
    		ObjectSpawn {ObjectId = 1918, X = 572, Y = 336, Direction = 90, Tag = "ArenaCircleTwo"},
    		ObjectLootItemEquipmentAdd {Tag = "ArenaCircleTwo", ItemId = 553},
    		ObjectLootItemEquipmentAdd {Tag = "ArenaCircleTwo", ItemId = 569},
    	}
    },
    -- Blumen zählen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsEqual {Name = "mv_P309_PlayerFlowers", Value = 1},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Flower1"}
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsEqual {Name = "mv_P309_PlayerFlowers", Value = 2},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Flower2"}
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsEqual {Name = "mv_P309_PlayerFlowers", Value = 3},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Flower3"}
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsEqual {Name = "mv_P309_PlayerFlowers", Value = 4},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_Flower4"}
    	}
    },
    -- Alle Grau Questen sind gelöst
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyLetho"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyDario"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreySara"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyNyano"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyMyra"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "LethoGrey"}
    	},
    },
    
    -- SO jetzt geht es ans Geoden sammeln
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 1},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_OneIridumGeode"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 2},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_TwoIridumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 3},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_ThreeIridumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 4},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_FourIridumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 5},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_FiveIridumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 1},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_OneLathaniumGeode"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 2},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_TwoLathaniumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 3},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_ThreeLathaniumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 4},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_FourLathaniumGeodes"}
    	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 5},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P309_FiveLathaniumGeodes"}
    	},
    },
    -- Der Spieler hat die Items aus dem ersten Bestienlager
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "StoneGodDefeatWestCamp"},
    		AvatarHasItemMisc {ItemId = 57, Amount = 1},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "StoneGodDefeatWestCamp"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "StoneGodDefeatEastCamp"},
    		AvatarHasItemMisc {ItemId = 56, Amount = 1},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "StoneGodDefeatEastCamp"},
    	}
    },
    -- Der Steinerne God ist entlarvt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P309_StonedGodExposed"},
    		QuestIsActive {Quest = "StoneGodDefeatEastCamp"},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "StoneGodDefeatEastCamp"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "StoneGodDefeatWestCamp"},
    		MapFlagIsTrue {Name = "mf_P309_StonedGodExposed"},
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "StoneGodDefeatWestCamp"},
    	}
    },
    -- Dem Spieler die Schätze abnehmen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "SolveStoneGodRiddle"}
    	},
    	Actions =
    	{
    		AvatarItemMiscTake {ItemId = 56, Amount = 1},
    		AvatarItemMiscTake {ItemId = 56, Amount = 1},
    	}
    },
    -- Damit die liebe Seele Ruh hat gibt es jetzt noch XP für die Biestschlampen
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "SolveStoneGodRiddle"},
    		FigureIsAlive {Tag = "Wolfwoman"},
    		MapFlagIsFalse {Name = "mf_BeastCampBoss1Dead"}
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_BeastCampBoss1Dead"},
    		FigureVanish {Tag = "Wolfwoman"},
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "SolveStoneGodRiddle"},
    		FigureIsAlive {Tag = "Windbride"},
    		MapFlagIsFalse {Name = "mf_BeastCampBoss2Dead"}	
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_BeastCampBoss2Dead"},
    		FigureVanish {Tag = "Windbride"},
    	}
    },
   -- Kackeblumen abnehmen
   	OnEvent
   	{
   		Conditions =
   		{
   			AvatarHasItemMisc {ItemId = 75, Amount = 1},
   			QuestIsSolved {Quest = "GoSPart3Oracle"},
   		},
   		Actions =
   		{
   			-- Dem Spieler sein Blumen wegnehmen
			AvatarItemMiscTake {ItemId = 75, Amount = 1},
   		},
	},
	
	-- Falls der SPieler in der falschen Reihenfolge die Axt findet
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
 	},
 	-- Game over
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			MapFlagIsTrue {Name = "mf_P309_GameOver"}
 		},
 		Actions =
 		{
 			-- Game Over
			PlayerGameOver {LocaTag = "GameOverSF2OracleLost"},
 		},
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
}