--************************************************************
--**														**
--**		Golden Fields Part I Jared						**
--**														**
--************************************************************

-- zum Testen Jared mit der Flag mf_KillJared töten
-- zum Testen Jared wieder spawnen lassen mf_JaredRespawn

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Asha'",
		"'Jared'",
	}
}

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KillJared"},
		},
		Actions =
		{
			FigureVanish {Tag = "Jared"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Avatar kniet sich hin
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_CutsceneA03"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P304_Cutscene03Start"},
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
			CameraTakeAddToTrack {File = "CS_A_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Hier müsste ne Blende hin
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 330.463, Y = 378.294},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 225.355},
			FigureTeleport {Tag = "Asha", X = 331.051, Y = 380.944},
			FigureLookAtDirection {Tag = "Asha", Direction = 4},
			-- Jared wird in seinem Script neu gespawnt an die Position und spielt die Animation ab
			FigureTeleport {Tag = "Jared", X = 326.175, Y = 382.931},
			FigureLookAtDirection {Tag = "Jared", Direction = 35},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Asha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Avatar und Asha laufen zu Jared
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 327.944, Y = 380.875},
			FigureSimpleWalk {Tag = "Asha", X = 327.757, Y = 384.148},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: BloodCS_01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "BloodCS_01", Tag = "pl_HumanAvatar"},
			-- Teleport Avatar, da er ja laut Vis ganz woanders steht, obwohl er laut GD richtig steht
			FigureTeleport {Tag = "pl_HumanAvatar", X = 327.944, Y = 380.875},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 225.355},
			-- Teleport und Ausrichten von Asha, sonst guckt sie in die falsche Richtung und läuft noch
			FigureTeleport {Tag = "Asha", X = 327.757, Y = 384.148},
			FigureLookAtDirection {Tag = "Asha", Direction = 4},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar kniet nieder
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_KneelDownHack"},
		},
	},
	OnOneTimeEvent	-- Avatar hockt sich hin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KneelDownHack", Seconds = 0.6},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_KneelDownHack"},
			-- Avatar hockt sich hin
			MapFlagSetTrue {Name = "mf_CS_A_03_Kneel_Down_Avatar"},
			-- Talkjob & Ausrichten von Asha
			FigureLookAtDirection {Tag = "Asha", Direction = 4},
			FigureCutsceneTalkJobSet {Tag = "Asha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Kamera auf Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Blood Transfusion
			MapFlagSetTrue {Name = "mf_P304_Golden_Fields_A03_SOUND_Play_Blood_Transfusion"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02b",
	},
};

State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Jared Anim abspielen zum Aufstehen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P304_Jared_Died_Anim_Stop"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02c",
	},
};

State
{
	StateName = "Cutscene02c",
	OnOneTimeEvent	-- Avatar steht auf, und Kamera auf Jared und Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Avatar steht auf
			MapFlagSetTrue {Name = "mf_CS_A_03_Kneel_Up_Avatar"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Jared: BloodCS_02 (nach 1.9 Sekunden wegen Anim von Jared, die dauert 1.83s)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.9},
		},
		Actions =
		{
			CutsceneSay {TextTag = "BloodCS_02", Tag = "Jared"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Asha: BloodCS_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			CutsceneSay {TextTag = "BloodCS_03", Tag = "Asha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Jared: BloodCS_04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BloodCS_04", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: BloodCS_05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "BloodCS_05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Jared: BloodCS_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BloodCS_06", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Asha: BloodCS_07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BloodCS_07", Tag = "Asha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Jared: BloodCS_08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BloodCS_08", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
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
			-- Talkjobs werden beendet
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Jared"},
			FigureStop {Tag = "Asha"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Asha"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P304_CS03Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};