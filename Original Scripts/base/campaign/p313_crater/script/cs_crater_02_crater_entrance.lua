--************************************************************
--**														**
--**		Crater Crater Entrance							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'pl_HumanHeroJared'",
		"'pl_HumanHeroShae'",
		"'pl_HumanHeroMordecay'",
		"'Naugron'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf nicht vorhandenen Knochenturm
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					AvatarFlagIsTrue{Name = "af_P313_Cutscene02Begin"},
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
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 167.224, Y = 163.603},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 166.781, Y = 160.049},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 169.639, Y = 162.77},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 165.355, Y = 161.809},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 163.884, Y = 163.027},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 168.495, Y = 160.636},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 180},			
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroJared"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroShae"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: WhereIsMirror01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WhereIsMirror01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Malacays Stimme: WhereIsMirror02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WhereIsMirror02", Tag = "Malacay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Malacays Stimme: WhereIsMirror03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WhereIsMirror03", Tag = "Malacay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Bor: WhereIsMirror04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WhereIsMirror04", Tag = "pl_HumanHeroBor"},
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
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			FigureStop {Tag = "pl_HumanHeroJared"},
			FigureStop {Tag = "pl_HumanHeroShae"},
			FigureStop {Tag = "pl_HumanHeroMordecay"},	
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue{Name = "af_P313_Cutscene02Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};