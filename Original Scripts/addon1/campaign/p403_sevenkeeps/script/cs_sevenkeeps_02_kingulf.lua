--************************************************************
--**
--**		Sevenkeeps KingUlf
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Jandrim'",
		"'Skjadir'",
		"'Ulf'",
		"'Riddengard'",
		"'Halicos'",
		"'GeneralKaran'",
		
		
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
			FigureVanish {Tag = "Dummy_CS_02_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar03"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar04"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar05"},
			FigureVanish {Tag = "Dummy_CS_02_Skjadir01"},
			FigureVanish {Tag = "Dummy_CS_02_Skjadir02"},
			FigureVanish {Tag = "Dummy_CS_02_Halicos01"},
			FigureVanish {Tag = "Dummy_CS_02_Karan01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_02"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P403_KingUlfCS"},
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
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure Zwergenviertel
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 473.2, Y = 582.4},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			CutsceneFigureTeleport {Tag = "Skjadir", X = 476, Y = 582.4},
			FigureLookAtDirection {Tag = "Skjadir", Direction = 180},
			CutsceneFigureTeleport {Tag = "Jandrim", X = 474.6, Y = 603.4},
			FigureLookAtDirection {Tag = "Jandrim", Direction = 0},
			-- Teleport und Ausrichtung der Akteure Königspalat
			CutsceneFigureTeleport {Tag = "Ulf", X = 441, Y = 323.4},
			FigureLookAtDirection {Tag = "Ulf", Direction = 0},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 438, Y = 320.8},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 110},
			CutsceneFigureTeleport {Tag = "Halicos", X = 442.8, Y = 311.8},
			FigureLookAtDirection {Tag = "Halicos", Direction = 330},
			CutsceneFigureTeleport {Tag = "GeneralKaran", X = 443.8, Y = 323.4},
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 0},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Skjadir"},
			CutsceneFigureWeaponsHide {Tag = "Jandrim"},
			CutsceneFigureWeaponsHide {Tag = "Ulf"},
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			CutsceneFigureWeaponsHide {Tag = "Halicos"},
			--CutsceneFigureWeaponsHide {Tag = "GeneralKaran"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Jandrim"},
			FigureCutsceneTalkJobSet {Tag = "Ulf"},
			FigureCutsceneTalkJobSet {Tag = "Jandrim"},
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},
			FigureCutsceneTalkJobSet {Tag = "Halicos"},
			-- Avatar und Skjadir laufen zu Jandrim (Zwerge laufen nach dem Spawnen los)
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 473.2, Y = 599.2},
			FigureSimpleWalk {Tag = "Skjadir", X = 476, Y = 599.2},
			-- Zwerge werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_02_Actors_Spawn"},
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
	OnOneTimeEvent	-- Jandrim01
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
			CutsceneSay {TextTag = "Jandrim01", Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Skjadir07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			FigureIsIdle {Tag = "Skjadir"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Skjadir07", Tag = "Skjadir"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 105},
			FigureLookAtDirection {Tag = "Skjadir", Direction = 255},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Skjadir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Skjadir08
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
			CutsceneSay {TextTag = "Skjadir08", Tag = "Skjadir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Jandrim02
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
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Jandrim02", Tag = "Jandrim"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 165},
			FigureLookAtDirection {Tag = "Skjadir", Direction = 200},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kamera fährt aus der Zwergenviertel-Szene
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
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Kamera fährt in die Königspalast-Szene, Avatar wird teleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 441, Y = 309.4},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Riddengard01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Riddengard01", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Halicos01
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
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos01", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar04
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
			CutsceneSay {TextTag = "Avatar04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Halicos02
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
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos02", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Avatar05
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
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Halicos03
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
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos03", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar06
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
			CameraTakeAddToTrack {File = "CS_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Halicos04
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
			CameraTakeAddToTrack {File = "CS_02_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos04", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Avatar läuft los 
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 441, Y = 318.7},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Halicos05
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Halicos05", Tag = "Halicos"},
			FigureLookAtDirection {Tag = "Halicos", Direction = 220},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Avatar07 & Karan stellt sich in den Weg
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar07", Tag = "pl_HumanAvatar"},
			FigureSimpleWalk {Tag = "GeneralKaran", X = 441.6, Y = 321.2},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 70},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle {Tag = "GeneralKaran"},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 355},
		},
	},
	OnOneTimeEvent	-- Avatar08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "GeneralKaran"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar08", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 355},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Riddengard02
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
			CameraTakeAddToTrack {File = "CS_02_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Riddengard02", Tag = "Riddengard"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 230},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Avatar09
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
			CameraTakeAddToTrack {File = "CS_02_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Avatar10
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
			CameraTakeAddToTrack {File = "CS_02_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar10", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Ulf01
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
			CutsceneSay {TextTag = "Ulf01", Tag = "Ulf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Riddengard03
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
			CameraTakeAddToTrack {File = "CS_02_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Riddengard03", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Avatar geht weg
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
			CameraTakeAddToTrack {File = "CS_02_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 441, Y = 313.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Halicos06
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos06", Tag = "Halicos"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 35},
			FigureLookAtDirection {Tag = "Halicos", Direction = 245},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
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
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
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
			CutsceneFigureWeaponsShow {Tag = "Skjadir"},
			CutsceneFigureWeaponsShow {Tag = "Jandrim"},
			CutsceneFigureWeaponsShow {Tag = "Ulf"},
			CutsceneFigureWeaponsShow {Tag = "Riddengard"},
			CutsceneFigureWeaponsShow {Tag = "Halicos"},
			--CutsceneFigureWeaponsShow {Tag = "GeneralKaran"},
			-- Helden werden zum Avatar teleportiert
			FigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "pl_HumanAvatar"},
			-- Zwerge werden gelöscht
			FigureVanish {Tag = "CS_02_Dwarf_01"},
			FigureVanish {Tag = "CS_02_Dwarf_02"},
			FigureVanish {Tag = "CS_02_Dwarf_03"},
			FigureVanish {Tag = "CS_02_Dwarf_04"},
			FigureVanish {Tag = "CS_02_Dwarf_05"},
			FigureVanish {Tag = "CS_02_Dwarf_06"},
			FigureVanish {Tag = "CS_02_Dwarf_07"},
			FigureVanish {Tag = "CS_02_Dwarf_08"},
			FigureVanish {Tag = "CS_02_Dwarf_09"},
			FigureVanish {Tag = "CS_02_Dwarf_10"},
			FigureVanish {Tag = "CS_02_Dwarf_11"},
			FigureVanish {Tag = "CS_02_Dwarf_12"},
			-- Roaming-Zwerge werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_02_RoamingDarves_Spawn"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_KingUlfCS"},
			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};