--************************************************************
--**														**
--**		Gate of Swords In Memoriam Craig				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'pl_HumanHeroJared'",
		"'pl_HumanHeroShae'",
		"'Shadowsong'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Schattenlied, wie sie sich hinkniet
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Cutscene12"},
				AND
				{
					QuestIsSolved {Quest = "TalkToNightsongAboutShadows"},
					FigureIsInRange {Tag = "ShadowSong", X = 445, Y = 485, Range = 10},
					FigureIsInRange {Tag = "pl_HumanAvatar", X = 445, Y = 485, Range = 10},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 451.034, Y = 484.662},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 258.541},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 450.12, Y = 482.373},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 252.811},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 450.951, Y = 487.522},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 275.73},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 452.025, Y = 482.956},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 258.541},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 452.2, Y = 485.8},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 270},
			FigureTeleport {Tag = "Shadowsong", X = 446.757, Y = 485.419},
			FigureLookAtDirection {Tag = "Shadowsong", Direction = 264.27},
			-- Talkjob Schattenlied
			FigureCutsceneTalkJobSet {Tag = "Shadowsong"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsHide {Tag = "Shadowsong"},
			-- Animationen werden gestartet
			MapFlagSetTrue {Name = "mf_CS_12_KneelDown"},
			-- Musik fängt an
			--SoundGlobalPlayOnce	{File = "00music/sf2_menu_shadowsong.mp3"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Feuer geht an(Feuer-Objekt wird getauscht)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			ObjectChange {Tag = "In_Memoriam_Craig_Flame", ObjectId = 2009, X = 441.514, Y = 486.043, Direction = 0},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene02b",
	},
};



State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Schattenlied steht auf(wenn Gesang erklingt)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_12_Shadowsong_KneelUp"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kamera auf knienden Avatar und Helden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf Position wo der Schattenkrieger gleich erscheinen wird
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Effekt auf Position unter dem Schattenkrieger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EffectStart {Tag = "CS_12_ShadowWarrior_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Shadowwarrior Spawn
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_12_SOUND_Play_Shadowwarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Schattenkrieger erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_12_ShadowWarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamerazoom auf Schattenkrieger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Schattenkrieger spielt Military-Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "CS_12_ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_emote_military.ska"}, -- 3.33s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Effekt Start auf Position des Schattenkrieger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "CS_12_ShadowWarrior", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Shadowwarrior Despawn
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_12_SOUND_Play_Shadowwarrior_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Schattenkrieger verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "CS_12_ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamerazoom auf Craigs Flamme
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Kamerazoom auf Schattenlied Gesicht
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_12_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs beenden
			FigureStop {Tag = "Shadowsong"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsShow {Tag = "Shadowsong"},
			-- Avatar und Helden stehen wieder auf
			MapFlagSetTrue {Name = "mf_CS_12_KneelUp"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_P309_HeulenDone"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};












