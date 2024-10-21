--************************************************************
--**
--**		City Ship Invasion
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroMordecay'",
		"'Urgi'",
		"'Sadok'",
	}
}

local _tRenderListWithBeasts = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderListWithBeasts.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroMordecay'",
		"'Urgi'",
		"'Sadok'",
		"'Blessed01'",
		"'Blessed02'",
		"'Blessed03'",
		"'Blessed04'",
		"'Blessed05'",
		"'Blessed06'",
		"'Blessed07'",
		"'Blessed08'",
		"'Blessed09'",
		"'Blessed10'",
		"'Blessed11'",
		"'Blessed12'",
		"'Blessed13'",
		"'Blessed14'",
		"'Blessed15'",
		"'Blessed16'",
		"'Blessed17'",
		"'Blessed18'",
		"'Blessed19'",
		"'Blessed20'",
		"'Blessed21'",
		"'Blessed22'",
		"'Blessed23'",
		"'Blessed24'",
		"'Blessed25'",
		"'Blessed26'",
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
			-- Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_03_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_03_Wind01"},
			FigureVanish {Tag = "Dummy_CS_03_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay03"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay04"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay05"},
			FigureVanish {Tag = "Dummy_CS_03_Sadok01"},
			FigureVanish {Tag = "Dummy_CS_03_Urgi01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_03"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_CS03Start"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 348.966, Y = 383.486, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 350},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 350.525, Y = 383.39, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 340},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 347.52, Y = 384.267, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 355},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 345.715, Y = 383.752, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 0},
			CutsceneFigureTeleport {Tag = "Urgi", X = 348.054, Y = 322.021, },
			FigureLookAtDirection {Tag = "Urgi", Direction = 270},
			CutsceneFigureTeleport {Tag = "Sadok", X = 343.655, Y = 322.759, },
			FigureLookAtDirection {Tag = "Sadok", Direction = 75},
			CutsceneFigureTeleport {Tag = "Blessed14", X = 343.013, Y = 325.221},
			FigureLookAtDirection {Tag = "Blessed14", Direction = 65},
			CutsceneFigureTeleport {Tag = "Blessed26", X = 342.473, Y = 320.562},
			FigureLookAtDirection {Tag = "Blessed26", Direction = 120},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "Urgi"},
			CutsceneFigureWeaponsHide {Tag = "Sadok"},
			CutsceneFigureWeaponsHide {Tag = "Blessed14"},
			CutsceneFigureWeaponsHide {Tag = "Blessed26"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "Sadok"},
			FigureCutsceneTalkJobSet {Tag = "Blessed14"},
			FigureCutsceneTalkJobSet {Tag = "Blessed26"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- CS03Avatar01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Avatar01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- CS03Mordecay02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Mordecay02", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Mordecay rennt los
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			_tRenderListWithBeasts,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanHeroMordecay", X = 339.071, Y = 372.697},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf Anschleichposition & Mordecay wird umteleportiert und geht los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 325.789, Y = 343.505, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 35},
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 329.043, Y = 336.455, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- CS03Urgi03
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanHeroMordecay"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Urgi03", Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- CS03Sadok04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Sadok04", Tag = "Sadok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- CS03Sadok05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CS03Sadok05", Tag = "Sadok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- CS03Urgi06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Urgi06", Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- CS03Blessed07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Blessed07", Tag = "Blessed26"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kamera auf Mordecay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Mordecay geht weg
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 325.789, Y = 343.505},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Mordecay wird zur Gruppe teleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 347.99, Y = 380.629, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 165},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- CS03Mordecay08
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS03Mordecay08", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- CS03Avatar09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CS03Avatar09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			-- Kameras werden gestoppt, Balken verschwinden, UI wird eingeblendet
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Talkjobs werden durch den Event direkt beendet
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "Urgi"},
			CutsceneFigureWeaponsShow {Tag = "Sadok"},
			CutsceneFigureWeaponsShow {Tag = "Blessed14"},
			CutsceneFigureWeaponsShow {Tag = "Blessed26"},
			-- Akteure werden an ihre Editorpositionen zurückteleportiert
			CutsceneFigureTeleportBack {Tag = "Sadok"},
			CutsceneFigureTeleport {Tag = "Urgi", X = 411.066, Y = 239.492, },
			
			CutsceneFigureTeleport {Tag = "Blessed14", X = 344.045, Y = 325.289, },
			CutsceneFigureTeleport {Tag = "Blessed26", X = 343.549, Y = 320.562, },
			
			FigureLookAtDirection {Tag = "Urgi", Direction = 33},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS03Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};