State
{
	StateName = "INIT",
	OnFigureRespawnEvent
	{
		X = 486.976, 
		Y = 561.096,
		WaitTime = 1,
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneGateEnd"}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_KorRespawn"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "ShowWay",
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P309_KorRespawn"}
		},
		Actions =
		{
		},
	},
}
-- Bis zum Tor braucht Kor keine States, am Tor wird er wieder sein eigener Herr und läuft dem SPieler vor
State
{
	StateName = "ShowWay",
	OnIdleRunHomeFake
	{
		X = 568, Y = 430,
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P309_CutsceneIronLordStart"},
			EntityFlagIsFalse {Name = "ef_P309_Wait"}
		},
		Actions =
		{
		},
	},
	-- Wenn der Spieler nicht in der Nähe ist warten auf ihn
	OnEvent
	{
		Conditions =
		{
			FigureIsNotInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Kor", Range = 20},
			EntityFlagIsFalse {Name = "ef_P309_Wait"}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Wait"},
			FigureStop {},
		}
	},
	-- Ist er da geht es weiter
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Kor", Range = 10},
			EntityFlagIsTrue {Name = "ef_P309_Wait"}
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_P309_Wait"}
		},
	},
	-- Wenn Kor im Lager ist nervt er den SPieler doch mal endlich zu kommen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "Kor", X = 568, Y = 430, Range = 4}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P309_GetPlayerOnTheNervesToCome"}
		}
	},
	OnEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P309_CutsceneIronLordEnd"},
			FigureIsInRange {Tag = "Kor", X = 568, Y = 430, Range = 4},
			EntityTimerIsElapsed {Name = "et_P309_GetPlayerOnTheNervesToCome", Seconds = 60}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P309_GetPlayerOnTheNervesToCome"},
			FigureOutcry {Tag = "Kor", TextTag = "Kor1"}
		},
	},
	OnOneTimeEvent
	{
		GotoState = "KorMisfit",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"}
		},
		Actions =
		{
		},
	}
}

State
{
	StateName = "KorMisfit",

	-- Einfach wieder auf den alten Posten zurück gehn
	OnIdleGoHomeFake
	{
		X = 371, Y = 456,
		Conditions =
		{
			
		},
		Actions =
		{
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P309_TalkedToMessenger"}
		},
		Actions =
		{
			DialogSetEnabled {Tag = "Kor"},
			DialogTypeSetMainQuest {Tag = "Kor"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "KorUnderControlAgain",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_TalkedToKorOrakelQuest"}
		},
		Actions =
		{
		},
	},
}

State
{
	StateName = "KorUnderControlAgain",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PlayerHeroAdd {Player = "pl_Human", HeroId = 26},
			FigureOutcry {TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Kor bekommen
			FigureHeroSpawn {Player = "default", Tag = "Kor", X = 371, Y = 456, Direction = 137.51},
			FigureVanish {Tag = "Kor"}
		},
	},
	OnFigureRespawnEvent
	{
		X = 551, 
		Y = 422,
		WaitTime = 1,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_SpawnKorALastTime"}
		},
		Actions =
		{
			DialogSetEnabled {Tag = "Kor"}
		}
	},
}