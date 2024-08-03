--************************************************************
--**														**
--**		Underhall Windhammer							**
--**														**
--************************************************************

-- zum Testen: MapFlagIsTrue {Name = "mf_JandrimsVaterSpawn"},

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Mine_Ghost30'",
		"'Mine_Ghost31'",
		"'Mine_Ghost32'",
		"'Mine_Ghost33'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamerafahrt zu Niethalfs Herz
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					MapTimerIsElapsed	{Name = "mt_CutsceneWindhammerGhostTimer", Seconds = 2},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsAlive {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "Windhammer_Ghost"},
					FigureIsNotInCombat {Tag = "Jandrim"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Crystal Play
			MapFlagSetTrue {Name = "mf_P305_Underhall_02_SOUND_Play_Crystal"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Windhammer_Ghost: WindhammerGhost01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WindhammerGhost01", Tag = "Windhammer_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Windhammer_Ghost: WindhammerGhost02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WindhammerGhost02", Tag = "Windhammer_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Windhammer_Ghost: WindhammerGhost03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WindhammerGhost03", Tag = "Windhammer_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Windhammer_Ghost: WindhammerGhost04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "WindhammerGhost04", Tag = "Windhammer_Ghost"},
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
			-- SOUND: 
			MapFlagSetTrue {Name = "mf_P305_Underhall_02_SOUND_Stop_Crystal"},
			-- Scriptingkram
			MapFlagSetTrue	{Name = "mf_CutsceneWindhammerGhostEnded"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};