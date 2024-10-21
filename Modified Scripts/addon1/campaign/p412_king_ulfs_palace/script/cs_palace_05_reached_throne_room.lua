--************************************************************
--**
--**		King Ulfs Palace Reached Throne Room
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
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'Former'",
		"'EndGeweither1'",
		"'EndGeweither2'",
		"'EndGeweither3'",
		"'EndGeweither4'",
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
			FigureVanish {Tag = "Dummy_CS_05_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_05_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_05_Wind01"},
			FigureVanish {Tag = "Dummy_CS_05_Wind02"},
			FigureVanish {Tag = "Dummy_CS_05_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_05_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_05_Caine01"},
			FigureVanish {Tag = "Dummy_CS_05_Caine02"},
			FigureVanish {Tag = "Dummy_CS_05_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_05_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_05_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_05_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_05_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_05_Nightsong02"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_05"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P412_Reached_Throne_Room_Start"},
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
			CameraTakeAddToTrack {File = "CS_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_05_Take03", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_05_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 186.2, Y = 282.8, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 185.247, Y = 281.869, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 187.115, Y = 281.332, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 186.273, Y = 277.405, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 185.846, Y = 280.414, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 186.949, Y = 279.276, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 185.355, Y = 278.767, },
			CutsceneFigureTeleport {Tag = "Former", X = 186.302, Y = 327.571, },
			CutsceneFigureTeleport {Tag = "EndGeweither1", X = 179.263, Y = 325.547, },
			CutsceneFigureTeleport {Tag = "EndGeweither2", X = 184.186, Y = 321.706, },
			CutsceneFigureTeleport {Tag = "EndGeweither3", X = 187.787, Y = 322.014, },
			CutsceneFigureTeleport {Tag = "EndGeweither4", X = 193.312, Y = 325.596, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 180},
			FigureLookAtDirection {Tag = "Former", Direction = 0},
			FigureLookAtDirection {Tag = "EndGeweither1", Direction = 110},
			FigureLookAtDirection {Tag = "EndGeweither2", Direction = 170},
			FigureLookAtDirection {Tag = "EndGeweither3", Direction = 190},
			FigureLookAtDirection {Tag = "EndGeweither4", Direction = 260},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Former"},
			-- Helden werden auf 100% Health gebracht
			FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanHeroWind", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanHeroWhisper", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanHeroCaine", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanHeroYasha", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanHeroMordecay", Percent = 100},
			FigureHealthSet	{Tag = "pl_HumanNightsong", Percent = 100},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
	},
	OnOneTimeEvent -- Avatar und Mordecay laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 186.2, Y = 313.6, },
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 186.949, Y = 310.076, },
			EntityTimerStart {Name = "et_CSWalkTimer"},
		},
	},
	OnOneTimeEvent -- Wind und Yasha laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSWalkTimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 185.247, Y = 312.669, },
			FigureSimpleWalk {Tag = "pl_HumanHeroYasha", X = 185.847, Y = 311.214, },
		},
	},
	OnOneTimeEvent -- Whisper und Nightsong laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSWalkTimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 187.115, Y = 312.132, },
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 185.355, Y = 309.567, },
		},
	},
	OnOneTimeEvent -- Caine läuft los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSWalkTimer", Seconds = 0.6},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 186.273, Y = 308.205, },
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kamera hinter den Former
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- ShaperTR01 & Talkjobs Avatar und Helden
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ShaperTR01", Tag = "Former"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroYasha"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- ShaperTR02
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
			CameraTakeAddToTrack {File = "CS_05_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShaperTR02", Tag = "Former"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- AvatarTR03
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
			CameraTakeAddToTrack {File = "CS_05_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AvatarTR03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- AvatarTR04
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
			CameraTakeAddToTrack {File = "CS_05_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AvatarTR04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- ShaperTR05
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
			CameraTakeAddToTrack {File = "CS_05_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShaperTR05", Tag = "Former"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- ShaperTR06
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
			CameraTakeAddToTrack {File = "CS_05_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShaperTR06", Tag = "Former"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- AvatarTR07
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
			CameraTakeAddToTrack {File = "CS_05_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AvatarTR07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- AvatarTR08
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
			CutsceneSay {TextTag = "AvatarTR08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimerCamera"},
		},
	},
	OnOneTimeEvent	-- AvatarTR08
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerCamera", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerCamera"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
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
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_P412_Reached_Throne_Room_Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};