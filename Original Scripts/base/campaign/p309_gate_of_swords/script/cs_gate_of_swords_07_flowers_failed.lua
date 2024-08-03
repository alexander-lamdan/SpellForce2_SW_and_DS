--************************************************************
--**														**
--**		Gate of Swords	Flowers Failed					**
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
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene07"},
				AND
				{
					MapValueIsGreaterOrEqual {Name = "mv_P309_MardragFlowers", Value = 4},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 154, Y = 507},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanKor", X = 154, Y = 505},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 270},
			FigureTeleport {Tag = "Mardrag", X = 151.458, Y = 506.39},
			FigureLookAtDirection {Tag = "Mardrag", Direction = 270},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanKor"},
			CutsceneFigureWeaponsHide {Tag = "Mardrag"},
			-- Mardrag rennt zum Orakel
			FigureSimpleWalk {Tag = "Mardrag", X = 143.806, Y = 506.39},
			-- OracleSpeaker wird gespawnt
			FigureNpcSpawn	{Tag = "OracleSpeaker", Level = 22, UnitId = 822, X = 124.067, Y = 505.23, Team = "tm_Neutral"},
			-- wird sicher ne Funktion haben
			MapFlagSetTrue	{Name = "mf_P309_CutsceneMadragNeutral"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Mardrag: Mardrag2
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Mardrag"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Mardrag2", Tag = "Mardrag"},
			FigureCutsceneTalkJobSet {Tag = "Mardrag"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Orakel: Orakel10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Orakel10", Tag = "OracleSpeaker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
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
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
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
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanKor"},
			CutsceneFigureWeaponsShow {Tag = "Mardrag"},
			-- OracleSpeaker wird gelöscht
			FigureVanish {Tag = "OracleSpeaker"},
			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P309_GameOver"}
		},
	},
};

