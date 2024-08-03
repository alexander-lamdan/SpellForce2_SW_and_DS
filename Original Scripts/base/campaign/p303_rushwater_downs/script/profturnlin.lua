-- Einschalten des Dialoges, wenn Professor Drehlein Mauser erschossen hat
State
{
	StateName = "INIT",
	-- Wenn die Bären tot sind taucht Drehlein auf
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			-- Alle Bären sind tot               
			FigureIsDead {Tag = "FightingBear1"},
			FigureIsDead {Tag = "FightingBear2"},
			FigureIsDead {Tag = "FightingBear3"},
			-- Mauser hat Aggro
			FigureIsInCombat {Tag = "Micer"},
			MapFlagIsTrue {Name = "mf_P303_MicerAlive"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_TwiddleAlive"},
		},
		DelayedActions =
		{
			FigureAttackEntity {TargetTag = "Micer"},
			EntityTimerStart {Name = "et_P303_KillMicer"}
		}
	},
	-- ISt Drehlein nah genug, wird ein Timer gestartet, mit dem man Mauser töten kann
	-- so kann man sicher sein, dass er mindestens einen Angriff gestartet hat (tweaken)
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P303_KillMicer", Seconds = 5}
		},
		Actions =
		{
			FigureKill{Tag = "Micer"},
			FigureKill{Tag = "Micer"},
			FigureKill{Tag = "Micer"},
			FigureKill{Tag = "Micer"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Micer"},
			MapFlagIsTrue {Name = "mf_P303_MicerAlive"},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "ProfTurnlin1"},
			FigureOutcry {TextTag = "ProfTurnlin2"},
			DialogTypeSetSideQuest {Tag = "ProfTurnlin"},
			DialogSetEnabled {Tag = "ProfTurnlin"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking	{},
			MapFlagIsTrue {Name = "mf_P303_VanishTwiddle"}
		},
		Actions =
		{
			QuestSetActive {Quest = "RushwaterWeirdFellow"},
			EffectStartAtEntityPosition {File = "Effect_DeSpawn_Unit"},
			FigureOutcry {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			FigureVanish {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "GFPart1ToKing"}
		},
		Actions =
		{
			FigureVanish {},
		}
	},
}