--************************************************************
--**														**
--**		Westguard Expansion Fountain					**
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
				MapFlagIsTrue	{Name = "mf_Cutscene04"},
				MapFlagIsTrue	{Name = "mf_P300_Cutscene_Expansion_Fountain"},
			},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Ausruferin: CSBuild3
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CSBuild3", Tag = "Ausruferin"},
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
			AvatarFlagSetTrue	{Name = "af_P300_CutsceneFountainFinish"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
		},
	},
};


