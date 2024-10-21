--************************************************************
--**														**
--**		Golden Fields Part III Reached King				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Falkmar'",
		"'Io'",
		"'KingUlf'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Io, Avatar Falkmar und König Ulf
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneC01"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P304_Cutscene05Start"},
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
			CameraTakeAddToTrack {File = "CS_C_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 440.91, Y = 323.187},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Falkmar", X = 442.718, Y = 323.436},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 205},
			FigureTeleport {Tag = "Io", X = 439.185, Y = 323.491},
			FigureLookAtDirection {Tag = "Io", Direction = 160},
			FigureTeleport {Tag = "KingUlf", X = 441.018, Y = 326.252},
			FigureLookAtDirection {Tag = "KingUlf", Direction = 325},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			FigureCutsceneTalkJobSet {Tag = "Io"},
			FigureCutsceneTalkJobSet {Tag = "KingUlf"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			CutsceneFigureWeaponsHide {Tag = "Io"},
			CutsceneFigureWeaponsHide {Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Io: AtUlfAgain_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "AtUlfAgain_01", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- König Ulf: AtUlfAgain_02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "AtUlfAgain_02", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Io: AtUlfAgain_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_03", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- König Ulf: AtUlfAgain_04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_04", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- König Ulf: AtUlfAgain_05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "AtUlfAgain_05", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- König Ulf: AtUlfAgain_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_C_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_06", Tag = "KingUlf"},
			-- Ausrichten von König Ulf
			FigureLookAtDirection {Tag = "KingUlf", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar: AtUlfAgain_07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Falkmar: AtUlfAgain_08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_08", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar: AtUlfAgain_09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Falkmar: AtUlfAgain_10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_C_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AtUlfAgain_10", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
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
			FigureStop {Tag = "Falkmar"},
			FigureStop {Tag = "Io"},
			FigureStop {Tag = "KingUlf"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Falkmar"},
			CutsceneFigureWeaponsShow {Tag = "Io"},
			CutsceneFigureWeaponsShow {Tag = "KingUlf"},
			-- Akteure schauen zum König
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "KingUlf"},
			FigureLookAtEntity	{Tag = "Falkmar", TargetTag = "KingUlf"},
			FigureLookAtEntity	{Tag = "Io", TargetTag = "KingUlf"},
			-- Helden werden zum Avatar teleportiert
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 438.2, Y = 319.2},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 439.6, Y = 317.8},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 441, Y = 319.2},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 442.4, Y = 317.8},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 443.8, Y = 319.2},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 190},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P304_CS05Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};