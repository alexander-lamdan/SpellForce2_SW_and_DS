
State
{
	StateName = "JandrimStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 95.6021,
		Y = 120.304,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Jandrim_Spawn"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_JandrimAlive"},
			FigureLookAtDirection {Tag = "Jandrim", Direction = 325.05},
		},
		DelayedActions =
		{
			CutsceneFigureWeaponsHide {Tag = "default"},
		},

	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_JandrimAlive"},
			MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
		},
		Actions =
		{

		},
		GotoState = "JandrimOutcries"
	},

};
State
{
	StateName = "JandrimOutcries",



--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry01"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 0},
--
--		},
--		Actions =
--		{
--			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry01"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer01"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry02"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer01", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer01"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim05"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry02"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer02"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry03"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 2},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer02", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer02"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim06"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry03"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer03"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry04"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 3},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer03", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer03"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim07"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry04"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer04"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry05"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 4},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer04", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer04"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim08"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry05"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer05"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry06"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 5},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer05", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer05"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim09"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry06"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer06"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry07"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 6},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer06", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer06"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim10"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry07"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer07"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry08"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 7},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer07", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer07"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim11"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry08"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer08"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry09"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 8},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer08", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer08"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim12"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry09"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--			EntityTimerStart	{Name = "et_JandrimOutcryTimer09"},
--		},
--
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_JandrimOutcry10"},
--			MapFlagIsFalse	{Name = "mf_JandrimPrioOutcry01"},
--			EntityValueIsEqual	{Name = "ev_JandrimOutcry", Value = 9},
--			EntityTimerIsElapsed	{Name = "et_JandrimOutcryTimer09", Seconds = 3},
--		},
--		Actions =
--		{
--			EntityTimerStop	{Name = "et_JandrimOutcryTimer09"},
--			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim13"},
--			EntityFlagSetTrue {Name = "ef_JandrimOutcry10"},
--			EntityValueAdd	{Name = "ev_JandrimOutcry", Value = 1},
--
--		},
--
--	},


	OnFollowEvent
	{

		TargetTag = "pl_HumanAvatar",
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_StopFollowJandrim"},
			MapFlagIsTrue	{Name = "mf_JandrimStartFollow"},
		},
		Actions =
		{

		},
	},

	--Jandrim verschwindet auf der Karte, wenn er in Westguard aufgetaucht ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P300_UnderHallQuestSolved"},
		},
		Actions =
		{
			FigureVanish {Tag = "Jandrim"},
		},

	},



};
