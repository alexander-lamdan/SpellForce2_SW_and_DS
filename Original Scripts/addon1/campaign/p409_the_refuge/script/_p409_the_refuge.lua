

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "MAIN",
	};
};


State
{
	StateName = "MAIN",
	
	OnOneTimeEvent
	{
		-- gleich zu Beginn startet die 1. Cutscene
		-- und der 1. Travelstone wird geadded
		Conditions =
		{
		},
		Actions =
		{
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "TravelStone01"},
			PlayerBuildingUpgradeAdd{Player = "default", UpgradeId = 53}, -- Schwarze Schmiede Upgrade
			MapFlagSetTrue {Name = "mf_CS01Start"},
		},
	},

	OnOneTimeEvent
	{
		-- sobald die 1. Cutscene vorbei ist, startet der Attack-Troop-Timer
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS01Ended"},
		},
		Actions =
		{
			MapTimerStart{Name = "mt_AttackTroopTimer"},
		},
	},
	
	
	-- Drachlingslager zerstört

	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "NestA01"},
			BuildingIsDead{Tag = "NestA02"},
			BuildingIsDead{Tag = "NestA03"},
			BuildingIsDead{Tag = "NestA04"},
			BuildingIsDead{Tag = "NestA05"},
			BuildingIsDead{Tag = "NestA06"},
			BuildingIsDead{Tag = "NestA07"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_NestAKilled"},
			ObjectVanish{Tag = "NestmarkerA"},
			MapFlagSetTrue{Name = "mf_KilledCamp1"}, -- für XP
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "NestB01"},
			BuildingIsDead{Tag = "NestB02"},
			BuildingIsDead{Tag = "NestB03"},
			BuildingIsDead{Tag = "NestB04"},
			BuildingIsDead{Tag = "NestB05"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_NestBKilled"},
			ObjectVanish{Tag = "NestmarkerB"},
			MapFlagSetTrue{Name = "mf_KilledCamp2"}, -- für XP
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "NestC01"},
			BuildingIsDead{Tag = "NestC02"},
			BuildingIsDead{Tag = "NestC03"},
			BuildingIsDead{Tag = "NestC04"},
			BuildingIsDead{Tag = "NestC05"},
			BuildingIsDead{Tag = "NestC06"},
			BuildingIsDead{Tag = "NestC07"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_NestCKilled"},
			ObjectVanish{Tag = "NestmarkerC"},
			MapFlagSetTrue{Name = "mf_KilledCamp3"}, -- für XP
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "NestD01"},
			BuildingIsDead{Tag = "NestD02"},
			BuildingIsDead{Tag = "NestD03"},
			BuildingIsDead{Tag = "NestD04"},
			BuildingIsDead{Tag = "NestD05"},
			BuildingIsDead{Tag = "NestD06"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_NestDKilled"},
			ObjectVanish{Tag = "NestmarkerD"},
			MapFlagSetTrue{Name = "mf_KilledCamp4"}, -- für XP
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_NestDKilled"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_SecondPartOfMapStarted"},
			MapFlagSetTrue {Name = "mf_CS02Start"},
			GateSetOpen	{Tag = "DragonDoor01"},
			GateSetOpen	{Tag = "DragonDoor02"},
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
			FigureOutcry{TextTag = "AfterShaeCutscene01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "AfterShaeCutscene02", Tag = "Shae"},
			FigureOutcry{TextTag = "AfterShaeCutscene03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry{TextTag = "AfterShaeCutscene04", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry{TextTag = "AfterShaeCutscene05", Tag = "pl_HumanHeroCaine"},
			FigureOutcry{TextTag = "AfterShaeCutscene06", Tag = "pl_HumanHeroCaine"},
			FigureOutcry{TextTag = "AfterShaeCutscene07", Tag = "pl_HumanHeroCaine"},
			
			PlayerBuildingTeamTransfer	{Player = "pl_Human", Team = "tm_Neutral"},
		},
	},
	
	OnOneTimeEvent
	{
		-- sobald irgendwer den Drachen entdeckt
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroWind", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroWhisper", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroCaine", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanNightsong", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroYasha", TargetTag = "SoulCarrier", Range = 30 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroMordecay", TargetTag = "SoulCarrier", Range = 30 },
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_DiscoveredSoulCarrier"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Soul01Disintegrated"},
			MapFlagIsTrue{Name = "mf_Soul02Disintegrated"},
			MapFlagIsTrue{Name = "mf_Soul03Disintegrated"},
			--MapFlagIsTrue{Name = "mf_Soul04Disintegrated"},
			MapFlagIsTrue{Name = "mf_Soul05Disintegrated"},
			AvatarIsNotTalking{},
			GameInterfaceIsVisible{},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_AllDragonSoulsDisintegrated"},
			MapFlagSetTrue{Name = "mf_CS03Start"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Nach dem Ende der 3. Cutscene
		-- erhält Spieler neuen Aufbau
		-- und der Beast-Gegner fängt an aufzubauen
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_BeastAttack"},
			--PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_DragonUebergabe"},
			
			ObjectVanish	{Tag = "BeastBarricade"},
			
			PlayerBuildingAdd{Player = "default", BuildingId = 201 }, -- Dragons Den
			PlayerBuildingUpgradeAdd{Player = "default", UpgradeId = 47}, -- HQ Dragons Upgrade
			PlayerBuildingUpgradeAdd{Player = "default", UpgradeId = 50}, -- Tower Dragons Upgrade
			PlayerBuildingUpgradeAdd{Player = "default", UpgradeId = 54}, -- Dragon Firemount Upgrade
			PlayerBuildingUpgradeAdd{Player = "default", UpgradeId = 57}, -- Dragon Stone Upgrade 
			
			MapFlagSetTrue {Name = "mf_BeastBuildStarted"},
			
			-- Beasts spawnen in die Drachencamps und den Spieleraufbau
			-- NO LONGER USED!
			--FigureRtsPlayerSpawnToEntity{UnitId = 134, Player = "pl_BeastAttack", TargetTag = "BeastAttack01", Amount = 15},
			--FigureRtsPlayerSpawnToEntity{UnitId = 134, Player = "pl_BeastAttack", TargetTag = "BeastAttack02", Amount = 15},
			--FigureRtsPlayerSpawnToEntity{UnitId = 134, Player = "pl_BeastAttack", TargetTag = "BeastAttack03", Amount = 15},
			--FigureRtsPlayerSpawnToEntity{UnitId = 134, Player = "pl_BeastAttack", TargetTag = "BeastAttack04", Amount = 15},
			--FigureRtsPlayerSpawnToEntity{UnitId = 134, Player = "pl_BeastAttack", TargetTag = "BeastAttack05", Amount = 15},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_BeastBuildStarted"},
			PlayerHasNotBuildingAmount	{Player = "pl_BeastAttack", Amount = 3, OnlyCompleted = false},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_BeastBuildKilled"},
			AIPlayerDeactivate	{Player = "pl_BeastAttack"},
			
			MapFlagSetTrue{Name = "mf_CS04Start"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_RiddengardSpawned"},
			FigureIsDead{Tag = "Riddengard"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_RiddengardKilled"},
			MapFlagSetTrue{Name = "mf_KilledRiddengard"}, -- für XP
			MapFlagSetTrue{Name = "mf_CS05Start"},
		},
	},
	
	
	----------------------------------------------------------------------------
	-- RESSOURCENOBJKETE : SILBER UND STEIN
	-- NO LONGER NEEDED!
	
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "default", ItemId = 252, Amount = 1}, -- 50 Stück Silber
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 252 , Amount = 1},
			PlayerResourceSilverGive	{Player = "default", Amount = 50},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "default", ItemId = 258, Amount = 1}, -- 50 Stück Silber
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 258 , Amount = 1},
			PlayerResourceStoneGive	{Player = "default", Amount = 50},
		},
	},
	
	
	
	--- ADDITIONAL OUTCRIES
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "MordecayHome1", Tag = "Shae"},
			FigureOutcry{TextTag = "MordecayHome2", Tag = "pl_HumanHeroMordecay"},
			FigureOutcry{TextTag = "MordecayHome3", Tag = "pl_HumanHeroMordecay"},
			FigureOutcry{TextTag = "MordecayHome4", Tag = "Shae"},
			FigureOutcry{TextTag = "MordecayHome5", Tag = "Shae"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TalkedWithSoulCarrier"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "MordecayHome6", Tag = "SoulCarrier"},
			FigureOutcry{TextTag = "MordecayHome7", Tag = "pl_HumanHeroMordecay"},
			FigureOutcry{TextTag = "MordecayHome8", Tag = "pl_HumanHeroMordecay"},
			FigureOutcry{TextTag = "MordecayHome9", Tag = "SoulCarrier"},
			FigureOutcry{TextTag = "MordecayHome10", Tag = "SoulCarrier"},
		},
	},
};

