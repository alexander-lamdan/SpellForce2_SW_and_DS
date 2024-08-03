--************************************************************
--**														**
--**		Crater Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Naugron'",
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
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Bor01"},
			FigureVanish {Tag = "CS_02_Lya01"},
			FigureVanish {Tag = "CS_02_Jared01"},
			FigureVanish {Tag = "CS_02_Shae01"},
			FigureVanish {Tag = "CS_02_Mordecay01"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			FigureVanish {Tag = "CS_03_Bor01"},
			FigureVanish {Tag = "CS_03_Lya01"},
			FigureVanish {Tag = "CS_03_Jared01"},
			FigureVanish {Tag = "CS_03_Shae01"},
			FigureVanish {Tag = "CS_03_Mordecay01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera dreht sich um Naugron und Sorvinas Erscheinung
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Naugron"},
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Sorvina: SorviNaug01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SorviNaug01", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Sorvina: SorviNaug02
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
			CutsceneSay {TextTag = "SorviNaug02", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Sorvina: SorviNaug03
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
			CutsceneSay {TextTag = "SorviNaug03", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Naugron: Sorvinaug04
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
			CutsceneSay {TextTag = "SorviNaug04", Tag = "Naugron"},
			EntityTimerStart {Name = "et_CStimer"},
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
			FigureStop {Tag = "Naugron"},
			FigureStop {Tag = "Sorvina"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue{Name = "af_P313_Cutscene01Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};