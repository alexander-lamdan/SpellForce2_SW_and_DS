--************************************************************
--**														**
--**		Crystal Forest	Near Gate						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		-- Schattenkrieger spawnt erst in der Cutscene, wird automatisch in die Liste aufgenommen
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AvatarFlagIsTrue {Name = "af_P319_Cutscene02Begin"},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 276.349, Y = 226.847},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 190.405},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 274.354, Y = 226.838},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 170.351},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Schattenkrieger Talkjob wird in seinem Script beim Spawn direkt gestartet
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	}
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Schattenlied: Gate_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_01", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Schattenlied: Gate_02
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
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_02", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar schaut sich um
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
			CameraTakeAddToTrack {File = "CS_02_Take03a", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03b", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03c", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03d", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03e", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03f", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03g", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03h", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: Gate_03
	{
		Conditions =
		{
			-- anpassen an Dauer des Umschauens
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kamera auf Avatar, Schattenlied und gleich erscheinenden Schattenkrieger
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06a",
	},
};

State
{
	StateName = "Cutscene06a",
	OnOneTimeEvent	-- Effekt auf Position an der der Schattenkrieger erscheinen wird
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			EffectStart {Tag = "Schattenkrieger_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Shadowwarrior Spawn Play
			MapFlagSetTrue {Name = "mf_P319_Crystal_Forest_02_SOUND_Play_Shadowwarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06b",
	},
};

State
{
	StateName = "Cutscene06b",
	OnOneTimeEvent	-- Schattenkrieger erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P319_ShadowWarriorSpawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Schattenlied: Gate_04
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Gate_04", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Schattenkrieger: Gate_05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_05", Tag = "Schattenkrieger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Schattenkrieger: Gate_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_06", Tag = "Schattenkrieger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Schattenlied: Gate_07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_07", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Schattenlied: Gate_08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_08", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
	OnOneTimeEvent	-- Schattenlied kniet sich hin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KneelDownHack", Seconds = 0.6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_02_Schattenlied_Kneel_Down"},
			EntityTimerStop {Name = "et_KneelDownHack"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12a",
	},
};

State
{
	StateName = "Cutscene12a",
	OnOneTimeEvent	-- Avatar: Gate_09
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Schattenlied steht wieder auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_02_Schattenlied_Kneel_Up"},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Avatar: Gate_10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
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
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
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
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "Schattenkrieger"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Schattenkrieger"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P319_CS02Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};