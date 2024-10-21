--************************************************************
--**														**
--**		Rushwater Downs Intro							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'Falkmar'",
		"'Grunt'",
		"'Ambush11'",
		"'Ambush12'",
		"'Ambush13'",
		"'Ambush14'",
		-- Einwohner der Stadt
		"'CronachGuards11'",
		"'LyrCitMale'",
		"'CronachGuards9'",
		"'LyrCitFema'",
		"'CronachGuards6'",
		"'CronachGuards10'",
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
			FigureVanish {Tag = "CS_01_Falkmar01"},
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			FigureVanish {Tag = "CS_01_Horse01"},
			FigureVanish {Tag = "CS_01_Crossbowman01"},
			FigureVanish {Tag = "CS_01_Goto01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Falkmar01"},
			FigureVanish {Tag = "CS_02_Horse01"},
			FigureVanish {Tag = "CS_02_Horse02"},
			FigureVanish {Tag = "CS_02_Horse03"},
			FigureVanish {Tag = "CS_02_Horse04"},
			FigureVanish {Tag = "CS_02_Horse05"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Helfdan01"},
			FigureVanish {Tag = "CS_03_Helfdan02"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Portal
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
			FigureTeleport {Tag = "pl_HumanAvatar", X = 115.274, Y = 158.423},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 103.132},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 115.104, Y = 160.309},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 81.15},
			FigureTeleport {Tag = "Falkmar", X = 119.083, Y = 159.386},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 279.786},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Effekt auf Portal
			EffectStart {Tag = "StartPortal", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Packpferd spawnt im Portal und geht nach 1.5s weiter
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_01_Horse_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Crossbowman spawnt im Portal und geht nach 1.5s weiter
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_01_Crossbowman_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Falkmar: Falkmar1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar1", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Falkmar: Falkmar2
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
			CutsceneSay {TextTag = "Falkmar2", Tag = "Falkmar"},
			-- SOUND: Ambient City Play
			MapFlagSetTrue {Name = "mf_P303_Rushwater_Downs_01_SOUND_Play_Ambient_City"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Falkmar: Falkmar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Falkmar3", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Avatar0a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar0a", Tag = "pl_HumanAvatar"},
			-- SOUND: Ambient City Stop
			MapFlagSetTrue {Name = "mf_P303_Rushwater_Downs_01_SOUND_Stop_Ambient_City"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar: Avatar0b & Kamera auf die Brücke
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
			CutsceneSay {TextTag = "Avatar0b", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Falkmar: Falkmar4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Falkmar4", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera zurück auf Avatar, Schattenlied und Falkmar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Falkmar läuft vor die Pferde
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Falkmar", X = 120.206, Y = 142.025},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnCutsceneFigureDespawnEvent -- wenn Falkmar aus dem Bild ist, CutsceneEnd und Teleport Falkmar
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
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "Falkmar"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Falkmar"},
			-- Dummies werden gelöscht
			FigureVanish {Tag = "CS_01_Horse01"},
			FigureVanish {Tag = "CS_01_Crossbowman01"},
			-- Effekt auf Portal wird gestoppt
			EffectStop {Tag = "StartPortal"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Falkmar", X = 120.206, Y = 142.025},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 0},
			-- Ausrichten der Helden und Avatar auf Falkmar
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "Falkmar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "Falkmar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "Falkmar"},
			FigureLookAtEntity	{Tag = "pl_HumanNightsong", TargetTag = "Falkmar"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P303_Todesblocker"},
			QuestSetSolved {Quest = "ToRushwater"},
			QuestSetActive {Quest = "RushwaterPart1ConvoiToTown"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};