--************************************************************
--**
--**		Winterlight Peak Gates
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Skjardir'",
		"'Worker1'",
		"'Worker2'",
		"'Worker3'",
		"'Worker4'",
		"'Worker5'",
		"'Worker6'",
		"'Worker7'",
		"'Worker8'",
		"'Worker9'",
		"'Worker10'",
		"'Worker11'",
		"'Worker12'",
		"'Worker13'",
		"'Worker14'",
		"'Worker15'",
		"'Worker16'",
		"'Worker17'",
		"'Worker18'",
		"'Worker19'",
		"'Worker20'",
		"'Worker21'",
		"'Worker22'",
		"'Worker23'",
		"'Worker24'",
		"'Worker25'",
		"'Worker26'",
		"'Worker27'",
		"'Worker28'",
		"'Worker29'",
		"'Worker30'",
		"'Worker31'",
		"'Worker32'",
		"'Worker33'",
		"'Worker34'",
		"'Worker35'",
		"'Worker36'",
		"'Worker37'",
		"'Worker38'",
		"'Worker39'",
		"'Worker40'",
	}
}

State
{
	StateName = "INIT",OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_02_Beast01"},
			FigureVanish {Tag = "Dummy_CS_02_Beast02"},
			FigureVanish {Tag = "Dummy_CS_02_Beast03"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_no_flag_here"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P401_StartGateCS"},
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
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "Skjardir", X = 119.479, Y = 139.099},
			FigureLookAtDirection {Tag = "Skjardir", Direction = 350},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 117.6, Y = 133},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 160},
			-- Beasts werden gespawnt
			MapFlagSetTrue {Name = "mf_P401_CS_Beasts_Spawn"},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "Skjardir"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- 
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
			FigureSimpleRun {Tag = "CS_02_Beast02", X = 129.1, Y = 82.5},
		},
		GotoState = "Cutscene01",
	},
};
			
State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Tore schließen sich & Beasts kommen angerannt
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
			GateSetClosed {Tag = "MainGate1"},
			GateSetClosed {Tag = "MainGate2"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_WP_stonegate_close", X = 128, Y = 10, Z = 81, MaxRange = 100, FallOffRange = 100},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_WP_stonegate_close", X = 149, Y = 10, Z = 105, MaxRange = 100, FallOffRange = 100},
			FigureSimpleRun {Tag = "CS_02_Beast01", X = 131.6, Y = 75.6},
			FigureSimpleRun {Tag = "CS_02_Beast03", X = 135.8, Y = 79.8},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Skjadir: Skjadir05
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
			CutsceneSay {TextTag = "Skjadir05", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Skjadir: Skjadir06
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
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Skjadir06", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Skjadir: Skjadir07
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
			CutsceneSay {TextTag = "Skjadir07", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Skjadir: Skjadir08
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
			CutsceneSay {TextTag = "Skjadir08", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Skjadir: Skjadir09
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
			CutsceneSay {TextTag = "Skjadir09", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Skjadir: Skjadir10
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
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Skjadir10", Tag = "Skjardir"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
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
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
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
			CutsceneFigureWeaponsShow {Tag = "Skjardir"},
			CutsceneFigureWeaponsShow {Tag = "pl_HUmanAvatar"},
			-- Beasts werden gelöscht
			FigureVanish {Tag = "CS_02_Beast01"},
			FigureVanish {Tag = "CS_02_Beast02"},
			FigureVanish {Tag = "CS_02_Beast03"},
			-- Helden werden zum Avatar teleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 112, Y = 148.4},
			FigureTeleportToEntity {Tag = "pl_HumanHeroWind", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroWhisper", TargetTag = "pl_HumanAvatar"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_P401_EndGateCS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};