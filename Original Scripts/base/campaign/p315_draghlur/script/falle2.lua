-- Falle hat ein eigens Skript, damit man die Falle auch abschalten kann, wenn sie einmla getriggert hat
-- Muss hinterher ein Sammelskript werden, welches von jeder Falle aufgerufen wird
-- in den Fallenskripten selbst werden die Werte mit Inhalt gef�llt

trapPosX = 107
trapPosY = 116
killRange = 10
triggerRange = 15
trapName = "Falle2"
effectName = "Effect_Misc_TrapGas"

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
	-- Die erste Falle (f�r die Cutscene
	-- Effekt f�r die erste Falle
	OnOneTimeEvent
	{
		Conditions =
		{
				PlayerFigureIsInRange {X = trapPosX, Y = trapPosY, Range = triggerRange},
			
		},
		Actions =
		{
			EffectStart	{Tag = trapName, File = effectName},
		}
		
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					PlayerFigureIsInRange {X = trapPosX, Y = trapPosY, Range = triggerRange},
			},
			Actions =
			{
				PlayerRtsUnitKillInRange {X = trapPosX, Y = trapPosY, Range = killRange},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroBor", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroBor", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroLya", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroLya", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroMordecay", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroMordecay", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroIo", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroIo", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroShae", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroShae", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanHeroJared", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanHeroJared", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanAvatar", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanAvatar", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
					EntityFlagIsFalse {Name = "ef_P315_TrapTriggered"},
					FigureIsInRange {Tag = "pl_HumanNightSong", Range = triggerRange, X = trapPosX, Y = trapPosY},
			},
			Actions =
			{
				FigureHealthSet {Tag = "pl_HumanNightsong", Percent = 2},
				EntityTimerStart {Name = "et_P315_Blocker"},
			},
	},
	-- Mit dieser Funktion wird der Blocker gesetzt, damit die Einheiten erst noch in den einzelnen
	-- Funktionen getestet werden k�nnen
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P315_Blocker", Seconds = 2}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	
	-- Sind Einzelevents Pro entsch�rfer, da auch der jeweilige den Outcry absetzen muss
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer1", X = trapPosX, Y = trapPosY, Range = triggerRange},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer1"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer1"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer2", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer2"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer2"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer3", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer3"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer4"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer4", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer4"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer4"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			FigureIsInRange {Tag = "Pioneer5", X = trapPosX, Y = trapPosY, Range = triggerRange},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Pioneer1", Tag = "Pioneer5"},
			FigureOutcry {TextTag = "Pioneer2", Tag = "Pioneer5"},
			EntityFlagSetTrue {Name = "ef_P315_TrapTriggered"},
		}
	},
	-- Ist der Spieler in der Festung wird die Fallenquest als gel�st angesehen, deshalb Fallen abschalten
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			QuestIsSolved {Quest = "WatchOutForTraps"}
		},
		Actions =
		{
		}
	}
	
}

State
{
	StateName = "End",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
		}
		
	},
}