--************************************************************
--**														**
--**		Norimar Meet Guard								**
--**														**
--************************************************************


-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Rottgar'",
		"'RotGuy1'",
		"'RotGuy2'",
		"'RotGuy3'",
		"'RotGuy4'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Avatar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					OR
					{
						FigureIsInRange	{Range = 10, X = 463, Y = 158, Tag = "pl_HumanAvatar"},
    					FigureIsInRange	{Range = 10, X = 463, Y = 158, Tag = "pl_HumanNightSong"},
    					FigureIsInRange	{Range = 10, X = 463, Y = 158, Tag = "pl_HumanHeroBor"},
    					FigureIsInRange	{Range = 10, X = 463, Y = 158, Tag = "pl_HumanHeroLya"},
    				},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 449.748, Y = 158.902},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "Rottgar", X = 441.944, Y = 158.902},
			FigureLookAtDirection {Tag = "Rottgar", Direction = 90},
			FigureTeleport {Tag = "RotGuy1", X = 440.9, Y = 160.482},
			FigureLookAtDirection {Tag = "RotGuy1", Direction = 77.9679},
			FigureTeleport {Tag = "RotGuy2", X = 440.691, Y = 157.752},
			FigureLookAtDirection {Tag = "RotGuy2", Direction = 100.886},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Rottgar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Rottgar"},
			-- Avatar geht zu Rottgar
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 444.817, Y = 158.902},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar3
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Rottgar: Rottgar1
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
			CutsceneSay {TextTag = "Rottgar1", Tag = "Rottgar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Rottgar: Rottgar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Rottgar2", Tag = "Rottgar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Rottgar: Rottgar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Rottgar3", Tag = "Rottgar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kamera zeigt einen Feuerturm
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Rottgar: Rottgar4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Rottgar4", Tag = "Rottgar"},
		},
	},
	OnOneTimeEvent	-- Kamera zurück auf Rottgar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
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
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
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
			FigureStop {Tag = "Rottgar"},			
			-- Wepaon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Rottgar"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_CS_norimar_meet_guard_end"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};