--************************************************************
--**														**
--**		Westguard Battle Interrupt						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Aya'",
		"'TorHalicos'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_HalicosSpawn"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P309_TorHalicosIsOnWestguard"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Aya01"},
			FigureVanish {Tag = "CS_01_Aya02"},
			FigureVanish {Tag = "CS_01_Halicos01"},
			FigureVanish {Tag = "CS_01_Halicos02"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Avatar und Aya kämpfen
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene01"},
				AND
				{
					FigureIsAlive {Tag = "Aya"},
					FigureHasNotHealth {Tag = "Aya", Percent = 12},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Aya und Halicos werden auf Neutral gesetzt
			FigureTeamTransfer	{Tag = "Aya", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "TorHalicos", Team = "tm_Neutral"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 170.644, Y = 136.992},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 45},
			FigureTeleport {Tag = "Aya", X = 173.6, Y = 135.8},
			FigureLookAtDirection {Tag = "Aya", Direction = 305},
			FigureTeleport {Tag = "TorHalicos", X = 170.8, Y = 134.4},
			FigureLookAtDirection {Tag = "TorHalicos", Direction = 125},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Aya"},
			FigureCutsceneTalkJobSet {Tag = "TorHalicos"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Aya"},
			CutsceneFigureWeaponsHide {Tag = "TorHalicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- TorHalicos: CSAyaAttacks1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CSAyaAttacks1", Tag = "TorHalicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Aya: CSAyaAttacks2
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
			CutsceneSay {TextTag = "CSAyaAttacks2", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- TorHalicos: CSAyaAttacks3
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
			CutsceneSay {TextTag = "CSAyaAttacks3", Tag = "TorHalicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Aya: CSAyaAttacks4
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
			CutsceneSay {TextTag = "CSAyaAttacks4", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Aya: CSAyaAttacks5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CSAyaAttacks5", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Aya geht
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
			FigureSimpleWalk {Tag = "Aya", X = 208.6, Y = 135.8},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- TorHalicos: CSAyaAttacks6
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CSAyaAttacks6", Tag = "TorHalicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09a",
	},
};

State
{
	StateName = "Cutscene09a",
	OnOneTimeEvent	-- TorHalicos läuft Aya nach
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "TorHalicos", X = 208.6, Y = 134.4},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09b",
	},
};

State
{
	StateName = "Cutscene09b",
	OnOneTimeEvent	-- TorHalicos holt Aya ein...
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "TorHalicos", TargetTag = "Aya", Range = 3},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09c",
	},
};

State
{
	StateName = "Cutscene09c",
	OnOneTimeEvent	--  ...und hört auf zu rennen und geht stattdessen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "TorHalicos", X = 208.6, Y = 134.4},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar: CSAyaAttacks7
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CSAyaAttacks7", Tag = "pl_HumanAvatar"},			
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
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Aya"},
			CutsceneFigureWeaponsShow {Tag = "TorHalicos"},
			-- Löschen der nicht mehr benötigten Akteure
			FigureVanish {Tag = "Aya"},
			FigureVanish {Tag = "TorHalicos"},
			AvatarFlagSetTrue{Name = "af_P300_CutszeneAyaEnd"}, 
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};

