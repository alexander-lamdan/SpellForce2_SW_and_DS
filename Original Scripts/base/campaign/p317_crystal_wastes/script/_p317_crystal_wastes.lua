------------------------------------------------------------------------
--
--	Plattformscript P317 Crystal Wastes
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
			-- Spieler erhält Steinmetz
			-- Spieler erhält zu Beginn die neuen Gebäude
			-- Freskenturm & Bloodfire & die Gargoyle-Erweiterungen erst, wenn er die Essenzen lootet!
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 133},

    		-- wegen Bug 20971, sonst startet 2. Cutscene nicht
    		MapTimerStart {Name = "mt_AvatarIsNotTalking"},
    		
    		 -- gleich zu Beginn wird 1. Cutscene gestartet
    		AvatarFlagSetTrue{Name = "af_P317_Cutscene01Begin"},	
    	},
		GotoState = "Main",
	},
};


State
{
	StateName = "Main",
    
   	------------------------------------------------------------------------
   	-- Einige Minuten nach dem Ende der ersten Cutscene kommen Malkuth-Outcries
   	
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarFlagIsTrue{Name = "af_P317_CS01Finished"},
   		},
   		Actions =
   		{
   			MapTimerStart{Name = "mt_TimerToMalkuthOutcry"},
   			PlayerActivate	{Player = "pl_Player2"},
   		},
   	},
   	
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			MapTimerIsElapsed{Name = "mt_TimerToMalkuthOutcry", Seconds = 360},  
   		},
   		Actions =
   		{
   			FigureOutcry{TextTag = "MalkuthInfo01", Tag = "pl_HumanNightsong"},
   			FigureOutcry{TextTag = "MalkuthInfo02", Tag = "pl_HumanAvatar"},
   			FigureOutcry{TextTag = "MalkuthInfo03", Tag = "pl_HumanNightsong"},
   			FigureOutcry{TextTag = "MalkuthInfo04", Tag = "pl_HumanNightsong"},
   			FigureOutcry{TextTag = "MalkuthInfo05", Tag = "pl_HumanNightsong"},
   			FigureOutcry{TextTag = "MalkuthInfo06", Tag = "pl_HumanNightsong"},     
   		},
   	},
   	
   	------------------------------------------------------------------------
    
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc{ItemId = 48, Amount = 1 },
			AvatarHasItemMisc{ItemId = 49, Amount = 1 },
			AvatarHasItemMisc{ItemId = 50, Amount = 1 },
			AvatarHasItemMisc{ItemId = 51, Amount = 1 },
			AvatarHasItemMisc{ItemId = 52, Amount = 1 },
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P317_Cutscene02Begin"},
    		AvatarFlagSetTrue{Name = "af_P317_TomeCompleted"},
    		
    		AvatarItemMiscTake{ItemId = 48, Amount = 1 },
			AvatarItemMiscTake{ItemId = 49, Amount = 1 },
			AvatarItemMiscTake{ItemId = 50, Amount = 1 },
			AvatarItemMiscTake{ItemId = 51, Amount = 1 },
			AvatarItemMiscTake{ItemId = 52, Amount = 1 },	
    		AvatarItemMiscGive{ItemId = 174, Amount = 1 },
    		
    		FogOfWarReveal	{X = 273.155, Y = 114.165, Range = 30, Height = default},
    		PlayerTravelStoneAdd{Player = "pl_Human", Tag = "BindstoneIce"},
    		
    		FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry"},
    		
    	}, -- Sobald Spieler alle fünf Teile des Buches hat,
    	-- wird 2. Cutscene gestartet
    	-- Außerdem wird der Journey-Point der Eis-Essenz aufgedeckt
    },
    
 
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc{Player = "pl_Human", ItemId = 54, Amount = 1},
    	},
    	Actions =
    	{
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 141},
    		FigureOutcry{TextTag = "EssenceIceFound", Tag = "pl_HumanNightsong"},
    		PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 30 },
			-- Spieler erhält Gargoyle-Erweiterung für HQ
			PlayerBuildingUpgradeAdd{Player = "pl_Human", UpgradeId = 22 },
			-- Spieler erhält Gargoyle-Erweiterung für Tower
    		
    		FogOfWarReveal	{X = 50.4714, Y = 236.888, Range = 30, Height = default},
    		PlayerTravelStoneAdd{Player = "pl_Human", Tag = "BindstoneFire"},
    		PlayerTravelStoneAdd{Player = "pl_Human", Tag = "BindstoneStart"},
    	}, 
    	-- sobald der Spieler die Eisessenz hat, bekommt er den Freskenturm und die Gargoyle-Erweiterungen
    	-- Außerdem wird der JourneyPunkt bei den Feuerelementen aufgedeckt
    	-- zur Sicherheit wird außerdem noch ein Bindstone im Aufbaubereich geadded (falls der Spieler
    	-- vergessen haben sollte, einen auf dem Festland zu aktivieren)
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarHasItemMisc{Player = "pl_Human", ItemId = 53, Amount = 1},
    	},
    	Actions =
    	{
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 143},
    		FigureOutcry{TextTag = "EssenceFireFound", Tag = "pl_HumanNightsong"},
    		
    		PlayerTravelStoneAdd{Player = "pl_Human", Tag = "EndTravelStone"},
    		FogOfWarReveal	{X = 164.57, Y = 264.294, Range = 30, Height = default},
    		
    	},
    	-- sobald der Spieler die Feueressenz hat, bekommt er das Bloodfire
    	-- danach wird der Bindstone auf der letzten Insel freigeschaltet
    },
    
    
    
    ----------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills ---------------------------------
	----------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "GolemKingFire"},
			-- Feuergolem Boss
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_GolemBossFireKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "GolemKingIce"},
			-- Eisgolem Boss
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_GolemBossIceKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Gruff"},
			-- 1. Orkchief: Gruff
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_OrcGeneral01Killed"},
			
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 5000},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			FigureIsDead{Tag = "Karn"}, 
		},
		-- 2. Orkchief: Karn
		Actions = 
		{ 
			MapFlagSetTrue{ Name = "mf_OrcGeneral02Killed"},
			
			PlayerResourceLenyaGive{Player = "pl_Player2", Amount = 6000},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Arboghast"},
			-- 3. Orkchief: Koshar
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_OrcGeneral03Killed"},
			
			PlayerResourceStoneGive{Player = "pl_Player2", Amount = 7000},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Uthbrand"},
			-- 4. Orkchief: Hog
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_OrcGeneral04Killed"},
			
			PlayerResourceLenyaGive{Player = "pl_Player2", Amount = 8000},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Sonnenspeer"},
			-- 5. Orkchief: Arduk
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_OrcGeneral05Killed"},
			
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 9000},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "IceEssence"},
			-- Träger der Eisessenz
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_IceEssenceKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "FireEssence"},
			-- Träger der Feueressenz
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_FireEssenceKilled"},
		},
	},
	
	
	---------------------------------------------------------------------------------
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		BuildingIsDead{Tag = "EnemyHQ"},
    		PlayerHasNotBuildingAmount{Player = "pl_Player2", Amount = 3, OnlyCompleted = default},
    		PlayerHasNotFigureAmountEx	{Player = "pl_Player2", Amount = 5, CountWorkers = false, CountAvatarAndHeroes = false},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P317_EndHQKilled"},
    		AIPlayerDeactivate{Player = "pl_Player2"},
    	},
    },
    
    
    
    ---------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------
    
    OnToggleEvent
	{
		OnConditions = 
		{
			FigureIsDead{Tag = "GolemFire01"},
			FigureIsDead{Tag = "GolemFire02"},
			FigureIsDead{Tag = "GolemFire03"},
			FigureIsDead{Tag = "GolemFire04"},
			FigureIsDead{Tag = "GolemFire05"},
		},
		OnActions = 
		{
			MapFlagSetTrue{Name = "mf_AllFireGolemsRespawn"},
		},
		OffConditions = 
		{
			FigureIsAlive{Tag = "GolemFire01"},
			FigureIsAlive{Tag = "GolemFire02"},
			FigureIsAlive{Tag = "GolemFire03"},
			FigureIsAlive{Tag = "GolemFire04"},
			FigureIsAlive{Tag = "GolemFire05"},
		},
		OffActions = 
		{
			MapFlagSetFalse{Name = "mf_AllFireGolemsRespawn"},
		},
	};
	
	
	OnToggleEvent
	{
		OnConditions = 
		{
			FigureIsDead{Tag = "GolemIce01"},
			FigureIsDead{Tag = "GolemIce02"},
			FigureIsDead{Tag = "GolemIce03"},
			FigureIsDead{Tag = "GolemIce04"},
			FigureIsDead{Tag = "GolemIce05"},
		},
		OnActions = 
		{
			MapFlagSetTrue{Name = "mf_AllIceGolemsRespawn"},
		},
		OffConditions = 
		{
			FigureIsAlive{Tag = "GolemIce01"},
			FigureIsAlive{Tag = "GolemIce02"},
			FigureIsAlive{Tag = "GolemIce03"},
			FigureIsAlive{Tag = "GolemIce04"},
			FigureIsAlive{Tag = "GolemIce05"},
		},
		OffActions = 
		{
			MapFlagSetFalse{Name = "mf_AllIceGolemsRespawn"},
		},
	};
	
	
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
		-- 100 Lenya
	},



}

