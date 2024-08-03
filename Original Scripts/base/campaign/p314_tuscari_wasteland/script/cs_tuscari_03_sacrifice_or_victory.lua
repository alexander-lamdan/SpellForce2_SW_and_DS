--************************************************************
--**														**
--**		Tuscari Wasteland Sacrifice or Victory			**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Sorok"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Aramin'",
		"'GriffonC01'",
		"'GriffonC02'",
		"'GriffonC03'",
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
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P314_Cutscene03Begin"},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Sorok", X = 283.766, Y = 570.401},
			FigureLookAtDirection {Tag = "Sorok", Direction = 74.485},
			FigureTeleport {Tag = "Aramin", X = 629.604, Y = 504.189},
			FigureLookAtDirection {Tag = "Aramin", Direction = 287.808},
			FigureTeleport {Tag = "GriffonC01", X = 414.4, Y = 620},
			FigureLookAtDirection {Tag = "GriffonC01", Direction = 0},
			FigureTeleport {Tag = "GriffonC02", X = 410.2, Y = 619},
			FigureLookAtDirection {Tag = "GriffonC02", Direction = 0},
			FigureTeleport {Tag = "GriffonC03", X = 407.4, Y = 621},
			FigureLookAtDirection {Tag = "GriffonC03", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Sorok"},
			FigureCutsceneTalkJobSet {Tag = "Aramin"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "Aramin"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Aramin: ShygallaDead01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ShygallaDead01", Tag = "Aramin"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Kamerafahrt auf die Greifen zu, Greifen fliegen los
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Greifen fliegen los
			FigureRun {Tag = "GriffonC01", X = 414.4, Y = 550},
			FigureRun {Tag = "GriffonC02", X = 410.2, Y = 550},
			FigureRun {Tag = "GriffonC03", X = 407.4, Y = 550},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Sorok: ShygallaDead02
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShygallaDead02", Tag = "Sorok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Sorok: ShygallaDead03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ShygallaDead03", Tag = "Sorok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
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
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
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
			FigureStop {Tag = "Sorok"},
			FigureStop {Tag = "Aramin"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "Aramin"},
			-- Akteure werden zurück an ihre Positionen aus dem Editor teleportiert
			CutsceneFigureTeleportBack	{Tag = "Sorok"},
			CutsceneFigureTeleportBack	{Tag = "GriffonC01"},
			CutsceneFigureTeleportBack	{Tag = "GriffonC02"},
			CutsceneFigureTeleportBack	{Tag = "GriffonC03"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P314_CS03Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};