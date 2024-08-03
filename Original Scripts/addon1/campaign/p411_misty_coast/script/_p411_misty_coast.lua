State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		-- Bei Mapstart wird die 1. Cutscene abgespielt
		Conditions =
		{
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 2316, X = 231, Y = 551.6, Direction = 1, Tag = "EndTowerLight"},
			-- an die Position des EndTowers kommt der Effekt
			
			MapFlagSetTrue {Name = "mf_CS01Start"},
			AvatarFlagSetTrue	{Name = "af_P411_MistyCoastKnown"},
		},
	},
	
	
	OnOneTimeEvent
	{
		-- Double des Formers erhält HoldPosition
		Conditions =
		{
		};
		Actions =
		{
			FigureHoldPosition	{Tag = "FormerDouble"},
		};
		
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AllCampsFreed"},
			FigureIsAlive{Tag = "pl_HumanAvatar"},
			MapFlagIsFalse{Name = "mf_RTSUnitsOvergiven"},
				
		},
		Actions =
		{
			FigureRtsPlayerSpawnToEntity{UnitId = 158 , Player = "default", TargetTag = "pl_HumanAvatar", Amount = 15},
			FigureOutcry{TextTag = "FreedBuilding02", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue{Name = "mf_RTSUnitsOvergiven"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AllCampsFreed"},
			FigureIsDead{Tag = "pl_HumanAvatar"},
			MapFlagIsFalse{Name = "mf_RTSUnitsOvergiven"},
		},
		Actions =
		{
			FigureRtsPlayerSpawnToEntity{UnitId = 158 , Player = "default", TargetTag = "pl_HumanAvatar_dead", Amount = 15},
			MapFlagSetTrue{Name = "mf_RTSUnitsOvergiven"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
		},
		Actions =
		{
			MapTimerStart{Name = "mt_SpawnFlyerTimer", Seconds = MySpawnTime},
			-- Luftangriffe starten jetzt
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source1Disabled"},
			MapFlagIsTrue{Name = "mf_Source2Disabled"},
			MapFlagIsTrue{Name = "mf_Source3Disabled"},
			MapFlagIsTrue{Name = "mf_Source4Disabled"},
			MapFlagIsTrue{Name = "mf_Source5Disabled"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "EndTowerLight"},
			BuildingTeamTransfer	{Tag = "EndTower", Team = "tm_Neutral"},
		},
	},
	
	--- !!!
	--- !!!  Mit Hilfe des Drachen Ur werden die Bindstones auf den Inseln freigeschaltet
	--- !!!
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint01", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint01"},
			--FigureOutcry{TextTag = "BindpointClaimed", Tag = "pl_HumanUr"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint02", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint02"},
			--FigureOutcry{TextTag = "BindpointClaimed", Tag = "pl_HumanUr"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint03", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint03"},
			--FigureOutcry{TextTag = "BindpointClaimed", Tag = "pl_HumanUr"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint04", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint04"},
			--FigureOutcry{TextTag = "BindpointClaimed", Tag = "pl_HumanUr"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint05", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint05"},
			--FigureOutcry{TextTag = "BindpointClaimed", Tag = "pl_HumanUr"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange{Tag = "DragonCompanion", TargetTag = "Bindpoint06", Range = 15},
		},
		Actions =
		{
			PlayerTravelStoneAdd{Player = "default", Tag = "Bindpoint06"},
			FigureOutcry{TextTag = "BindpointClaimed", Tag = "DragonCompanion"},
		},
	},
	
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerDoubleSpawned"},
			FigureIsDead{Tag = "FormerDouble"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_FormerDoubleKilled"},
			MapFlagSetTrue {Name = "mf_CS03Start"},
		},
	},
	
	
	--- GAME OVER CONDITION
	OnOneTimeEvent
	{
		-- Wenn Ur übergeben & getötet wurde
		-- und die Quest noch nicht erfüllt ist
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CS02Ended"},
			FigureIsDead{Tag = "DragonCompanion"},
			QuestIsNotSolved{Player = "pl_Human", Quest = "MistyCoast_KillFormer"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1DragonCompaionDead"},
		},
	},
	

	-- nach der 3. Cutscene wird Companion Ur entfernt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CS03Ended"},
		},
		Actions =
		{
			--PlayerHeroRemove{Player = "pl_Human", Tag = "Ur"},
			FigureVanish{Tag = "DragonCompanion"},
		},
	},


--	OnEvent
--	{
--		-- stirbt Ur & die HeroHall steht noch
--		-- respawnt Ur an der HeroHall
--		Conditions =
--		{
--			MapFlagIsTrue{Name = "mf_CS02Ended"},
--			MapFlagIsFalse{Name = "mf_CS03Ended"},
--			FigureIsDead{Tag = "pl_HumanUr"},
--			BuildingIsAlive	{Tag = "CollectBuilding5"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "Ur", TargetTag = "CollectBuilding5", Direction = 85},
--		},
--	},
	
--	OnEvent
--	{
--		-- stirbt Ur & die HeroHall steht noch
--		-- respawnt Ur beim Avatat
--		Conditions =
--		{
--			MapFlagIsTrue{Name = "mf_CS02Ended"},
--			MapFlagIsFalse{Name = "mf_CS03Ended"},
--			FigureIsDead{Tag = "pl_HumanUr"},
--			BuildingIsDead{Tag = "CollectBuilding5"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "Ur", TargetTag = "pl_HumanAvatar", Direction = 85},
--		},
--	},


	----------------------------------------------------------------------------------------
	---- XP für Boss-Kills -----------------------------------------------------------------
	----------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		-- Geweihter01
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Blessed01Spawned"},
			FigureIsDead{Tag = "IslandBlessed01"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed01"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Geweihter02
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Blessed02Spawned"},
			FigureIsDead{Tag = "IslandBlessed02"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed02"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Geweihter03
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Blessed03Spawned"},
			FigureIsDead{Tag = "IslandBlessed03"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed03"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Geweihter04
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Blessed04Spawned"},
			FigureIsDead{Tag = "IslandBlessed04"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed04"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Geweihter05
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Blessed05Spawned"},
			FigureIsDead{Tag = "IslandBlessed05"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed05"},
		},
	},
	
	
	OnOneTimeEvent
	{
		-- FormerDouble
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerDoubleSpawned"},
			FigureIsDead{Tag = "FormerDouble"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledFormerDouble"},
		},
	},
	
}