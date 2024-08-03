--************************************************************
--**														**
--**		Steel Shore Intro								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Sorvina'",
	}
}

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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Avatar01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Malacay01"},
			FigureVanish {Tag = "CS_02_Sorvina01"},
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Nightsong01"},
			FigureVanish {Tag = "CS_02_Nightsong02"},
			FigureVanish {Tag = "CS_02_ShadowWarrior01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			--MapFlagIsTrue	{Name = "mf_Cutscene01"},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 177.8, Y = 96.6},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			-- Talkjob Avatar
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Kamerafahrt über Festung
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Sorvina: Sorvina1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina1", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamerafahrt über Festung
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05a",
	},
};

State
{
	StateName = "Cutscene05a",
	OnOneTimeEvent	-- Effekt Start auf Spawnpunkte von Malar 1 und 2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStart {Tag = "CS_01_Malar01_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Malar02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Malar 1 & 2 Spawn
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_MalarA_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05b",
	},
};

State
{
	StateName = "Cutscene05b",
	OnOneTimeEvent	-- Malar 1 und 2 spawnen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_Malar01_Spawn"},
			MapFlagSetTrue {Name = "mf_P320_Malar02_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Kamera auf Sorvina, Sorvina Animation
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Sorvina spielt Cast-Animation ab
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast.ska"}, -- 2s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07a",
	},
};

State
{
	StateName = "Cutscene07a",
	OnOneTimeEvent	-- Effekt Start auf Spawnpunkte von Malar 3 und 4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			EffectStart {Tag = "CS_01_Malar03_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Malar04_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Malar 3 und 4 Spawn
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_MalarB_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07b",
	},
};

State
{
	StateName = "Cutscene07b",
	OnOneTimeEvent	-- Malar 3 und 4 spawnen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_Malar03_Spawn"},
			MapFlagSetTrue {Name = "mf_P320_Malar04_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kamera auf Avatar und Position auf der der ShadowWarrior erscheinen wird
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Effekt auf FX-Marker dort wo ShadowWarrior gleich erscheinen wird
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EffectStart {Tag = "CS_01_Shadowwarrior_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Shadowwarrior Spawn
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_Shadowwarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- ShadowWarrior erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_CS_01_ShadowWarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- ShadowWarrior: ShadowWarrior1, Talkjob ShadowWarrior
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShadowWarrior1", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- ShadowWarrior: ShadowWarrior2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ShadowWarrior2", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Effekt auf FX-Marker dort wo ShadowWarrior gleich verschwinden wird
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStart {Tag = "CS_01_Shadowwarrior_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Shadowwarrior Despawn
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_Shadowwarrior_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- ShadowWarrior verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_CS_01_ShadowWarrior_Vanish"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Malar werden gelöscht
			MapFlagSetTrue {Name = "mf_P320_Malar_Vanish"},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Ausrichten der Helden auf den Avatar
			FigureLookAtEntity	{Tag = "pl_HumanNightsong", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroJared", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroShae", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "pl_HumanAvatar"},
			-- Scriptingkram für die Karte
			-- bitte hierher
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};












