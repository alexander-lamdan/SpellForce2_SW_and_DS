--************************************************************
--**
--**		Alluvyan InnerGate02
--**
--************************************************************

TransformationTimer = 0.5

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
	}
}

-- Figuren die gerendert werden
local _tRenderList2 = CutsceneFigureRenderList{Tag = "AvatarOrc"}
_tRenderList2.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
	}
}

-- Figuren die gerendert werden
local _tRenderList3 = CutsceneFigureRenderList{Tag = "AvatarOrc"}
_tRenderList3.tModFuncs =
{
	Add =
	{
		"'WindOrc'",
		"'pl_HumanHeroWhisper'",
	}
}

-- Figuren die gerendert werden
local _tRenderList4 = CutsceneFigureRenderList{Tag = "AvatarOrc"}
_tRenderList4.tModFuncs =
{
	Add =
	{
		"'WindOrc'",
		"'WhisperOrc'",
		"'Kulkar'",
		"'GateGuard'",
		"'CS_04_Orc01'",
		"'CS_04_Orc02'",
		"'CS_04_Orc03'",
		"'CS_04_Orc04'",
		"'CS_04_Orc05'",
	}
}

-- Figuren die gerendert werden
local _tRenderList5 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList5.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'Kulkar'",
		"'GateGuard'",
		"'CS_04_Orc01'",
		"'CS_04_Orc02'",
		"'CS_04_Orc03'",
		"'CS_04_Orc04'",
		"'CS_04_Orc05'",
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
			FigureVanish {Tag = "Dummy_CS_04_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_04_Wind01"},
			FigureVanish {Tag = "Dummy_CS_04_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_04_AvatarOrc01"},
			FigureVanish {Tag = "Dummy_CS_04_AvatarOrc02"},
			FigureVanish {Tag = "Dummy_CS_04_AvatarOrc03"},
			FigureVanish {Tag = "Dummy_CS_04_WindOrc01"},
			FigureVanish {Tag = "Dummy_CS_04_WindOrc02"},
			FigureVanish {Tag = "Dummy_CS_04_WindOrc03"},
			FigureVanish {Tag = "Dummy_CS_04_WhisperOrc01"},
			FigureVanish {Tag = "Dummy_CS_04_WhisperOrc02"},
			FigureVanish {Tag = "Dummy_CS_04_WhisperOrc03"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_04"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P402_InnerGate02CS"},
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
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 429.8, Y = 450.8, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 427, Y = 450.8, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 429.8, Y = 448, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 135},
			-- Helden in Orkgestalt spawnen außerhalb des Sichtbereiches
			MapFlagSetTrue {Name = "mf_CS_04_Orcs_Spawn"},			
			-- Waffen werden nicht dargestellt
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "Kulkar"},
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
	OnOneTimeEvent	-- Effekt auf Avatar, Helden in Orkgestalt werden teleportiert
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
			_tRenderList,
			CutsceneFigureTeleportToEntity	{Tag = "AvatarOrc", TargetTag = "pl_HumanAvatar"},
			--CutsceneFigureTeleport {Tag = "AvatarOrc", X = 429.8, Y = 449.4, },
			FigureLookAtDirection {Tag = "AvatarOrc", Direction = 135},
			CutsceneFigureTeleportToEntity	{Tag = "WindOrc", TargetTag = "pl_HumanHeroWind"},
			--CutsceneFigureTeleport {Tag = "WindOrc", X = 427, Y = 449.4, },
			FigureLookAtDirection {Tag = "WindOrc", Direction = 135},
			CutsceneFigureTeleportToEntity	{Tag = "WhisperOrc", TargetTag = "pl_HumanHeroWhisper"},
			--CutsceneFigureTeleport {Tag = "WhisperOrc", X = 429.8, Y = 446.6, },
			FigureLookAtDirection {Tag = "WhisperOrc", Direction = 135},
			EffectStartAddon1 {Tag = "pl_HumanAvatar", File = "Effect_Scourge_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar in Menschengestalt verschwindet, Avatar als Ork taucht auf
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = TransformationTimer},
		},
		Actions =
		{
			_tRenderList2,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Effekt auf Wind
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "pl_HumanHeroWind", File = "Effect_Scourge_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Wind in Menschengestalt verschwindet, Wind als Ork taucht auf
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = TransformationTimer},
		},
		Actions =
		{
			_tRenderList3,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Effekt auf Whisper
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "pl_HumanHeroWhisper", File = "Effect_Scourge_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Whisper in Menschengestalt verschwindet, Whisper als Ork taucht auf
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = TransformationTimer},
		},
		Actions =
		{
			_tRenderList4,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar in Orkgestalt geht zum Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "AvatarOrc", X = 439.6, Y = 460.6, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Wind in Orkgestalt geht zum Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "WindOrc", X = 436.8, Y = 460.6, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Whisper in Orkgestalt geht zum Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "WhisperOrc", X = 439.6, Y = 457.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- FourthCutsceneDummy1
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "AvatarOrc"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "FourthCutsceneDummy1", Tag = "GateGuard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- FourthCutsceneDummy2
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
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy2", Tag = "Kulkar"},
			FigureLookAtEntity	{Tag = "AvatarOrc", TargetTag = "GateGuard"},
			FigureLookAtEntity	{Tag = "WindOrc", TargetTag = "GateGuard"},
			FigureLookAtEntity	{Tag = "WhisperOrc", TargetTag = "GateGuard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- FourthCutsceneDummy3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "AvatarOrc"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},
			FigureCutsceneTalkJobSet {Tag = "WindOrc"},
			FigureCutsceneTalkJobSet {Tag = "WhisperOrc"},
			CutsceneSay {TextTag = "FourthCutsceneDummy3", Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- FourthCutsceneDummy4
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
			CutsceneSay {TextTag = "FourthCutsceneDummy4", Tag = "GateGuard"},
			FigureStop {Tag = "AvatarOrc"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- FourthCutsceneDummy5
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
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy5", Tag = "Kulkar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- FourthCutsceneDummy5b
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
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy5b", Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Kamera auf das Tor
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
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "AvatarOrc", Direction = 135},
			FigureLookAtDirection {Tag = "WindOrc", Direction = 135},
			FigureLookAtDirection {Tag = "WhisperOrc", Direction = 135},
			FigureStop {Tag = "AvatarOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Tor öffnet sich
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
			GateSetOpen	{Tag = "InnerGate02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Avatar läuft durch das Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			FigureSimpleWalk {Tag = "AvatarOrc", X = 450.8, Y = 471.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Wind läuft durch das Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "WindOrc", X = 448, Y = 471.8,  },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Whisper läuft durch das Tor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "WhisperOrc", X = 450.8, Y = 469, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21a",
	},
};

State
{
	StateName = "Cutscene21a",
	OnOneTimeEvent	-- Kamera wird gewechselt
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
			CameraTakeAddToTrack {File = "CS_04_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21b",
	},
};

State
{
	StateName = "Cutscene21b",
	OnOneTimeEvent	-- FourthCutsceneDummy6 & Avatar und Helden in Menschengestalt werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "AvatarOrc"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneFigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "AvatarOrc"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			CutsceneFigureTeleportToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WindOrc"},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 135},
			CutsceneFigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WhisperOrc"},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 135},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},
			FigureCutsceneTalkJobSet {Tag = "WindOrc"},
			FigureCutsceneTalkJobSet {Tag = "WhisperOrc"},
			CutsceneSay {TextTag = "FourthCutsceneDummy6", Tag = "Kulkar"},
			--CutsceneFigureWeaponsHide {Tag = "AvatarOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- FourthCutsceneDummy7 & Orcs hocken sich hin
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions = --(Kamera auf Orks und nach 2 Sekunden auf den Avatar in Orkgestalt/2 Takes)
		{ 
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take11", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_04_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy7", Tag = "GateGuard"},
			MapFlagSetTrue {Name = "mf_CS_04_Orcs_Anim_Play"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- FourthCutsceneDummy8
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
			CameraTakeAddToTrack {File = "CS_04_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy8", Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- FourthCutsceneDummy9
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
			CameraTakeAddToTrack {File = "CS_04_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy9", Tag = "Kulkar"},
			FigureStop {Tag = "AvatarOrc"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- FourthCutsceneDummy10
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
			CameraTakeAddToTrack {File = "CS_04_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy10", Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- FourthCutsceneDummy11
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
			CameraTakeAddToTrack {File = "CS_04_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy11", Tag = "Kulkar"},
			FigureStop {Tag = "AvatarOrc"},	
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- FourthCutsceneDummy12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy12", Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "AvatarOrc"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- Kamera auf Avatar und Helden
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
			CameraTakeAddToTrack {File = "CS_04_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureStop {Tag = "AvatarOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- Effekte auf Avatar und Helden
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "AvatarOrc", File = "Effect_Scourge_Spawn"},
			EffectStartAddon1 {Tag = "WindOrc", File = "Effect_Scourge_Spawn"},
			EffectStartAddon1 {Tag = "WhisperOrc", File = "Effect_Scourge_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- Avatar und Helden in Menschengestalt werden sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = TransformationTimer},
		},
		Actions =
		{
			_tRenderList5,
			EntityTimerStart {Name = "et_CStimer"},
		},
		--GotoState = "Cutscene31",
		GotoState = "Cutscene32a",
	},
};

--State
--{
--	StateName = "Cutscene31",
--	OnOneTimeEvent	-- Kamera auf starrende Orks(Kamera zoomt langsam auf die Orks mit leichter Neigung)
--	{
--		Conditions =
--		{
--			--CutsceneSayIsDone {},
--			--FigureIsIdle {Tag = ""},
--			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_04_Take17", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene32a",
--	},
--};

State
{
	StateName = "Cutscene32a",
	OnOneTimeEvent	-- FourthCutsceneDummy13
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32b",
	},
};

State
{
	StateName = "Cutscene32b",
	OnOneTimeEvent	-- FourthCutsceneDummy14 (Kamera Closeup auf Kulkars Gesicht)
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
			CameraTakeAddToTrack {File = "CS_04_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourthCutsceneDummy14", Tag = "Kulkar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	-- Kamera zeigt gesamte Szene, zoomt langsam raus
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
			CameraTakeAddToTrack {File = "CS_04_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- 
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene35",
	},
};


State
{
	StateName = "Cutscene35",
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
			CutsceneFigureWeaponsShow {Tag = "Kulkar"},
			-- Figuren werden gelöscht
			FigureVanish {Tag = "GateGuard"},
			FigureVanish {Tag = "AvatarOrc"},
			FigureVanish {Tag = "WindOrc"},
			FigureVanish {Tag = "WhisperOrc"},
			FigureVanish {Tag = "CS_04_Orc01"},
			FigureVanish {Tag = "CS_04_Orc02"},
			FigureVanish {Tag = "CS_04_Orc03"},
			FigureVanish {Tag = "CS_04_Orc04"},
			FigureVanish {Tag = "CS_04_Orc05"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_EndInnerGate02CS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};