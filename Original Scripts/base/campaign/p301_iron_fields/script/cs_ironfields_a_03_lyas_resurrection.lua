--************************************************************
--**														**
--**		Iron Fields A Lyas Ressurection					**
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
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Avatar, Bor und Lya
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA03"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P301_CutsceneLyasAlive"},
					MapFlagIsFalse {Name = "mf_P301_CutsceeneBattlefieldStarted"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 271.431, Y = 411.46},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 258.587},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 269.587, Y = 409.41},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 183.919},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 268.969, Y = 412.114},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 52.3198},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "Pl_HumanHeroLya"},	
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "Pl_HumanHeroLya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Lya1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Lya1", Tag = "pl_HumanHeroLya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Bor9
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take02", Tag = "default", TargetTag = "default"}, -- 2s
			CameraTakeAddToTrack {File = "CS_A_03_Take02a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Bor9", Tag = "pl_HumanHeroBor"},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 17.942},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 327.342},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Lya2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Lya2", Tag = "pl_HumanHeroLya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Bor10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Bor10", Tag = "pl_HumanHeroBor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Lya3
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
			CutsceneSay {TextTag = "Lya3", Tag = "pl_HumanHeroLya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Bor11
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
			CutsceneSay {TextTag = "Bor11", Tag = "pl_HumanHeroBor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Lya4
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
			-- die Takes kommen wenn Lya sagt das dort beim Haus die Kiste steht
			CameraTakeAddToTrack {File = "CS_A_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_A_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Lya4", Tag = "pl_HumanHeroLya"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 258.587},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- kurze Pause nach CutsceneSay
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
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "Pl_HumanHeroLya"},		
			-- Scriptingkram für die Karte
			QuestSetSolved {Quest = "ReviveLya"},
			QuestSetSolved {Quest = "IronFieldsPart1Lya"},
			QuestSetActive {Quest = "IronFieldsPart2WarnFortress"},
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasAliveShown"},
			TutorialStateClear	{TutorialState = FreezeIsoCameraPosition},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};