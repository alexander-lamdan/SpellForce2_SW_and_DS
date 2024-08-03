--------------------------------------------------------------
--
--		Die ganzen Outcries, die sich Arne noch so einfallen lassen hat, werden hier verwaltet
--
---------------------------------------------------------------


State
{	
	StateName = "INIT",
	-- Spieler ist auf dem Weg zum Orakelberg, Lya und Mordecay sprechen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P309_AfterKor", Seconds = 7},
			FigureIsAlive {Tag = "pl_HumanHeroMordecay"},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
			
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "MordeIntro1"},
			FigureOutcry {Tag = "pl_HumanHeroLya", TextTag = "MordeIntro2"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "MordeIntro3"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "MordeIntro4"},
			MapTimerStop {Name = "mt_P309_AfterKor"},
		},
	},
	-- Lya hat was zu mopppern nach dem ersten Arenaoutcry
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_LyaTalk"},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroLya", TextTag = "WorldEnds1"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "WorldEnds2"},
		}
	},
	-- Spieler hat mit Zanza gesprochen Mordecay wird von Bor angemeckert
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsAlive {Tag = "pl_HumanHeroMordecay"},
			FigureIsAlive {Tag = "pl_HumanHeroBor"},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
			FigureIsAlive {Tag = "pl_HumanHeroJared"},
			MapTimerIsElapsed {Name = "mt_P309_ZanzasOutcriesRunning", Seconds = 25},
			QuestIsNotKnown {Quest = "UramGorPart1ToGate"},
			
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "Stalker1"},
			FigureOutcry {Tag = "pl_HumanHeroLya", TextTag = "Stalker2"},
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "Stalker3"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "Stalker4"},
			FigureOutcry {Tag = "pl_HumanHeroJared", TextTag = "Stalker5"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "Stalker6"},
			FigureOutcry {Tag = "pl_HumanHeroJared", TextTag = "Stalker7"},
		},
	},
	-- Outcryblock nach erhalt der Steinerner Gott Quest
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "SolveStoneGodRiddle"},
			FigureIsAlive {Tag = "pl_HumanHeroBor"},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
			FigureIsAlive {Tag = "pl_HumanHeroJared"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroShae", TextTag = "JaredAngry1"},
			FigureOutcry {Tag = "pl_HumanHeroJared", TextTag = "JaredAngry2"},
			FigureOutcry {Tag = "pl_HumanHeroLya", TextTag = "JaredAngry3"},
			FigureOutcry {Tag = "pl_HumanHeroJared", TextTag = "JaredAngry4"},
			FigureOutcry {Tag = "pl_HumanHeroJared", TextTag = "JaredAngry5"},
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "JaredAngry6"},
			FigureOutcry {Tag = "pl_HumanHeroLya", TextTag = "JaredAngry7"},
		}
	},
	-- Der Spieler ist von Fireforge zurück Osal wird gesprächig
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", Range = 7, TargetTag = "Osal"},
			QuestIsSolved {Quest = "GoSPart4Fireforge"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory01"},
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory02"},
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory03"},
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory04"},
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory05"},
			FigureOutcry {Tag = "Osal", TextTag = "OsalStory06"},
		}
	},
	-- Spieler hat die Eastereggwaffe gelootet
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsAlive {Tag = "pl_HumanHeroBor"},
			FigureIsAlive {Tag = "pl_HumanHeroMordecay"},
			AvatarHasItemEquipment {ItemId = 638, Amount = 1}
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "HunterW1"},
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "HunterW2"},
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "HunterW3"},
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "HunterW4"},
		},
	},
	-- Spieler greift EasterEgg Wolf an
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasHate {Tag = "Depp1"},
			FigureIsAlive {Tag = "pl_HumanHeroShae"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroShae", TextTag = "Egg1"},
		}
	},
	-- Spieler greift EasterEgg Skelett an
	-- SI: auskommentiert weil der outcry kam immer sofort bei Kartenstart...
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		FigureHasHate {Tag = "Depp2"},
	--		FigureIsAlive {Tag = "pl_HumanHeroShae"},
	--	},
	--	Actions =
	--	{
	--		FigureOutcry {Tag = "pl_HumanHeroShae", TextTag = "Egg2"},
	--	}
	--},
	-- Mordecay rächt sich an seinen Peinigern
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "pl_HumanHeroMordecay", TargetTag = "KillOrc", Range = 10},
		},
		Actions =
		{
			FigureOutcry {Tag = "KillOrc", TextTag = "Orcs03"},
			EntityFlagSetTrue {Name = "ef_P309_AffrontMordecay"},
			FigureTeamTransfer {Tag = "KillOrc", Team  = "tm_Untote"},
			FigureAttackEntity {Tag = "pl_HumanHeroMordecay", TargetTag = "KillOrc"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P309_AffrontMordecay"},
			FigureIsDead {Tag = "KillOrc"},
			FigureIsAlive {Tag = "pl_HumanHeroMordecay"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "Orcs04"},
		}
	},
	-- Outcryblock der Armee, nachdemman den steinernen Gott gelöst hat
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GoSPart9MarchToDraghLur"},
			FigureIsAlive {Tag = "IronLord_Army20"},
		},
		Actions =
		{
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs23"},
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs24"},
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs25"},
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs26"},
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs27"},
			FigureOutcry {Tag = "IronLord_Army20", TextTag = "Orcs28"},
			FigureOutcry {Tag = "IronLord", TextTag = "Orcs29"},
			FigureOutcry {Tag = "IronLord", TextTag = "Orcs30"},
		}
	},
	-- Orkunterhaltung nach Fireforge
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "ForgeRing"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkAfterFireforge2", Range = 10},
		},
		Actions =
		{
			FigureOutcry {Tag = "TalkAfterFireforge2", TextTag = "Orcs18"},
			FigureOutcry {Tag = "TalkAfterFireforge1", TextTag = "Orcs19"},
		}
	},
	-- Ein Block für die Orks, die die Sprüche für den Spieler sagen, sind 4 strategisch verteilte Orks, damit der SPieler auf jeden Fall an denen vorbei kommt
	-- Nach der EisenfürstCutscene --> Warnung vor dem Avatar im Lager
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GoSPart2ShadowKnowledge"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc1", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Warning"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Warning"},
			FigureOutcry {Tag = "TalkOrc1", TextTag = "Orcs02"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GoSPart2ShadowKnowledge"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc2", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Warning"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Warning"},
			FigureOutcry {Tag = "TalkOrc2", TextTag = "Orcs02"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GoSPart2ShadowKnowledge"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc3", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Warning"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Warning"},
			FigureOutcry {Tag = "TalkOrc3", TextTag = "Orcs02"},
		}
	},
	-- Nach Fireforge
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "ForgeRing"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc1", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Diss"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Diss"},
			FigureOutcry {Tag = "TalkOrc1", TextTag = "Orcs10"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "ForgeRing"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc2", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Diss"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Diss"},
			FigureOutcry {Tag = "TalkOrc2", TextTag = "Orcs10"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "ForgeRing"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc3", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Diss"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Diss"},
			FigureOutcry {Tag = "TalkOrc3", TextTag = "Orcs10"},
		}
	},
	-- Nach Crater, vor Stonegodquest
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "BringMirrorToShadowWarrior"},
			QuestIsNotKnown {Quest = "SolveStoneGodRiddle"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc1", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Brief"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Brief"},
			FigureOutcry {Tag = "TalkOrc1", TextTag = "Orcs01"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "BringMirrorToShadowWarrior"},
			QuestIsNotKnown {Quest = "SolveStoneGodRiddle"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc2", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Brief"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Brief"},
			FigureOutcry {Tag = "TalkOrc2", TextTag = "Orcs01"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "BringMirrorToShadowWarrior"},
			QuestIsNotKnown {Quest = "SolveStoneGodRiddle"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc3", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_Brief"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_Brief"},
			FigureOutcry {Tag = "TalkOrc3", TextTag = "Orcs01"},
		}
	},
	-- Erster Zyklus in der Arena gewonnen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual {Name = "mv_P309_FightNumber", Value = 5},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc1", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_FirstArena"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_FirstArena"},
			FigureOutcry {Tag = "TalkOrc1", TextTag = "Orcs05"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual {Name = "mv_P309_FightNumber", Value = 5},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc2", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_FirstArena"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_FirstArena"},
			FigureOutcry {Tag = "TalkOrc2", TextTag = "Orcs05"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual {Name = "mv_P309_FightNumber", Value = 5},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc3", Range = 5},
			EntityFlagIsFalse {Name = "ef_P309_FirstArena"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P309_FirstArena"},
			FigureOutcry {Tag = "TalkOrc3", TextTag = "Orcs05"},
		}
	},

	--Der Eisenfürst und sein Gebet
	OnToggleEvent
	{
		OnConditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
			TimeIsBetween {StartHour = 19, EndHour = 20},
			EntityFlagIsFalse {Name = "ef_P309_DontPray"},
			FigureIsAlive {Tag = "IronLord"}
		},
		OnActions =
		{
			FigureOutcry {Tag = "IronLord", TextTag = "Sunprayer1"},
			FigureOutcry {Tag = "IronLord", TextTag = "Sunprayer2"},
			FigureOutcry {Tag = "IronLord", TextTag = "Sunprayer3"},
			EntityFlagSetTrue {Name = "ef_P309_DontPray"},
			FigureLookAtDirection {Direction = 270},
		},
		OffConditions =
		{
			TimeIsBetween {StartHour = 21, EndHour = 22},
			EntityFlagIsTrue {Name = "ef_P309_DontPray"}
		},
		OffActions =
		{
			EntityFlagSetFalse {Name = "ef_P309_DontPray"}
		},
	},
	-- Zanza 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_CS_10_Done"},
		},
		Actions =
		{
			FigureOutcry {Tag = "BattleMaster", TextTag = "Orcs31"},
			FigureOutcry {Tag = "pl_HumanHeroBor", TextTag = "Orcs32"},
		},
	},
	-- Orcgrüße
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P09_Greetings1"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "TalkOrc1", Range = 5},
			-- !!! Hier noch Counter von Arena rein
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P09_Greetings1"},
			FigureOutcry {Tag = "TalkOrc1", TextTag = "Orcs05"},
		},
	},		
	
}