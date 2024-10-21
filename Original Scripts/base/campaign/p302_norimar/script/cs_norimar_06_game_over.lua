--************************************************************
--**														**
--**		Norimar Game Over								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"''",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene06"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P302_GameOver_Cutscene"},
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
			CameraTakeAddToTrack {File = "CS_06_Take01", Tag = "default", TargetTag = "default"}, -- 8s
			CameraTakeAddToTrack {File = "CS_06_Take02", Tag = "default", TargetTag = "default"}, -- 8s
			CameraTrackPlay {},
			-- Spawn der Einheiten
			MapFlagSetTrue {Name = "mf_CS_06_Darkelf_Group_Spawn"},
			-- Dunkelelfen laufen los
			MapFlagSetTrue {Name = "mf_CS_06_Darkelf_Goto"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kommentar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_06_TeamA_Spawn"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Spawn Team B(in der Stadt)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 11},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_06_TeamB_Spawn"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Spawn Team C(in der Stadt)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 12},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_06_TeamC_Spawn"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Spawn Team D(in der Stadt)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 13},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_06_TeamD_Spawn"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Spawn Team E(in der Stadt)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 14},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_06_TeamE_Spawn"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Meshs werden getauscht, gelöscht, gespawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
		},
		GotoState = "Cutscene07",
	},
};


State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamerafahrt über die Stadt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 16},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take03", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_06_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 20},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_P302_GameOver_Cutscene_Done"},
		},
	},
};



