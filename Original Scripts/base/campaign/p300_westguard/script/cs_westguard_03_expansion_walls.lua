--************************************************************
--**														**
--**		Westguard Expansion Walls						**
--**														**
--************************************************************

State
{
	StateName = "INIT",
	OnOneTimeEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P300_CutsceneStatueFinish"},
					MapFlagIsTrue	{Name = "mf_P300_Cutscene_Expansion_Walls"},
				},
			},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Ausruferin: CSBuild2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CSBuild2", Tag = "Ausruferin"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			AvatarFlagSetTrue	{Name = "af_P300_CutsceneCityWallsFinish"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
		},
	},
};


