--************************************************************
--**														**
--**		Dun Mora Io										**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Io'",
		"'Sansha'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Io und Avatar von vorn
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Sansha", Range = 7},
					MapFlagIsTrue	{Name = "mf_DialogSanshaPart1Done"}, --Dialog mit Sansha muß gefuehrt worden sein, direkt danach kann CS starten
					AvatarIsNotTalking {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					GameInterfaceIsVisible	{},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take00", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 318.508, Y = 377.574},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "Io", X = 335.747, Y = 381.917},
			FigureLookAtDirection {Tag = "Io", Direction = 325.623},
			FigureTeleport {Tag = "Sansha", X = 316.014, Y = 377.574},
			FigureLookAtDirection {Tag = "Sansha", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Io"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Io"},
			CutsceneFigureWeaponsHide {Tag = "Sansha"},
			-- IdleGoHome für Io wird deaktiviert(nehme ich an)
			MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"},
			--Aufdecken der Geister
			FogOfWarRevealAtEntity	{Tag = "GhostExhauster01", Range = 4, Height = default, FogOfWarId = 01},
			FogOfWarRevealAtEntity	{Tag = "GhostExhauster02", Range = 4, Height = default, FogOfWarId = 02},
			FogOfWarRevealAtEntity	{Tag = "GhostExhauster03", Range = 4, Height = default, FogOfWarId = 03},
			FogOfWarRevealAtEntity	{Tag = "GhostExhauster04", Range = 4, Height = default, FogOfWarId = 04},
			FogOfWarRevealAtEntity	{Tag = "GhostExhauster05", Range = 4, Height = default, FogOfWarId = 05},
			-- Avatar läuft zu Io
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 333.662, Y = 379.709},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar7
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar7", Tag = "pl_HumanAvatar"},
			-- Ausrichten des Avatar auf Io
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135.837},			
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureVanish	{Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Io: Io5
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
			CutsceneSay {TextTag = "Io5", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Avatar8
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
			CutsceneSay {TextTag = "Avatar8", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: Avatar9
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
			CutsceneSay {TextTag = "Avatar9", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Avatar10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Io
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Io: Io6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Io6", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar: Avatar11
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
			CutsceneSay {TextTag = "Avatar11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Io: Io7
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
			CutsceneSay {TextTag = "Io7", Tag = "Io"},
			-- Shae als Figur wird gelöscht, Shae als Held hinzugefügt
			PlayerHeroAdd	{Player = "default", HeroId = 011},
			NoSpawnEffect	{Spawn = FigureHeroSpawn	{Player = "default", Tag = "HeroShae", X = 334.6, Y = 378, Direction = 175},},
			--FigureHeroSpawn	{Player = "default", Tag = "HeroShae", X = 317.8, Y = 379.4, Direction = 60},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
	
};

State
{
	StateName = "Cutscene09",
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
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
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
			FigureStop {Tag = "Io"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Io"},
			CutsceneFigureWeaponsShow {Tag = "Sansha"},
			-- Helden werden auf Avatar ausgerichtet
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroJared", TargetTag = "pl_HumanAvatar"},			
			FigureLookAtEntity	{Tag = "pl_HumanHeroShae", TargetTag = "pl_HumanAvatar"},
			-- Flag für Io, damit sie losgeht
			EntityFlagSetTrue {Name = "ef_endstate"},
			-- IdleGoHome für Io wird deaktiviert(nehme ich an)
			MapFlagSetFalse {Name = "mf_P306_IoNoIdleGoHome"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_CS_IoDone"},
			MapTimerStart {Name = "mt_WelcomeShae"}, --fuer Outcries der Helden
			--QuestSetSolved	{Player = "default", Quest = "SendIo"}, 
		},
	},
	OnOneTimeEvent	-- Io geht zum Portal 
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_endstate"},
		},
		Actions =
		{
			--FigureForcedRun	{Tag = "Io", X = 420, Y = 418},
			--MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"},
			MapFlagSetTrue {Name = "mf_IoGo"},
		},
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};