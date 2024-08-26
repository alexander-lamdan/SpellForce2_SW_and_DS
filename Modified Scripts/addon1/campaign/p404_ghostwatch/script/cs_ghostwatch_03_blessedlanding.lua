--************************************************************
--**
--**		Ghostwatch Blessedlanding
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
			FigureVanish {Tag = "Dummy_CS_03_Caine01"},
			FigureVanish {Tag = "Dummy_03_Geweihter01"},
			FigureVanish {Tag = "Dummy_03_Geweihter02"},
			FigureVanish {Tag = "Dummy_03_Geweihter03"},
			FigureVanish {Tag = "Dummy_03_Geweihter04"},
			FigureVanish {Tag = "Dummy_03_Geweihter05"},
			FigureVanish {Tag = "Dummy_03_Geweihter06"},
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
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 338.6, Y = 396.95},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 308},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 341.2, Y = 396.7},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 303},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 341.5, Y = 395},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 291},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 337.2, Y = 398.33},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 331},
			-- Einheiten spawnen
			MapFlagSetTrue {Name = "mf_CS_03_Worker_Spawn"},
			MapFlagSetTrue {Name = "mf_Mordecay_Spawn"},
			MapFlagSetTrue {Name = "mf_CS_03_Geweihte_Spawn"},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
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
	OnOneTimeEvent	-- ShaikanBaumeister01
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
			CutsceneSay {TextTag = "ShaikanBaumeister01", Tag = "Shaikan_Constructor01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- ShaikanBaumeister02
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
			CutsceneSay {TextTag = "ShaikanBaumeister02", Tag = "Shaikan_Constructor01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
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
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf Mordecay & Blessedchefs werden aus dem Bild teleportiert
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "BlessedChef01", X = 415, Y = 215},
			CutsceneFigureTeleport {Tag = "BlessedChef02", X = 415, Y = 215},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Mordecay01
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
			CutsceneSay {TextTag = "Mordecay01", Tag = "Mordecay"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Mordecay02 & Geweihte gehen los
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
			CutsceneSay {TextTag = "Mordecay02", Tag = "Mordecay"},
			--FigureSimpleWalk {Tag = "CS_03_Geweihter01", X = GetEntityX()-CS_03_Geweihte_GotoX, Y = GetEntityY()-CS_03_Geweihte_GotoY},
			FigureSimpleWalk {Tag = "CS_03_Geweihter01", X = 338.8, Y = 168},
			FigureSimpleWalk {Tag = "CS_03_Geweihter02", X = 338.8, Y = 168},
			FigureSimpleWalk {Tag = "CS_03_Geweihter03", X = 338.8, Y = 168},
			FigureSimpleWalk {Tag = "CS_03_Geweihter04", X = 338.8, Y = 168},
			FigureSimpleWalk {Tag = "CS_03_Geweihter05", X = 338.8, Y = 168},
			FigureSimpleWalk {Tag = "CS_03_Geweihter06", X = 338.8, Y = 168},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamera auf Lager der Kaiserlichen & Teleport der Geweihten & Run der Geweihten
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter01", X = 267.4, Y = 117.6},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter02", X = 268.8, Y = 116.2},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter03", X = 270.2, Y = 119},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter04", X = 271.6, Y = 117.6},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter05", X = 273, Y = 116.2},
			CutsceneFigureTeleport {Tag = "CS_03_Geweihter06", X = 274.4, Y = 119},
			FigureRun {Tag = "CS_03_Geweihter01", X = 236, Y = 126},
			FigureRun {Tag = "CS_03_Geweihter02", X = 236, Y = 126},
			FigureRun {Tag = "CS_03_Geweihter03", X = 236, Y = 126},
			FigureRun {Tag = "CS_03_Geweihter04", X = 236, Y = 126},
			FigureRun {Tag = "CS_03_Geweihter05", X = 236, Y = 126},
			FigureRun {Tag = "CS_03_Geweihter06", X = 236, Y = 126},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar05
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Caine09
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
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Caine09", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
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
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Avatar07
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "Mordecay"},
			-- BlessedChefs werden zurückteleportiert an Editorposition
			CutsceneFigureTeleportBack {Tag = "BlessedChef01"},
			CutsceneFigureTeleportBack {Tag = "BlessedChef02"},
			-- Akteure werden gelöscht
			FigureVanish {Tag = "CS_03_Geweihter01"},
			FigureVanish {Tag = "CS_03_Geweihter02"},
			FigureVanish {Tag = "CS_03_Geweihter03"},
			FigureVanish {Tag = "CS_03_Geweihter04"},
			FigureVanish {Tag = "CS_03_Geweihter05"},
			FigureVanish {Tag = "CS_03_Geweihter06"},
			FigureVanish {Tag = "Shaikan_Constructor01"},
			FigureVanish {Tag = "Shaikan_Constructor02"},
			FigureVanish {Tag = "Shaikan_Constructor03"},
			FigureVanish {Tag = "Shaikan_Constructor04"},
			FigureVanish {Tag = "Shaikan_Constructor05"},
			FigureVanish {Tag = "Shaikan_Constructor06"},
			FigureVanish {Tag = "Shaikan_Constructor07"},
			-- Figuren werden zum Avatar teleportiert
			FigureTeleportToEntity	{Tag = "Ragna", TargetTag = "RS_DeepInsideGhostwatch"},	
			FigureTeleportToEntity	{Tag = "Commander", TargetTag = "RS_DeepInsideGhostwatch"},	
			FigureTeamTransfer	{Tag = "Commander", Team = "tm_Team1"},
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