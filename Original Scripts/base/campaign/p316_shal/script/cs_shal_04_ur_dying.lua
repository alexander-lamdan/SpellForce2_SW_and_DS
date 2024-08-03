--************************************************************
--**														**
--**		Shal Ur Dying									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Ur_Dragon'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Avatar geht zu Ur
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Cutscene04"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P316_Intro_Done"},
					MapFlagIsTrue{Name = "mf_UrGuardsDeath"},
					FigureIsAlive {Tag = "pl_HumanHeroBor"},
					FigureIsAlive {Tag = "pl_HumanHeroLya"},
					FigureIsAlive {Tag = "pl_HumanHeroJared"},
					FigureIsAlive {Tag = "pl_HumanHeroShae"},
					FigureIsAlive {Tag = "pl_HumanHeroMordecay"},
					FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 102.2, Y = 131.6},
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
			DialogSetDisabled	{Tag = "Ur"},
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 102.035, Y = 128.782},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 215.615},
			FigureTeleport {Tag = "Ur_Dragon", X = 103.916, Y = 142.28},
			FigureLookAtDirection {Tag = "Ur_Dragon", Direction = 279.786},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ur_Dragon"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			-- Avatar geht zu Ur
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 99.189, Y = 134.795},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: UrDialog01, Ausrichten und Talkjob Avatar
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UrDialog01", Tag = "pl_HumanAvatar"},
			-- Ausrichten des Avatar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 215},
			-- Talkjob Avatar
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Ur: UrDialog02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UrDialog02", Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Ur: UrDialog03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UrDialog03", Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Ur: UrDialog04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "UrDialog04", Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Ur: UrDialog05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UrDialog05", Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Ur: UrDialog06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UrDialog06", Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamerazoom weg von Ur
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Ur stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureKill {Tag = "Ur_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
	
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera auf Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EntityTimerStart {Name = "et_CStimer"},
			
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Ur wird gelöscht, Objekt(Ur Dead) wird gespawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			-- Ur_Dragon wird gelöscht
			FigureVanish {Tag = "Ur_Dragon"},
			-- Ur als Objekt wird gespawnt
			ObjectSpawn	{ObjectId = 2036, X = 103.916, Y = 142.28, Direction = 279.786, Tag = "Ur_Dead"},
			ObjectSpawn	{ObjectId = 547, X = 95, Y = 142.5, Direction = 0, Tag = "Ur_DeadDecal"},
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
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_P316_Ur_Is_Dead"},
			MapTimerStart	{Name = "mt_CutszeneEndUr"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};






