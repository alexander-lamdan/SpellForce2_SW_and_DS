--************************************************************
--**														**
--**		Gate of Swords Oracle							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanKor'",
		"'Mardrag'",
		-- OracleSpeaker wird nicht gerendert, geht nur darum das der Effekt, der keine Unit ist, spricht
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Avatar und Kor und in der Ferne das Orakel
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene06"},
				AND
				{
					FigureIsInRange	{Range = 10, X = 155, Y = 504, Tag = "pl_HumanAvatar"},
					QuestIsActive {Quest = "TravelToOracleMountain"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
				AND
				{
					FigureIsInRange	{Range = 10, X = 155, Y = 504, Tag = "pl_HumanKor"},
					QuestIsActive {Quest = "TravelToOracleMountain"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanKor"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 154, Y = 507},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanKor", X = 154, Y = 505},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 270},
			FigureTeleport {Tag = "Mardrag", X = 143.078, Y = 502.47},
			FigureLookAtDirection {Tag = "Mardrag", Direction = 137.51},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Mardrag"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanKor"},
			CutsceneFigureWeaponsHide {Tag = "Mardrag"},
			-- OracleSpeaker wird gespawnt
			FigureNpcSpawn	{Tag = "OracleSpeaker", Level = 22, UnitId = 822, X = 124.067, Y = 505.23, Team = "tm_Neutral"},			
			-- hat sicher irgend ne Funktion
			MapFlagSetTrue {Name = "mf_P309_CutsceneOracleBegin"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kor: Kor7
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor7", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar und Kor gehen zum Orakel
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_06_Take03", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_06_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 147, Y = 507},
			FigureSimpleWalk {Tag = "pl_HumanKor", X = 148, Y = 505},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kor: Kor8
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.5},
		},
		Actions =
		{
			-- Teleport der Akteure, falls sie nicht rechtzeitig am Ziel sind
			FigureTeleport {Tag = "pl_HumanAvatar", X = 147, Y = 507},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanKor", X = 148, Y = 505},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 270},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},			
			CutsceneSay {TextTag = "Kor8", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Mardrag: Mardrag1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Mardrag1", Tag = "Mardrag"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kor: Kor11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Kor11", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Orakel: Orakel2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Orakel2", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Orakel: Orakel3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Orakel3", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Mardrag legt einen Frühstart hin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Mardrag", X = 173.078, Y = 502.47},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
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
			FigureStop {Tag = "pl_HumanKor"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanKor"},
			CutsceneFigureWeaponsShow {Tag = "Mardrag"},			
			-- OracleSpeaker wird gelöscht
			FigureVanish {Tag = "OracleSpeaker"},
			-- Mardrag rennt los um die Blumen zu holen
			MapFlagSetTrue {Name = "mf_P309_CutsceneOracleMid"},
			-- Scriptingkram für die Karte			
			AvatarFlagSetTrue {Name = "af_P309_CutsceneOracleEnd"},
			QuestSetSolved {Quest = "TravelToOracleMountain"},
			QuestSetActive {Quest = "FindFlowers"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};