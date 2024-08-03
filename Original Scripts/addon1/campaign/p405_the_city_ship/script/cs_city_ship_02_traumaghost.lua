--************************************************************
--**
--**		City Ship Traumaghost
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Urgi'",
	}
}

local _tRenderListWithGhost = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderListWithGhost.tModFuncs =
{
	Add =
	{
		"'Urgi'",
		"'CS_02_Ghost'",
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
			FigureVanish {Tag = "Dummy_CS_02_Urgi01"},
			FigureVanish {Tag = "Dummy_CS_02_Urgi02"},
			FigureVanish {Tag = "Dummy_CS_02_Urgi03"},
			FigureVanish {Tag = "Dummy_CS_02_Urgi04"},
			FigureVanish {Tag = "Dummy_CS_02_Ghost01"},
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
					MapFlagIsTrue {Name = "mf_CS02Start"},
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
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 382.879, Y = 309.58},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			CutsceneFigureTeleport {Tag = "Urgi", X = 384.485, Y = 309.648},
			FigureLookAtDirection {Tag = "Urgi", Direction = 175},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Urgi"},
			-- Urgi rennt los
			FigureSimpleRun {Tag = "Urgi", X = 389.754, Y = 314.656},
			-- Geist spawnt
			MapFlagSetTrue{Name = "mf_CS_02_Ghost_Spawn"},
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
	OnOneTimeEvent	-- CS02Urgi01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Urgi"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			_tRenderList,
			FigureLookAtDirection {Tag = "Urgi", Direction = 130},
			CutsceneSay {TextTag = "CS02Urgi01", Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Urgi rennt weiter
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
			FigureSimpleRun {Tag = "Urgi", X = 383.867, Y = 318.287},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- CS02Urgi11
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Urgi"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "Urgi", Direction = 180},
			CutsceneSay {TextTag = "CS02Urgi11", Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Urgi rennt weiter
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
			FigureSimpleRun {Tag = "Urgi", X = 376.93, Y = 317.309},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- CS02Urgi12
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Urgi"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CS02Urgi12", Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "Urgi"},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar tritt heran
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 376.447, Y = 315.614},
			FigureLookAtDirection {Tag = "Urgi", Direction = 50},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Geist fliegt los
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
			FigureSimpleRun {Tag = "CS_02_Ghost", X = 384.724, Y = 319.01},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- CS02Traumaghost03 & Geist wird sichtbar
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
			_tRenderListWithGhost,
			CutsceneSay {TextTag = "CS02Traumaghost03", Tag = "CS_02_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- CS02Urgi04 & Geist wird gelöscht
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS02Urgi04", Tag = "Urgi"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 160},
			FigureCutsceneTalkJobSet {Tag = "Urgi"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureVanish {Tag = "CS_02_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- CS02Urgi05
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
			CutsceneSay {TextTag = "CS02Urgi05", Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- CS02Urgi06
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
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS02Urgi06", Tag = "Urgi"},
			FigureLookAtDirection {Tag = "Urgi", Direction = 5},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- CS02Urgi07
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
			CutsceneSay {TextTag = "CS02Urgi07", Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- CS02Urgi08
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
			CutsceneSay {TextTag = "CS02Urgi08", Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		--GotoState = "Cutscene14",
		GotoState = "Cutscene15",
	},
};

--State  --> RAUSGENOMMEN WEIL FALSCHER SPRECHER
--{
--	StateName = "Cutscene14",
--	OnOneTimeEvent	-- CS02Avatar09
--	{
--		Conditions =
--		{
--			CutsceneSayIsDone {},
--			--FigureIsIdle {Tag = "pl_HumanAvatar"},
--			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
--			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			CutsceneSay {TextTag = "CS02Avatar09", Tag = "pl_HumanAvatar"},
--			FigureLookAtDirection {Tag = "Urgi", Direction = 5},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene15",
--	},
--};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- CS02Urgi10
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
			CutsceneSay {TextTag = "CS02Urgi10", Tag = "Urgi"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
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
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
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
			CutsceneFigureWeaponsShow {Tag = "Urgi"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS02Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};