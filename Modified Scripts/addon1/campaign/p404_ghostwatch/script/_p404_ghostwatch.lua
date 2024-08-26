dofile(GetScriptPath() .. "UndeadSpawnSharedScript.lua")


State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		-- Es wird zufällig eine der 4 Tower-Kombos ausgewählt
		Conditions =
		{
		},
		Actions =
		{
			MapValueRandomize{Name = "mv_TowerKombo", MinValue = 1, MaxValue = 4},
			MapValueSet{Name = "mv_TowerClues", Value = 0},
		},
	},
	
	
	OnOneTimeEvent
	{
		-- Bei Mapstart wird die 1. Cutscene abgespielt
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS01Start"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Commander", Range = 20 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroWind", TargetTag = "Commander", Range = 20 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroWhisper", TargetTag = "Commander", Range = 20 },
				FigureIsInEntityRange{Tag = "pl_HumanHeroCaine", TargetTag = "Commander", Range = 20 },
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_AvatarReachedRealmTroops"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn mit dem Kommandanten gesprochen wurde
			MapFlagIsTrue{Name = "mf_CommanderDialogEndedTroopsGiven"},
		},
		Actions =
		{
			PlayerKitTransfer{Player = "pl_Human", PlayerKit = "pk_HeroHall"},
			
			PlayerActivate{Player = "pl_Undead"},
			PlayerActivate{Player = "pl_SecondUndead"},
			
			MapTimerStart{Name = "mt_UndeadBuildStart"},
			-- Untotentimer startet jetzt
			GateSetOpen	{Tag = "Gate03"},
			GateSetOpen	{Tag = "Gate05"},
			-- Tore am Anfang öffnen sich
		},
	},
	
	
	OnOneTimeEvent
	{
		-- wenn der Schlüssel im Keyhole gedreht wurde
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KeyLockOpened"},
		},
		-- öffnet sich das Tor zur Geisterwacht
		Actions =
		{
			GateSetOpen{Tag = "Gate02"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn der Spieler oder einer seiner Helden in die Ghostwatch kommt
			OR
			{
				FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "GhostwatchChecker", Range = 20},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWind", TargetTag = "GhostwatchChecker", Range = 20},
				FigureIsInEntityRange{Tag = "pl_HumanHeroWhisper", TargetTag = "GhostwatchChecker", Range = 20},
				FigureIsInEntityRange{Tag = "pl_HumanHeroCaine", TargetTag = "GhostwatchChecker", Range = 20},
			},
		},
		Actions =
		{
			-- wird ein Flag gesetzt, daß nun die Geisterwacht erreicht wurde
			MapFlagSetTrue{Name = "mf_ReachedGhostwatch"},
			
			-- 3. Cutscene startet
			MapFlagSetTrue {Name = "mf_CS03Start"},
			
			-- wird ein Flag gesetzt, daß nun die Geweihten angreifen
			MapFlagSetTrue{Name = "mf_BlessedAttack"},
			
			-- wird die Untoten-KI gestoppt
			AIPlayerDeactivate	{Player = "pl_Undead"},
			AIPlayerDeactivate	{Player = "pl_SecondUndead"},
			
			-- wird das Tor geöffnet
			GateSetOpen	{Tag = "Gate01"},
			
			-- Timer wird gestartet, damit wenige Sekunden später der Aufbau übergeben werden kann
			MapTimerStart{Name = "mt_FirstBuildDeleted"},
			
			-- Fog Of War Aufdeckung in der Geisterwacht
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "FoWExplorer", Range = 120, Height = default},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn 5 Sekunden um sind
			MapTimerIsElapsed{Name = "mt_FirstBuildDeleted", Seconds = 5},
		},
		Actions =
		{
			-- erhält er den Aufbau
			PlayerKitTransfer{Player = "pl_Human", PlayerKit = "pk_PlayerSecondBuild"},
			
			PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 45}, -- Shaikan HQ Upgr 
			
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 203 }, -- Shaikan Barracks
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 204 }, -- Shaikan Teachinghall
			PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 55}, -- Barracks Upgr Garrison
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 198 }, -- Shaikan Tower
			PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 51}, -- Shaikan Tower Upgrade
			PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 013},
			PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 014},
			PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 015},
			PlayerUnitUpgradeAdd	{Player = "pl_Human", UpgradeId = 016},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CaineGotHisKillOrder"},
			FigureIsDead{Tag = "Caine"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS02Start"},
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
			PlayerHeroAdd {Player = "pl_Human", HeroId = 109},
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 5},
		},
	},
	
	
	-----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	----------------------          AGATHOS - ITEMS          ---------------------------
	-----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das erste Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 0},
		},
		Actions =
		{
			-- er erhält den Ring
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 270, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das zweite Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 1},
		},
		Actions =
		{
			-- er erhält das Buch
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 271, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 2},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das dritte Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 2},
		},
		Actions =
		{
			-- er erhält das Medaillon
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 272, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 3},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das vierte Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 3},
		},
		Actions =
		{
			-- er erhält den Froststab
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 274, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 4},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das fünfte Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 4},
		},
		Actions =
		{
			-- er erhält das Pergament
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 273, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 5},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Spieler hat das sechste Säckchen
			AvatarHasItemMisc{Player = "default", ItemId = 269, Amount = 1},
			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 5},
		},
		Actions =
		{
			-- er erhält die Kappe
			AvatarItemMiscTake{Player = "default", ItemId = 269, Amount = 1},
			AvatarItemMiscGive{Player = "default", ItemId = 275, Amount = 1},
			AvatarValueSet{Player = "default", Name = "av_P404_AgathosItemsFound", Value = 6},
		},
	},
	
	
	---------------------- Outcries
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
		},
		Actions =
		{
			FigureOutcry{TextTag = "SQAgathosReady01", Tag = "Agathos"},
			FigureOutcry{TextTag = "SQAgathosReady02", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "SQAgathosReady03", Tag = "Agathos"},
			FigureOutcry{TextTag = "SQAgathosReady04", Tag = "Agathos"},
			FigureOutcry{TextTag = "SQAgathosReady05", Tag = "Agathos"},
		},
	},

	----------------------------------------------------------------------------------------
	---- XP für Boss-Kills -----------------------------------------------------------------
	----------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		-- Obergeist
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ObergeistSpawned"},
			FigureIsDead{Tag = "Obergeist"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledObergeist"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Untoten-CampBoss01
		Conditions =
		{
			FigureIsDead{Tag = "UndeadCampBoss01"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledUndeadCampBoss01"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Untoten-CampBoss02
		Conditions =
		{
			FigureIsDead{Tag = "UndeadCampBoss02"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledUndeadCampBoss02"},
		},
	},
	
	
	OnOneTimeEvent
	{
		-- Geweihter 1
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_CounterOfBlessedSpawned", Value = 30},
			FigureIsDead{Tag = "BlessedChef01"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed01"},
		},
	},
	
	OnOneTimeEvent
	{
		-- Geweihter 2
		Conditions =
		{
			MapValueIsGreaterOrEqual{Name = "mv_CounterOfBlessedSpawned", Value = 30},
			FigureIsDead{Tag = "BlessedChef02"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_KilledBlessed02"},
		},
	},
	
	
	-- Questmarker löschen
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadBuild09"},
			BuildingIsDead{Tag = "UndeadBuild12"},
			BuildingIsDead{Tag = "UndeadBuild10"},
		},
		Actions =
		{
			ObjectVanish{Tag = "UndeadCampMarker01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadBuild11"},
			BuildingIsDead{Tag = "UndeadBuild07"},
			BuildingIsDead{Tag = "UndeadBuild08"},
		},
		Actions =
		{
			ObjectVanish{Tag = "UndeadCampMarker02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadBuild01"},
			BuildingIsDead{Tag = "UndeadBuild03"},
			BuildingIsDead{Tag = "UndeadBuild02"},
		},
		Actions =
		{
			ObjectVanish{Tag = "UndeadCampMarker04"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "UndeadBuild04"},
			BuildingIsDead{Tag = "UndeadBuild06"},
			BuildingIsDead{Tag = "UndeadBuild05"},
		},
		Actions =
		{
			ObjectVanish{Tag = "UndeadCampMarker03"},
		},
	},
}



