--************************************************************
--**														**
--**		Iron Fields Part II Urs Residence				**
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
		"'pl_HumanNightsong'",
		"'Hydra'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Avatar und Schattenlied rennen zur Hydra
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB04"},
				AND
				{
					PlayerFigureIsInRangeToEntity {Player = "pl_Human", Range = 30, TargetTag = "Hydra"},
					--OR
					--{
					--	FigureIsInEntityRange	{Tag = "Hydra", TargetTag = "pl_HumanAvatar", Range = 30},
					--	FigureIsInEntityRange	{Tag = "Hydra", TargetTag = "pl_HumanHeroBor", Range = 30},
					--	FigureIsInEntityRange	{Tag = "Hydra", TargetTag = "pl_HumanHeroLya", Range = 30},
					--	FigureIsInEntityRange	{Tag = "Hydra", TargetTag = "pl_HumanHeroJared", Range = 30},
					--	FigureIsInEntityRange	{Tag = "Hydra", TargetTag = "pl_HumanHeroShae", Range = 30},
					--},
					QuestIsActive {Quest = "KillHydra"},
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
			CameraTakeAddToTrack {File = "CS_B_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 75.6, Y = 625.8},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 74.2, Y = 623},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 77.5, Y = 621.9},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 72.7, Y = 620.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 71.2, Y = 622.22},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 75.9, Y = 619.3},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 180},
			FigureTeleport {Tag = "Hydra", X = 74.2, Y = 644},
			FigureLookAtDirection {Tag = "Hydra", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroJared"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroShae"},
			FigureCutsceneTalkJobSet {Tag = "Hydra"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Verschlinger spielt Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Hydra", File = "base/gfx/figures/boss/figure_boss_devourer_idlespecial.ska"}, -- 4s
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Hydra: Hydra2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Hydra2", Tag = "Hydra"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar: Avatar19
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar19", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Hydra: Hydra3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Hydra3", Tag = "Hydra"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Hydra: Hydra4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Hydra4", Tag = "Hydra"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Hydra: Hydra5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Hydra5", Tag = "Hydra"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Avatar20
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar20", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Hydra: Hydra6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Hydra6", Tag = "Hydra"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Schattenlied: NightSong11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong11", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09a",
	},
};

State
{
	StateName = "Cutscene09a",
	OnOneTimeEvent	-- Kamera(Jumpcuts auf die Leichen)
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09b",
	},
};

State
{
	StateName = "Cutscene09b",
	OnOneTimeEvent	-- Avatar: Avatar21
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar21", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10a",
	},
};

State
{
	StateName = "Cutscene10a",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		--GotoState = "Cutscene10b",
		GotoState = "Cutscene10f",
	},
};

--State
--{
--	StateName = "Cutscene10b",
--	OnOneTimeEvent	-- Kamera präsentiert den Devourer als Boss, Zoom auf Waffe
--	{
--		Conditions =
--		{
--			
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_B_04_Take10", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene10c",
--	},
--};
--
--State
--{
--	StateName = "Cutscene10c",
--	OnOneTimeEvent	-- Kamera präsentiert den Devourer als Boss, Zoom auf totes Vieh auf dem Rücken
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_B_04_Take11", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene10d",
--	},
--};
--
--State
--{
--	StateName = "Cutscene10d",
--	OnOneTimeEvent	-- Kamera präsentiert den Devourer als Boss, Zoom auf verzierte Beinschiene
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_B_04_Take12", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene10e",
--	},
--};
--
--State
--{
--	StateName = "Cutscene10e",
--	OnOneTimeEvent	-- Kamera präsentiert den Devourer als Boss, Zoom auf Maul auf dem Kopf
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_B_04_Take13", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene10f",
--	},
--};

State
{
	StateName = "Cutscene10f",
	OnOneTimeEvent	-- Kamera präsentiert den Devourer als Boss, Totale vom Verschlinger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_04_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Hydra", File = "base/gfx/figures/boss/figure_boss_devourer_special_cutscene_cast.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- SOUND: Devourer Scream
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			-- SOUND: Devourer Scream
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B04_SOUND_Play_Devourer_Scream"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs werden beendet
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			FigureStop {Tag = "pl_HumanHeroJared"},
			FigureStop {Tag = "pl_HumanHeroShae"},
			FigureStop {Tag = "Hydra"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroShae"},
			-- Scriptingkram für die Karte
			FigureTeamTransfer {Tag = "Hydra", Team = "tm_Team3"}
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};