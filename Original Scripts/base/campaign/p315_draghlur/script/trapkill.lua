-- Falle hat ein eigens Skript, damit man die Falle auch abschalten kann, wenn sie einmla getriggert hat
-- Muss hinterher ein Sammelskript werden, welches von jeder Falle aufgerufen wird
-- in den Fallenskripten selbst werden die Werte mit Inhalt gefüllt 

-------------------------------------------------------
-- Töten Falle mit den Spikes



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
		}
		
	},
	-- Sind Einzelevents Pro entschärfer, da auch der jeweilige den Outcry absetzen muss
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2},
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			EntityFlagIsFalse {Name = "ef_P315_TrapBadTriggered"},
			EntityFlagIsFalse {Name = "ef_P315TrapFound"},
		},
		OnActions =
		{
			ObjectSpawn {Tag = trapName.."aMarker", ObjectId = 1336, X = trapPosX, Y = trapPosY,},
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer1"},
			EntityFlagSetTrue {Name = "ef_P315TrapFound"},
		},
		OffConditions =
		{
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
		},
		OffActions =
		{
			ObjectVanish {Tag = trapName.."aMarker"},
			EntityFlagSetFalse {Name = "ef_P315TrapFound"},
		},
		
	},
	-- Pionier 2
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2},
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			EntityFlagIsFalse {Name = "ef_P315_TrapBadTriggered"},
			EntityFlagIsFalse {Name = "ef_P315TrapFound"},
		},
		OnActions =
		{
			ObjectSpawn {Tag = trapName.."aMarker", ObjectId = 1336, X = trapPosX, Y = trapPosY,},
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer2"},
			EntityFlagSetTrue {Name = "ef_P315TrapFound"},
		},
		OffConditions =
		{
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
		},
		OffActions =
		{
			ObjectVanish {Tag = trapName.."aMarker"},
			EntityFlagSetFalse {Name = "ef_P315TrapFound"},
		},
		
	},
	-- P 3
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2},
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			EntityFlagIsFalse {Name = "ef_P315_TrapBadTriggered"},
			EntityFlagIsFalse {Name = "ef_P315TrapFound"},
		},
		OnActions =
		{
			ObjectSpawn {Tag = trapName.."aMarker", ObjectId = 1336, X = trapPosX, Y = trapPosY,},
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer3"},
			EntityFlagSetTrue {Name = "ef_P315TrapFound"},
		},
		OffConditions =
		{
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
		},
		OffActions =
		{
			ObjectVanish {Tag = trapName.."aMarker"},
			EntityFlagSetFalse {Name = "ef_P315TrapFound"},
		},
		
	},
	-- P4
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2},
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			EntityFlagIsFalse {Name = "ef_P315_TrapBadTriggered"},
			EntityFlagIsFalse {Name = "ef_P315TrapFound"},
		},
		OnActions =
		{
			ObjectSpawn {Tag = trapName.."aMarker", ObjectId = 1336, X = trapPosX, Y = trapPosY,},
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer4"},
			EntityFlagSetTrue {Name = "ef_P315TrapFound"},
		},
		OffConditions =
		{
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
		},
		OffActions =
		{
			ObjectVanish {Tag = trapName.."aMarker"},
			EntityFlagSetFalse {Name = "ef_P315TrapFound"},
		},
		
	},
	-- P5
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2},
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			EntityFlagIsFalse {Name = "ef_P315_TrapBadTriggered"},
			EntityFlagIsFalse {Name = "ef_P315TrapFound"},
		},
		OnActions =
		{
			ObjectSpawn {Tag = trapName.."aMarker", ObjectId = 1336, X = trapPosX, Y = trapPosY,},
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer5"},
			EntityFlagSetTrue {Name = "ef_P315TrapFound"},
		},
		OffConditions =
		{
			EntityFlagIsFalse {Name = "ef_P315TrapTriggered"},
			FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
			FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange*2+2},
		},
		OffActions =
		{
			ObjectVanish {Tag = trapName.."aMarker"},
			EntityFlagSetFalse {Name = "ef_P315TrapFound"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
				FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
				FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
				FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
				FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			},
			EntityFlagIsTrue {Name = "ef_P315TrapFound"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P315_DismantleTimer"}
		},
	},
	-- Die Falle ist aus P1
	OnOneTimeEvent
	{
		EventName = "EffectStart2",
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			EntityTimerIsElapsed {Name = "et_P315_DismantleTimer", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315TrapTriggered"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer1"},
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			ObjectVanish {Tag = trapName.."aMarker"},
		},
	},
	-- Die Falle ist aus P2
	OnOneTimeEvent
	{
		EventName = "EffectStart3",
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			EntityTimerIsElapsed {Name = "et_P315_DismantleTimer", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315TrapTriggered"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer2"},
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			ObjectVanish {Tag = trapName.."aMarker"},
		},
	},
	-- Die Falle ist aus P3
	OnOneTimeEvent
	{
		EventName = "EffectStart4",
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			EntityTimerIsElapsed {Name = "et_P315_DismantleTimer", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315TrapTriggered"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer3"},
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			ObjectVanish {Tag = trapName.."aMarker"},
		},
	},
	-- Die Falle ist aus P4
	OnOneTimeEvent
	{
		EventName = "EffectStart5",
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			EntityTimerIsElapsed {Name = "et_P315_DismantleTimer", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315TrapTriggered"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer4"},
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			ObjectVanish {Tag = trapName.."aMarker"},
		},
	},
	-- Die Falle ist aus P5
	OnOneTimeEvent
	{
		EventName = "EffectStart6",
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange/2},
			EntityTimerIsElapsed {Name = "et_P315_DismantleTimer", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315TrapTriggered"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer5"},
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			ObjectVanish {Tag = trapName.."aMarker"},
		},
	},
	-- Wenn die Falle einmal ausgelöst wurde muss der Marker natürlich auch ausgehen
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		
	--		EntityFlagIsTrue {Name = "ef_P315_TrapBadTriggered"},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish {Tag = trapName.."aMarker"},
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer1"},
	--		FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer1"},
	--		EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
	--		FigureStop {Tag = "Pioneer1"},
	--	}
	--},
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer2"},
	--		FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer2"},
	--		EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
	--		FigureStop {Tag = "Pioneer2"},
	--	}
	--},
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer3"},
	--		FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer3"},
	--		EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
	--		FigureStop {Tag = "Pioneer3"},
	--	}
	--},
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer4"},
	--		FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer4"},
	--		EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
	--		FigureStop {Tag = "Pioneer4"},
	--	}
	--},
	--OnOneTimeEvent
	--{
	--	GotoState = "End",
	--	Conditions =
	--	{
	--		FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer5"},
	--		FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer5"},
	--		EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
	--		FigureStop {Tag = "Pioneer5"},
	--	}
	--},
	-- Effekt für die erste Falle
	OnOneTimeEvent
	{
		EventName = "EffectStart1",
		Conditions =
		{
			SetUpdateInterval {Steps = 3},
			EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
			PlayerFigureIsInRange {X = trapPosX, Y = trapPosY, Range = triggerRange},
			--FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
		},
		Actions =
		{
			EffectStart	{Tag = trapName, File = effectName},
			EffectStart	{Tag = trapName.."a", File = effectName},
			EffectStart	{Tag = trapName.."b", File = effectName2},
			EffectStart	{Tag = trapName.."c", File = effectName},
			EffectStart	{Tag = trapName.."d", File = effectName2},
			EffectStart	{Tag = trapName.."e", File = effectName},
			EffectStart	{Tag = trapName.."f", File = effectName2},
			EffectStart	{Tag = trapName.."g", File = effectName},
			EntityFlagSetTrue {Name = "ef_P315_TrapBadTriggered"},
			EntityTimerStart {Name = "et_P315_Kill"},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P315_Kill", Seconds = 0.5},
			EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
			EntityFlagIsTrue {Name = "ef_P315_TrapBadTriggered"},
			PlayerFigureIsInRange {X = trapPosX, Y = trapPosY, Range = triggerRange},
			--FigureIsNotInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsNotInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange + 2},
			--FigureIsInEntityRange {Tag = "Falle2", Range = 3, TargetTag = "Pioneer"},
		},
		Actions =
		{
			PlayerRtsUnitKillInRange {X = trapPosX, Y = trapPosY, Range = killRange},
			EntityTimerStart {Name = "et_P315_Blocker"},
		},
	},
	OnOneTimeEvent
	{
			EventName = "BorTrigger",		
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroBor", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroBor"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroLya", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroLya"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroMordecay", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroMordecay"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroIo", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroIo"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroShae", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroShae"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroJared", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanHeroJared"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanAvatar", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanAvatar"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanNightSong", Range = killRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureKill {Tag = "pl_HumanNightsong"},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	-- Mit dieser Funktion wird der Blocker gesetzt, damit die Einheiten erst noch in den einzelnen
	-- Funktionen getestet werden können
	OnOneTimeEvent
	{
		EventName = "TrapTriggeredSet", 
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P315_Blocker", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	-- Die Falle ist entschärft oder "benutzt" oder die Quest ist gelöst und der SPieler ist in der Festung
	OnOneTimeEvent
	{
	GotoState = "End",
		Conditions =
		{
			OR
			{
				EntityTimerIsElapsed {Name = "et_P315_Blocker", Seconds = 10},
				QuestIsSolved {Quest = "WatchOutForTraps"},
			}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	
}

State
{
	StateName = "End",
}