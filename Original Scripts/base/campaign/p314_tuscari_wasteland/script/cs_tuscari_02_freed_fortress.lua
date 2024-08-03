--************************************************************
--**														**
--**		Tuscari Wasteland Freed Fortress				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Eisenfuerst'",
		"'Torshak'",
		"'Reetho'",
		-- Guards werden in der Cutscene gespawnt
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P314_Cutscene02Begin"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 363.099, Y = 147.027},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 120},
			FigureTeleport {Tag = "Eisenfuerst", X = 364.6, Y = 146.2},
			FigureLookAtDirection {Tag = "Eisenfuerst", Direction = 135},
			FigureTeleport {Tag = "Reetho", X = 369.6, Y = 151.2},
			FigureLookAtDirection {Tag = "Reetho", Direction = 315},
			-- Guards die Reetho heranführen werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_Guards_Spawn"},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Eisenfuerst"},
			FigureCutsceneTalkJobSet {Tag = "Reetho"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Eisenfuerst"},
			CutsceneFigureWeaponsHide {Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Eisenfürst: CitadelFree01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CitadelFree01", Tag = "Eisenfuerst"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Reetho und seine zwei Bewacher kommen angelaufen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Reetho", X = 366.8, Y = 148.4},
			FigureSimpleWalk {Tag = "CS_02_OrcGuard01", X = 366.8, Y = 149.8},
			FigureSimpleWalk {Tag = "CS_02_OrcGuard02", X = 368.2, Y = 148.4},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Eisenfürst:  CitadelFree02
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Reetho"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CitadelFree02", Tag = "Eisenfuerst"},
			-- Talkjob von Reetho
			FigureCutsceneTalkJobSet {Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Reetho: CitadelFree03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree03", Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Reetho: CitadelFree04, Kamerazoom auf Reetho
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree04", Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Eisenfürst: CitadelFree05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree05", Tag = "Eisenfuerst"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Reetho: CitadelFree06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree06", Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Reetho: CitadelFree07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CitadelFree07", Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamerazoom auf Landschaft und Büsche, Geräusche werden abgespielt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Spiders
			MapFlagSetTrue {Name = "mf_P314_Tuscari_Wasteland_04_SOUND_Play_Spiders"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Reetho: CitadelFree08
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree08", Tag = "Reetho"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Eisenfürst: CitadelFree09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree09", Tag = "Eisenfuerst"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Eisenfürst: CitadelFree10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CitadelFree10", Tag = "Eisenfuerst"},
			-- Eisenfürst wird auf den Avatar ausgerichtet
			FigureLookAtEntity	{Tag = "Eisenfuerst", TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
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
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
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
			FigureStop {Tag = "Eisenfuerst"},
			FigureStop {Tag = "Sorok"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Eisenfuerst"},
			CutsceneFigureWeaponsShow {Tag = "Reetho"},
			-- Helden werden zum Avatar teleportiert
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 361, Y = 150},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 360, Y = 152},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 362, Y = 154},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 360, Y = 151},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 361, Y = 153},
			-- Sorok wird außerhalb des Käfigs teleportiert
			FigureTeleport {Tag = "Sorok", X = 367, Y = 184},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P314_CS02Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};