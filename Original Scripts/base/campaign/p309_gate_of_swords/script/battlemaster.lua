-- SI: warum wird der "Runde des Aufstiegs" Dialogoption auch dann angezeigt, wenn man sie noch nicht spielen kann?
-- das ist nur verwirrend, weil man die Option trotzdem immer als erstes wählt,
-- um zu sehen ob man denn jetzt endlich die zweite Variante spielen darf...
-- ich würde empfehlen die zweite option nicht anzuzeigen, solange man nur kämpfe der runde eins durchführen kann


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
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		}
	},
	
	OnEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
					AvatarFlagIsTrue {Name = "af_P307_DealAccepted"},
				},
				AND
				{
					AvatarFlagIsFalse {Name = "af_P307_DealAccepted"},
					AvatarFlagIsTrue {Name = "af_P309_CutsceneMordecayEnd"},
				},
			}
		},
		Actions =
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest {},
		},
		GotoState = "MAIN",
	},
};

State
{
	StateName = "MAIN",

	OnToggleEvent
	{
		OffConditions =
		{
			MapFlagIsFalse {Name = "mf_P309_FightRunnning"},
			-- SI: nach letztem kampf nicht wieder anschalten!
			MapValueIsLess {Name = "mv_P309_FightNumber", Value = 12},
		},
		OffActions =
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest {},
			EntityTimerStart	{Name = "et_PlayEndFightOutcry"},
		},
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
		},
		OnActions =
		{
			DialogSetDisabled {},
			EntityTimerStart	{Name = "et_PlayBeginFightOutcry"},
		},
	},
	
	OnEvent
	{
		EventName = "GotoStateOutcryFightBegins",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_PlayBeginFightOutcry", Seconds = 2},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_PlayBeginFightOutcry"},
		},
		GotoState = "PlayBeginFightOutcry",
	};

	OnEvent
	{
		EventName = "GotoStateOutcryFightEnds",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_PlayEndFightOutcry", Seconds = 2},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_PlayEndFightOutcry"},
		},
		GotoState = "PlayEndFightOutcry",
	};

	-- Meldung, das jetzt gleich Tor Halicos kommt, und spawn timer für Halicos starten
	OnOneTimeEvent
	{
		EventName = "LastFightWon",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 12},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_PlayFinalFightOutcry"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "StartHalicosSpawnTimer",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_PlayFinalFightOutcry", Seconds = 2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena12"},
			MapTimerStart	{Name = "mt_HalicosWaitForBattlemasterOutcryBeforeSpawn"},
		},
	};

	-- sobald Tor Halicos besiegt wurde hat der Battlemaster nix mehr zu sagen ...
	OnEvent
	{
		EventName = "OutcryHalicosFightWon",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P309_FightHalicosWon", Seconds = 0.2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena15"},
		},
		GotoState = "Ende",
	};
};


State
{
	StateName = "PlayBeginFightOutcry",
	
	OnEvent
	{
		EventName = "OutcryFightBegins1",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena1"},
			MapFlagSetTrue {Name = "mf_P309_LyaTalk"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins2",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena2"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins3",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 3},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena3"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins4",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 4},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena4"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins5",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 5},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena6"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins6",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 6},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena7"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins7",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 7},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena8"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins8",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 8},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena9"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins9",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 9},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena10"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins10",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena11"},
		},
		GotoState = "MAIN",
	};
	OnEvent
	{
		EventName = "OutcryFightBegins11",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 11},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena12"},
		},
		GotoState = "MAIN",
	};
};


State
{
	StateName = "PlayEndFightOutcry",
	
	OnOneTimeEvent
	{
		EventName = "OutcryFightWonNextCycle",
		Conditions = 
		{
			-- kampf gewonnen und damit zyklus der prüfung abgeschlossen
			MapFlagIsFalse {Name = "mf_P309_FightLost"},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 4},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena14"},
			FigureOutcry	{TextTag = "Arena5"},
		},
		GotoState = "MAIN",
	};
	
	OnEvent
	{
		EventName = "OutcryFightWon",
		Conditions = 
		{
			-- kampf gewonnen (generisch)
			MapFlagIsFalse {Name = "mf_P309_FightLost"},
			MapValueIsNotEqual {Name = "mv_P309_PitFightsWon", Value = 4},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena14"},
		},
		GotoState = "MAIN",
	};

	OnEvent
	{
		EventName = "OutcryFightLost",
		Conditions = 
		{
			-- kampf verloren
			MapFlagIsTrue {Name = "mf_P309_FightLost"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Arena13"},
			MapFlagSetFalse {Name = "mf_P309_FightLost"},
		},
		GotoState = "MAIN",
	};
};


State
{
	StateName = "Ende",
};
