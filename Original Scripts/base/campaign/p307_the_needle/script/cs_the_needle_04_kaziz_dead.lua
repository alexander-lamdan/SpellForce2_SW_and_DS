--************************************************************
--**														**
--**		The Needle - Kaziz Dead							**
--**														**
--************************************************************

--zum Testen diesen Befehl absetzen: MapFlagSetTrue {Name = "mf_Spawn_3rd_Cutscene_Kor"},

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'KORENDFIGHT'",
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
				MapFlagIsTrue	{Name = "mf_Cutscene04"},


				AND
				{
					AvatarFlagIsTrue {Name = "af_P307_Cutscene04"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsAlive {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
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
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 438.917, Y = 522.146},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 268.327},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 442.246, Y = 524.396},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 279.213},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Kor hat die Waffe noch aus der Cutscene davor versteckt
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 433.699, Y = 521.869},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 436.143, Y = 523.925},
			-- Tor geht wieder auf, damit Kor dann rauslaufen kann
			GateSetOpen	{Tag = "Rampart_Gate01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Avatar und Shadowsong gehen zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 433.699, Y = 521.869},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 436.143, Y = 523.925},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: KazizDead01
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
			CutsceneSay	{TextTag = "KazizDead01", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 182.383},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Nightsong: KazizDead02
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
			CutsceneSay	{TextTag = "KazizDead02", Tag = "pl_HumanNightsong"},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 285.516},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: KazizDead03
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
			CutsceneSay	{TextTag = "KazizDead03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03a",
	},
};

State
{
	StateName = "Cutscene03a",
	OnOneTimeEvent	-- Hack
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_KneelDownHack"},
		}
	},
	OnOneTimeEvent	-- Avatar kniet sich vor Kor hin
		{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KneelDownHack", Seconds = 0.6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_04_Kneel_Down_Avatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera kurz auf Shadowsong und Kneelposition für Kor
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_03_DieAnim_Kor_Stop"},
			MapFlagSetTrue {Name = "mf_CS_04_Kneel_Hold_Kor"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 171.497},
			FigureLookAtDirection {Tag = "KorEndFight", Direction = 352.024},
			-- SOUND: Blood Transfusion
			MapFlagSetTrue {Name = "mf_P307_The_Needle_04_SOUND_Play_Blood_Transfusion"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kor steht auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_04_Kneel_Up_Kor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar steht auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_04_Kneel_Up_Avatar"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kor: KazizDead04
	{
		Conditions =
		{
			-- Zeit anpassen an Animation von Kor
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead04", Tag = "KorEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar: KazizDead05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar: KazizDead06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "KazizDead06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kor: KazizDead07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead07", Tag = "KorEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kor: KazizDead08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead08", Tag = "KorEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Avatar: KazizDead09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{

			CutsceneSay	{TextTag = "KazizDead09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Avatar: KazizDead10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Kor: KazizDead11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "KazizDead11", Tag = "KorEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Kor: KazizDead12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "KazizDead12", Tag = "KorEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
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
			-- Waffe von Kor, welche im Boden steckt wird gelöscht
			ObjectVanish {Tag = "Kor_FightingStaff"},
			-- Talkjobs werden aufgehoben
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "KORENDFIGHT"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "KORENDFIGHT"},
			-- Scriptzeug
			AvatarFlagSetTrue {Name = "af_P307_CS04Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};