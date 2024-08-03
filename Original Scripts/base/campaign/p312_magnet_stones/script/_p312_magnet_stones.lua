--- ES FEHLT NOCH: WENN MAN EINE ZEITLANG ARDAR NICHT ANSPRECHT,
--- KOMMEN DIE OUTCRIES VON ALLEIN, ARDAR SCHALTET DANN SEINEN DIALOG AB
--- AUSSERDEM: ARDAR GEHT ZU PORTAL UND VERSCHWINDET DANN


State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
    {
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 AvatarFlagSetTrue	{Name = "af_P304_AlwaysTrue"},
    		 AvatarFlagSetTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
    	},
    },
	
   
   --- 1. Cutscene triggert
   --- gleich zu Beginn
   
	OnOneTimeEvent
   	{
   		Conditions =
		{
		},
		Actions =
   		{
   			AvatarFlagSetTrue {Name = "af_P312_CS01Start"},
   		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Ardar"},
			AvatarFlagIsFalse{Name = "af_P312_MagnetStonesInfoGiven"},
		},
		Actions =
		{
			--FigureOutcry{TextTag = "QAInfo01", Tag ="pl_HumanAvatar"},
			--PlayerGameOver	{Player = "pl_Human"},
			PlayerGameOver	{Player = "pl_Human", Tag = "Ardar_DEAD", LocaTag = "GameOverSF2ArdarDied"},
		}, -- Sobald Ardar stirbt, Game Over
	},
 
 	
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			FigureIsDead{Tag = "SkelSiege01"},
 			FigureIsDead{Tag = "SkelSiege02"},
 			FigureIsDead{Tag = "SkelSiege03"},
 			FigureIsDead{Tag = "SkelSiege04"},
 			FigureIsDead{Tag = "SkelSiege05"},
 			FigureIsDead{Tag = "SkelSiege06"},
 			FigureIsDead{Tag = "SkelSiege07"},
 			FigureIsDead{Tag = "SkelSiege08"},
 			FigureIsDead{Tag = "SkelSiege09"},
 			FigureIsDead{Tag = "SkelSiege10"},
 			FigureIsDead{Tag = "SkelSiege11"},
 			FigureIsDead{Tag = "SkelSiege12"},
 			FigureIsDead{Tag = "SkelSiege13"},
 			FigureIsDead{Tag = "SkelSiege14"},
 			FigureIsDead{Tag = "SkelSiege15"},
 			FigureIsDead{Tag = "SkelSiege16"},
 			FigureIsDead{Tag = "SkelSiege17"},
 			FigureIsDead{Tag = "SkelSiege18"},
 			FigureIsDead{Tag = "SkelSiege19"},
 			FigureIsDead{Tag = "SkelSiege20"},
 			FigureIsDead{Tag = "SkelSiege21"},
 			FigureIsDead{Tag = "SkelSiege22"},
 			FigureIsDead{Tag = "SkelSiege23"},
 			FigureIsDead{Tag = "SkelSiege24"},
 			FigureIsDead{Tag = "SkelSiege25"},
 		},
 		Actions =
 		{
 			AvatarFlagSetTrue {Name = "af_P312_SiegeSkelsAllDead"},
 		},
 	},
 	
 	
 	OnOneTimeEvent
   	{
   		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P312_MagnetStonesInfoGiven"},
		},
		Actions =
   		{
   			PlayerKitTransfer{PlayerKit = "pk_Uebergabe", Player = "pl_Human" },
   			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 149 },
    		-- Clans Steinmetz (Stonemason)
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 31},
    		-- Clans HQ Trollerweiterung
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 23},
    		-- Clans Turm Trollerweiterung
    		PlayerBuildingAdd {Player = "pl_Human", BuildingId = 157 },
    		-- Clans Trollbau (Troll Lair)
    		
    		FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry"},
   		},
	}, -- Sobald Ardar seine Infos abgegeben hat, erhält man Aufbau
 	
 	
	
	
	
	
	---------- BISSL CHEATING, UM DIE KARTE ATTRAKTIVER ZU MACHEN
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SkelLeadersKilled", Value = 1},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Player2", Amount = 500},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 500},
			PlayerResourceStoneGive	{Player = "pl_Player2", Amount = 500},
		},
		--- Beim ersten toten Leader erhält der AI-Player 500 von allem
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SkelLeadersKilled", Value = 2},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Player2", Amount = 1000},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 1000},
			PlayerResourceStoneGive	{Player = "pl_Player2", Amount = 1000},
		},
		--- Beim zweiten toten Leader erhält der AI-Player 1000 von allem
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SkelLeadersKilled", Value = 3},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Player2", Amount = 2000},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 2000},
			PlayerResourceStoneGive	{Player = "pl_Player2", Amount = 2000},
		},
		--- Beim dritten toten Leader erhält der AI-Player 2000 von allem
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_SkelLeadersKilled", Value = 4},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_Player2", Amount = 4000},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 4000},
			PlayerResourceStoneGive	{Player = "pl_Player2", Amount = 4000},
		},
		--- Beim vierten toten Leader erhält der AI-Player 4000 von allem
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadHQ"},
			MapValueIsEqual{Name = "mv_SkelLeadersKilled", Value = 5},
    		--PlayerHasNotBuildingAmount{Player = "pl_Player2", Amount = 1, OnlyCompleted = default},
    		PlayerHasNotFigureAmountEx	{Player = "pl_Player2", Amount = 5, CountWorkers = false, CountAvatarAndHeroes = false},
    		PlayerHasNotBuildingAmount{Player = "pl_Player2", Amount = 3, OnlyCompleted = yes},
    		FigureIsDead{Tag = "Leader99"},
			FigureIsDead{Tag = "Leader01"},
			FigureIsDead{Tag = "Leader02"},
			FigureIsDead{Tag = "Leader03"},
			FigureIsDead{Tag = "Leader04"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P312_CS02Start"},
			MapFlagSetTrue{Name = "mf_EnemyAIKilled"},
    		AIPlayerDeactivate	{Player = "pl_Player2"},
		},
	},
	
	
	
	
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	---------------------------------------------------------------------------
	-- Saras Magnetsplitter auch hier solven, falls der Spieler den Splitter schon in der Tasche hat bevor er die Quest annimmt
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "GoSTheHouseOfGreySara"},
    		QuestIsActive {Quest = "HouseOfGreyFindMagneticShard"},
    		-- hat der Spieler Item.Misc.MagnetStone
    		AvatarHasItemMisc {ItemId = 199, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyFindMagneticShard"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToSara"},
    	}
    },
    -- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintMagnetStones"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 377.731, Y = 179.578, Direction = 0},
			FogOfWarRevealAtEntity	{Tag = "PaintingMarker", Range = 10, Height = default},
		}
	},
	-- Bild von Magnet Stones malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintMagnetStones"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintMagnetStones"},
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
	-- Professor Drehlein
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTiwst3SearchMagnetOre"},
			AvatarHasItemMisc {ItemId = Item.Misc.MagnetShard, Amount = 2}
		},
		Actions =
		{
			QuestSetSolved {Quest = "RightTiwst3SearchMagnetOre"},
			QuestSetActive {Quest = "RightTwist3BringOreToProf"},
		}
	},
	
	
	-- Rachequest
    OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RevengeKillItza"},
			FigureIsDead {Tag = "Itza"},
			FigureIsDead {Tag = "ItzaSpider01"},
			FigureIsDead {Tag = "ItzaSpider02"},
			FigureIsDead {Tag = "ItzaSpider03"},
			AvatarHasItemMisc {ItemId = 220, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "RevengeKillItza"},
		},
	},
	-- Nur mit beiden Köpfen wird gesolved
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "RevengeKillItza"},
			QuestIsSolved {Quest = "RevengeKillShar"},
			QuestIsNotKnown {Quest = "RevengeBringHeadItza"},
			QuestIsNotKnown {Quest = "RevengeBringHeadShar"}
		},
		Actions =
		{
			QuestSetActive {Quest = "RevengeBringHeadItza"},
			QuestSetActive {Quest = "RevengeBringHeadShar"}
		}
	},


	
	--------------------------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills  ---------------------------------
	--------------------------------------------------------------------------------------------------
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Mineguard01"},
			-- Mineguard01
		},
		Actions =
		{
			MapValueAdd{Name = "mv_MineguardsKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_Mineguard01Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Mineguard02"},
			-- Mineguard02
		},
		Actions =
		{
			MapValueAdd{Name = "mv_MineguardsKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_Mineguard02Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Mineguard03"},
			-- Mineguard03
		},
		Actions =
		{
			MapValueAdd{Name = "mv_MineguardsKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_Mineguard03Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Mineguard04"},
			-- Mineguard04
		},
		Actions =
		{
			MapValueAdd{Name = "mv_MineguardsKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_Mineguard04Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Mineguard05"},
			-- Mineguard05
		},
		Actions =
		{
			MapValueAdd{Name = "mv_MineguardsKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_Mineguard05Killed"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader01"},
			-- In Skelettburg: Gebuffter Leader01
		},
		Actions =
		{
			MapValueAdd{Name = "mv_SkelLeadersKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_SkelBoss01Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader02"},
			-- In Skelettburg: Gebuffter Leader02
		},
		Actions =
		{
			MapValueAdd{Name = "mv_SkelLeadersKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_SkelBoss02Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader03"},
			-- In Skelettburg: Gebuffter Leader03
		},
		Actions =
		{
			MapValueAdd{Name = "mv_SkelLeadersKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_SkelBoss03Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader04"},
			-- In Skelettburg: Gebuffter Leader04
		},
		Actions =
		{
			MapValueAdd{Name = "mv_SkelLeadersKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_SkelBoss04Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader99"},
			-- In Skelettburg: Oberchef
		},
		Actions =
		{
			MapValueAdd{Name = "mv_SkelLeadersKilled", Value = 1},
			MapFlagSetTrue{ Name = "mf_SkelBoss99Killed"},
		},
	},
};
