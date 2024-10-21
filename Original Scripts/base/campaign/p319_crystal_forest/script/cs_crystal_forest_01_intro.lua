--************************************************************
--**														**
--**		Crystal Forest Intro							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'Ice_Golem01'",
		"'Ice_Golem02'",
		"'Catapult_01'",
		"'Catapult_02'",
		"'Catapult_03'",
		"'Catapult_04'",
		"'Catapult_05'",
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
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			FigureVanish {Tag = "CS_03_Shadowsong01"},
			FigureVanish {Tag = "CS_03_Shadowsong02"},
			FigureVanish {Tag = "CS_03_ShadowWarrior01"},
			FigureVanish {Tag = "CS_03_ShadowWarrior02"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_04_Avatar01"},
			FigureVanish {Tag = "CS_04_Shadowsong01"},
			FigureVanish {Tag = "CS_04_ShadowWarrior01"},
			ObjectVanish {Tag = "CS_Endportal_Effekt"},
		},
	},
	OnCutsceneFigureRespawnEvent
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
			FigureTeleport {Tag = "pl_HumanAvatar", X = 130.2, Y = 124.6},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 140.231, Y = 97.077},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 268.944},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Effekt Start auf Avatar
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			-- Effekt Start auf Portal
			EffectStart {Tag = "Portal_Start", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	}
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 135.6, Y = 95.519},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Schattenlied: PortalWastes_01 & Avatar läuft aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "PortalWastes_01", Tag = "pl_HumanNightsong"},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 138.353, Y = 98.2878},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf das Labor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 138.353, Y = 98.288},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 62.807},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 252.328},			
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: PortalWastes_02
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
			CutsceneSay {TextTag = "PortalWastes_02", Tag = "pl_HumanAvatar"},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Turmbarriere
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Schattenlied: PortalWastes_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PortalWastes_03", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Avatar und Schattenlied
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
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
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Effekt vom Portal entfernen
			EffectStop {Tag = "Portal_Start"},
			-- Ausrichten der Helden
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 135},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 135},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 135},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 135},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 135},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P319_CS01Finished"},			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};