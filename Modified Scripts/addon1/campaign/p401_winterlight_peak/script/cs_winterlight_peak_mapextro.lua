--************************************************************
--**
--**		Winterlight Peak MapExtro
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroWind'",
		"'Skjardir'",
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
			FigureVanish {Tag = "Dummy_CS_03_Skjadir01"},
			FigureVanish {Tag = "Dummy_CS_03_Skjadir02"},
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
					MapFlagIsTrue {Name = "mf_P401_StartEndCS"},
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
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 194, Y = 313.62, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 343},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 190.54, Y = 313.66, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 28},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 188.959, Y = 312.554, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 47},
			CutsceneFigureTeleport {Tag = "Skjardir", X = 192.405, Y = 301.485},
			FigureLookAtDirection {Tag = "Skjardir", Direction = 180},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			-- Skjardir rennt zum Avatar
			FigureSimpleRun {Tag = "Skjardir", X = 192.405, Y = 310.335},
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
	OnOneTimeEvent	-- Skjadir: Skjadir11
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Skjardir"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureCutsceneTalkJobSet {Tag = "Skjardir"},
			CutsceneSay {TextTag = "Skjadir11", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Skjadir: Skjadir12
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
			CutsceneSay {TextTag = "Skjadir12", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Skjadir: Skjadir13
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
			CutsceneSay {TextTag = "Skjadir13", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Skjadir: Skjadir14
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
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Skjadir14", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05a",
	},
};

State
{
	StateName = "Cutscene05a",
	OnOneTimeEvent	-- Skjadir rennt zum Portal und verschwindet
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
			FigureSimpleRun {Tag = "Skjardir", X = 191.791, Y = 319.955, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05b",
	},
};

State
{
	StateName = "Cutscene05b",
	OnOneTimeEvent	-- Skjadir verschwindet
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Skjardir"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureVanish {Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05c",
	},
};

State
{
	StateName = "Cutscene05c",
	OnOneTimeEvent	-- Avatar: Avatar02
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
			CutsceneSay {TextTag = "Avatar02", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 280},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Wisper03
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
			CutsceneSay {TextTag = "Wisper03", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar: Avatar03
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
			CutsceneSay {TextTag = "Avatar03", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 290},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Wisper: Wisper04
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
			CameraTakeAddToTrack {File = "CS_03_Take06b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},				
			CutsceneSay {TextTag = "Wisper04", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Wind: Wind01
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
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Wind01", Tag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar geht zum Portal
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
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Winterlight_Alluvyan"},
			FigureLookAtEntity {Tag = "pl_HumanHeroWind", TargetTag = "Winterlight_Alluvyan"},
			FigureLookAtEntity {Tag = "pl_HumanHeroWhisper", TargetTag = "Winterlight_Alluvyan"},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 191.791, Y = 319.955},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Wisper folgt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 191.791, Y = 319.955},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Wind folgt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 191.791, Y = 319.955},
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
			--FigureIsIdle {Tag = "pl_HumanAvatar"},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.3},
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
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_P401_EndEndCS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};