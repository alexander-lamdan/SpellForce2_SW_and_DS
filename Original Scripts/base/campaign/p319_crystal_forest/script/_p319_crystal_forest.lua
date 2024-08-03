------------------------------------------------------------------------
--
--	Plattformscript P319 Crystal Forest
--
----------------------------------------------------------------------------

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		
		Conditions =
		{
		},
		Actions =
		{
			-- gleich zu Beginn wird 1. Cutscene gestartet
    		AvatarFlagSetTrue{Name = "af_P319_Cutscene01Begin"},
    		
    		-- Zu Beginn wird das mittlere Tor
    		GateSetOpen	{Tag = "GateMiddle"},
    	}, 
		GotoState = "Main",
	},
}


State
{
	StateName = "Main",
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 20, X = 273, Y = 226.8},
    		--FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Gate02", Range = 15},
    		--FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "GateMiddle", Range = 15},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P319_Cutscene02Begin"},	
    	}, -- Kommt der Avatar in die Nähe des stark bewachten Tores
    	-- wird die 2. Cutscene gestartet
    },
   
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P319_CS02Finished"},
    	},
    	Actions =
    	{
    		PlayerBuildingAdd {Player = "pl_Human", BuildingId = 139 },
    		-- Pact Shadow Crystal
    		PlayerBuildingAdd {Player = "pl_Human", BuildingId = 144 },
    		-- Pact Spire of Negation
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 18},
    		-- Pact Shadow Tower Upgrade
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 32},
    		-- Pact Shadow Headquater
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 38},
    		-- Pact Shadow Cathedral
    		FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry"},
    		-- Magmaforge erst, wenn Spieler Erdessenz hat
    		
    		
    		AvatarItemMiscTake{Player = "pl_Human", ItemId = 261, Amount = 1},
    		-- MiscItem Schattenkristall entfernen (Inventory-Aufräumaktion)
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved{Quest = "FindEarthEssence"},
    	},
    	Actions =
    	{
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 36},
    		-- Pact Magma Forge, sobald man die Erdessenz-Quest gesolved hat
    		
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 55, Amount = 1}, -- Erdessenz
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 53, Amount = 1}, -- Feueressenz
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 54, Amount = 1}, -- Eisessenz
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 174, Amount = 1}, -- Buch Darh
    		
    	},
    },
    	
   OnOneTimeLeverEvent
	{
		Lever = "LeverLeft",
		OnConditions = 
		{
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GateLeft"},
			AvatarFlagSetTrue{Name = "af_P319_OneGateOpenend"},	
		},
	};
	
	
	OnOneTimeLeverEvent
	{
		Lever = "LeverRight",
		OnConditions = 
		{
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GateRight"},
			AvatarFlagSetTrue{Name = "af_P319_OneGateOpenend"},	
		},
	};

   
--   OnOneTimeEvent
--    {
--    	Conditions =
--    	{
--    		QuestIsActive {Quest = "UseShadowsToOpenGates"},
--    		OR
--    		{
--    			FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Gate01", Range = 15},
--    			FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Gate03", Range = 15},
--    		},
--    	},
--    	Actions =
--    	{
--    		AvatarFlagSetTrue{Name = "af_P319_OneGateOpenend"},	
--    	}, -- DUMMY-EVENT: Hierdurch soll simuliert werden, daß sich der Spieler
--    	-- ins Feindeslager geschlichen und von hinten eines der Tore geöffnet hat
--    	
--    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			AND
    			{
    				BuildingIsDead	{Tag = "EnemyHQ"},
    				PlayerHasNotFigureAmountEx	{Player = "pl_Player2", Amount = 5, CountWorkers = false, CountAvatarAndHeroes = false},
    				PlayerHasNotBuildingAmount{Player = "pl_Player2", Amount = 3, OnlyCompleted = yes},
    			},
    			MapFlagIsTrue{Name = "mf_StencilRiddleSolved"},
    		},
    		-- AI wird abgeschaltet, sobald der Spieler entweder (fast) alles plattgehauen hat
    		-- oder das StencilRiddle gelöst hat
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P319_EnemyHQDestroyed"},
    		AIPlayerDeactivate	{Player = "pl_Player2"},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P319_SoundRiddleSolved"}, 
    	},
    	Actions =
    	{
    		PlayerTravelStoneAdd{Player = "pl_Human", Tag = "UpperPlatformStone"},
    		FogOfWarRevealAtEntity	{Tag = "UpperPlatformStone", Range = 20, Height = default},
    	},
    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "CutsceneCheck", Range = 20},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P319_Cutscene03Begin"},
    	},
    	-- wenn Spieler in Nähe der Symbolplatten kommt
    	-- startet 3. Cutscene
    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P319_RightStencils", Value = 8},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P319_Cutscene04Begin"},
    		MapFlagSetTrue{Name = "mf_StencilRiddleSolved"},
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


    
    -------------------------------------------------------------------------------------------
    
    
    
    --------------------------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills  ---------------------------------
	--------------------------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Erdessenz"},
			-- Erdessenz
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_EarthEssenceKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Laborwaechter"},
			-- Laborwaechter
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_LaboraroryWardon"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "HummingCrystal"},
			-- Summender Kristall
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HummingCrystalKilled"},
		},
	},
    
    
    OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "Tower01"},
			BuildingIsDead{Tag = "Tower02"},
			BuildingIsDead{Tag = "Tower03"},
			BuildingIsDead{Tag = "Tower04"},
			BuildingIsDead{Tag = "Tower05"},
			BuildingIsDead{Tag = "Tower06"},
			BuildingIsDead{Tag = "Tower07"},
			BuildingIsDead{Tag = "Tower08"},
			BuildingIsDead{Tag = "Tower09"},
			BuildingIsDead{Tag = "Tower10"},
			BuildingIsDead{Tag = "Tower11"},
		},
		-- sobald alle Türme umgehauen sind
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_AllTowersPlatt"},
		},
	},
   
}                                                                   