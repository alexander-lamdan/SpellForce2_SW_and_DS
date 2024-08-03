spot1X = 177.8
spot1Y = 658
spot2X = 193.2 
spot2Y = 646.8
spot3X = 187.6
spot3Y = 627.2
spot4X = 166.6
spot4Y = 627.2
spot5X = 161
spot5Y = 646.8

spawnVar = 15
spawnVariety = 0
-- Sorvina 
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Endfigth",
		Conditions =
		{
			QuestIsActive {Quest = "SteelShorePart1MalacaysFortress"},
		},
		Actions =
		{
			FigureAbilityAdd {AbilityId = 95},
			FigureHoldPosition {},
		},
	},
}
	
-- Sorvina teleportiert sich fröhlich durch die Map Richung Endkampf
State
{
	StateName = "Endfigth",
	
	-- Wenn der Spieler durch das To ist schickt Sorvina Malar und verpisst sich
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {Range = 10, X = 176, Y = 201}
		},
		Actions =
		{
			FigureOutcry {TextTag = "Sorvina3", Tag = "Sorvina"},
			MapFlagSetTrue {Name = "mf_P319_SorvinaFirstTeleport"},
			FigureTeleport	{X = 177, Y = 394},
			FigureHoldPosition {},
			GateSetOpen {Tag = "Gate2"},
			FigureLookAtDirection {Direction  = 0},
			
		}	
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerFigureIsInRange {X = 177, Y = 394, Range = 15}
		},
		Actions = 
		{
			FigureTeleport	{X = 177, Y = 518},
			MapFlagSetTrue {Name = "mf_P319_SorvinaInFirstPentagram"},
			FigureHoldPosition {},
			ObjectSpawn {ObjectId = 1975, X = 177, Y = 519, Tag = "Effect"},
			GateSetOpen {Tag = "Gate3"},
			GateSetOpen {Tag = "Gate4"},
			FigureOutcry {TextTag = "Sorvina7"},
			FigureOutcry {TextTag = "Sorvina8"},
			FigureLookAtDirection {Direction  = 0},
			MapFlagSetTrue {Name = "mf_P320_FirstSwampBossIsDead"},
			WeatherChange {File = "litAtmo_P320_Steel_Shore_Red"},
		},
	},
	-- Alle Altare sind zerstört, Sorvina geht weiter in den letzten Bereich
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 5},
		},
		Actions = 
		{
			FigureTeleport	{X = 176, Y = 658},
			MapFlagSetTrue {Name = "mf_P319_SorvinaInSecondPentagram"},
			FigureHoldPosition {},
			ObjectVanish {Tag = "Effect"},
			FigureLookAtDirection {Direction  = 0}
		},
	},
	OnOneTimeEvent
	{
		GotoState = "EndFight",
		Conditions = 
		{
			FigureIsInRange {X = 176, Y = 658, Range = 5, Tag = "Sorvina"},
			MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
		},
		Actions = 
		{
			FigureHoldPosition {},
		},
	},
}   
State
{   
	StateName = "EndFight",
	-- HP Outcries
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureHasNotHealth {Tag = "Sorvina", Percent = 50},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "Sorvina4", Tag = "Sorvina"},
		},
	};
	-- Teleports initialisieren
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer"},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			FigureTeleport {Tag = "Sorvina", X = spot1X, Y = spot1Y},
			FigureHoldPosition {},
			
			-- Vodoo Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 93, Power = 2},
			FigureLookAtDirection {Direction  = 0},
			
			-- Alle Immunitäten geben und Algemeine Resi entfernen
			FigureAbilityRemove {AbilityId = 95},
			FigureAbilityAdd {AbilityId = Ability.ImmuneFire},
			FigureAbilityAdd {AbilityId = Ability.ImmuneIce},
			FigureAbilityAdd {AbilityId = Ability.ImmuneMental},
			FigureAbilityAdd {AbilityId = Ability.ImmuneBlack},
			FigureAbilityAdd {AbilityId = Ability.ImmuneProjectile},
			FigureAbilityAdd {AbilityId = 438},
		}
	},
	-- Da die SPawns geblockt werden können muss zur Sicherheit immer mal wieder ein neuer Wert ausgewürfelt werden
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = 10},
			--EntityTimerIsElapsed {Name = "et_P319_SorvinaSave", Seconds = 2},--
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 1},
			EntityFlagIsFalse {Name = "ef_P319_Wait"},
		},
		Actions =
		{
			EffectStart {Tag = "TeleportLocation1", File = "Effect_Dummy_Loop"},
			EntityFlagSetTrue {Name = "ef_P319_Wait"},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar+spawnVariety},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 1},
			PlayerFigureIsNotInRange {X = spot1X, Y = spot1Y, Range = 5}
		},
		Actions =
		{
			EffectStop {Tag = "TeleportLocation1"},
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer",},
			FigureTeleport {Tag = "Sorvina", X = spot1X, Y = spot1Y},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			EntityFlagSetFalse {Name = "ef_P319_Wait"},
			FigureHoldPosition {},
			
			-- Vodoo Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 58, Power = 2},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 2},
			EntityFlagIsFalse {Name = "ef_P319_Wait"}
		},
		Actions =
		{
			EffectStart {Tag = "TeleportLocation2", File = "Effect_Dummy_Loop"},
			EntityFlagSetTrue {Name = "ef_P319_Wait"},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar+spawnVariety},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 2},
			PlayerFigureIsNotInRange {X = spot2X, Y = spot2Y, Range = 5}
		},
		Actions =
		{
			EffectStop {Tag = "TeleportLocation2"},
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer",},
			FigureTeleport {Tag = "Sorvina", X = spot2X, Y = spot2Y},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			EntityFlagSetFalse {Name = "ef_P319_Wait"},
			FigureHoldPosition {},
			
			-- Fire Storm Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 40, Power = 2},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 3},
			EntityFlagIsFalse {Name = "ef_P319_Wait"}
		},
		Actions =
		{
			EffectStart {Tag = "TeleportLocation3", File = "Effect_Dummy_Loop"},
			EntityFlagSetTrue {Name = "ef_P319_Wait"}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar+spawnVariety},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 3},
			PlayerFigureIsNotInRange {X = spot3X, Y = spot3Y, Range = 5}
		},
		Actions =
		{
			EffectStop {Tag = "TeleportLocation3"},
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer",},
			FigureTeleport {Tag = "Sorvina", X = spot3X, Y = spot3Y},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			EntityFlagSetFalse {Name = "ef_P319_Wait"},
			FigureHoldPosition {},
			
			-- Ice Comet Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 82, Power = 2},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 4},
			EntityFlagIsFalse {Name = "ef_P319_Wait"}
		},
		Actions =
		{
			EffectStart {Tag = "TeleportLocation4", File = "Effect_Dummy_Loop"},
			EntityFlagSetTrue {Name = "ef_P319_Wait"}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar+spawnVariety},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 4},
			PlayerFigureIsNotInRange {X = spot4X, Y = spot4Y, Range = 5}
		},
		Actions =
		{
			EffectStop {Tag = "TeleportLocation4"},
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer",},
			FigureTeleport {Tag = "Sorvina", X = spot4X, Y = spot4Y},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			EntityFlagSetFalse {Name = "ef_P319_Wait"},
			FigureHoldPosition {},
			
			-- Shaking Earth Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 138, Power = 2},
			FigureLookAtDirection {Direction  = 0}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 5},
			EntityFlagIsFalse {Name = "ef_P319_Wait"}
		},
		Actions =
		{
			EffectStart {Tag = "TeleportLocation5", File = "Effect_Dummy_Loop"},
			EntityFlagSetTrue {Name = "ef_P319_Wait"}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P319_SorvinaTeleportTimer", Seconds = spawnVar+spawnVariety},
			EntityValueIsEqual {Name = "ev_P319_RandomSpawns", Value = 5},
			PlayerFigureIsNotInRange {X = spot5X, Y = spot5Y, Range = 5}
		},
		Actions =
		{
			EffectStop {Tag = "TeleportLocation5"},
			EntityTimerStart {Name = "et_P319_SorvinaTeleportTimer",},
			FigureTeleport {Tag = "Sorvina", X = spot5X, Y = spot5Y},
			EntityValueRandomize {Name = "ev_P319_RandomSpawns", MinValue = 1, MaxValue = 5},
			EntityFlagSetFalse {Name = "ef_P319_Wait"},
			FigureHoldPosition {},
			
			-- Area Pain Casten
			FigureCastSpellToEntity	{TargetTag = "Sorvina", Spell = 58, Power = 2},
			FigureLookAtDirection {Direction  = 0}
			
			
		}
	},
	-- Alles besetzt Sorvina geht in die Mitte
	--OnOneTimeEvent
	--{
	--	GotoState = "EndEndfight",
	--	Conditions =
	--	{                                                             
	--		OR
	--		{
	--			FigureIsInRange {X = spot1X, Y = spot1Y, Tag = "Sorvina", Range = 5},
	--			PlayerFigureIsInRange {X = spot1X, Y = spot1Y, Range = 5},
	--		},
	--		OR
	--		{
	--			FigureIsInRange {X = spot2X, Y = spot2Y, Tag = "Sorvina", Range = 5},
	--			PlayerFigureIsInRange {X = spot2X, Y = spot2Y, Range = 5},
	--		},
	--		OR
	--		{
	--			FigureIsInRange {X = spot3X, Y = spot3Y, Tag = "Sorvina", Range = 5},
	--			PlayerFigureIsInRange {X = spot3X, Y = spot3Y, Range = 5},
	--		},
	--		OR
	--		{
	--			FigureIsInRange {X = spot4X, Y = spot4Y, Tag = "Sorvina", Range = 5},
	--			PlayerFigureIsInRange {X = spot4X, Y = spot4Y, Range = 5},
	--		},
	--		OR
	--		{
	--			FigureIsInRange {X = spot5X, Y = spot5Y, Tag = "Sorvina", Range = 5},
	--			PlayerFigureIsInRange {X = spot5X, Y = spot5Y, Range = 5},
	--		},
	--	},
	--	Actions =
	--	{
	--		MapFlagSetTrue {Name = "mf_P319_FasterPussicatKillKill"},
	--		FigureTeleport {Tag = "Sorvina", X = 177, Y = 639},
	--		FigureAbilityRemove {AbilityId = 95},
	--		FigureLookAtDirection {Direction  = 0},
	--		ObjectVanish {Tag = "Lilac"},
	--		ObjectVanish {Tag = "Green"},
	--		ObjectVanish {Tag = "Yellow"},
	--		ObjectVanish {Tag = "Red"},
	--		ObjectVanish {Tag = "Blue"},
	--		ObjectSpawn {X = decalspot1X, Y = decalspot1Y, ObjectId = 2061, Direction = decaldirection1, Tag = "Lilac"},
	--		ObjectSpawn {X = decalspot2X, Y = decalspot2Y, ObjectId = 2062, Direction = decaldirection2, Tag = "Yellow"},
	--		ObjectSpawn {X = decalspot3X, Y = decalspot3Y, ObjectId = 2058, Direction = decaldirection3, Tag = "Blue"},
	--		ObjectSpawn {X = decalspot4X, Y = decalspot4Y, ObjectId = 2060, Direction = decaldirection4, Tag = "Red"},
	--		ObjectSpawn {X = decalspot5X, Y = decalspot5Y, ObjectId = 2059, Direction = decaldirection5, Tag = "Green"},
	--	}	
	--},
}
State
{
	StateName = "EndEndfight",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureHasNotHealth {Tag = "Sorvina", Percent = 30},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "Sorvina5", Tag = "Sorvina"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureHasNotHealth {Tag = "Sorvina", Percent = 20},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "Sorvina6", Tag = "Sorvina"},
			FigureOutcry {TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Sorvina"},
		},
		Actions = 
		{
			QuestSetSolved {Quest = "DefeatMalacay"},
		},
	};
	

}