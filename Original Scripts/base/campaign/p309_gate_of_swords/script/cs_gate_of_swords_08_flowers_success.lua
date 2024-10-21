--************************************************************
--**														**
--**		Gate of Swords Flowers Succes					**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanKor'",
		-- OracleSpeaker wird nicht gerendert, geht nur darum das der Effekt, der keine Unit ist, spricht
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Orakel, Avatar und Kor
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene08"},
				AND
				{
					QuestIsActive {Quest = "FindFlowers"},
					MapValueIsGreaterOrEqual {Name = "mv_P309_PlayerFlowers", Value = 4},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
				AND
				{
					FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Oracle", Range = 12},
					QuestIsActive {Quest = "FindFlowers"},
					FigureIsDead {Tag = "Mardrag"},					
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
			CameraTakeAddToTrack {File = "CS_08_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 144.188, Y = 506.32},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanKor", X = 144.189, Y = 508.208},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 285.516},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanKor"},
			-- Flags für Mardrag
			MapFlagSetTrue {Name = "mf_P309_CutsceneBackToOracleBegin"},
			MapFlagSetTrue	{Name = "mf_P309_CutsceneMadragNeutral"},
			-- OracleSpeaker wird gespawnt
			FigureNpcSpawn	{Tag = "OracleSpeaker", Level = 22, UnitId = 822, X = 124.067, Y = 505.23, Team = "tm_Neutral"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Orakel: Orakel4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Orakel4", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar: Avatar7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar7", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Orakel: Orakel5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Orakel5", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Orakel: Orakel6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take04", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_08_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Orakel6", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Orakel: Orakel7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Orakel7", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Orakel: Orakel8
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Orakel8", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Orakel: Orakel9
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Orakel9", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
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
			-- OracleSpeaker wird gelöscht
			FigureVanish {Tag = "OracleSpeaker"},
			-- Wieder was für Mardrag
			AvatarFlagSetTrue {Name = "af_P309_CutsceneBackToOracleEnd"},
			-- Scriptingkram für die Karte
			QuestSetSolved {Quest = "FindFlowers"},
			QuestSetSolved {Quest = "GoSPart3Oracle"},
			QuestSetActive {Quest = "GoSPart4Fireforge"},
			QuestSetActive {Quest = "ToUramGor"},
			PlayerTravelEnable {},
			PortalEnable {Tag = "UramGor"},
			--AvatarFlagSetTrue {Name = "af_P309_Pfuschen"}
			
			-- Die übrig gebliebenen Pflanzen gehen jetzt nach Hause nach Stobokor (oder so)
			ObjectVanish {Tag = "Kackeblume1"},
			ObjectVanish {Tag = "Kackeblume2"},
			ObjectVanish {Tag = "Kackeblume3"},
			ObjectVanish {Tag = "Kackeblume4"},
			ObjectVanish {Tag = "Kackeblume5"},
			ObjectVanish {Tag = "Kackeblume6"},
			ObjectVanish {Tag = "Kackeblume7"},
			ObjectVanish {Tag = "Kackeblume8"},
			-- Dem SPieler sein Blumen wegnehmen
			AvatarItemMiscTake	{Player = "pl_HumanAvatar", ItemId = 75, Amount = 969},
		},
		GotoState = "CutsceneEnd",
	},
	
};

State
{
	StateName = "CutsceneEnd",
};