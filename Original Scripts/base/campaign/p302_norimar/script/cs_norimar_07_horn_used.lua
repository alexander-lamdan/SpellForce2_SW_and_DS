--************************************************************
--**														**
--**		Norimar Horn Used								**
--**														**
--************************************************************

State
{
	StateName = "INIT",
	OnOneTimeEvent	-- Kamera 1
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene07"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P302_Horn_Activated"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kamera 2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.9},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Kamera 3
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take03", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_07_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 12},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Falkmar wird zurück zum Baron teleportiert
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
		},
	},
};

