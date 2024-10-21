--************************************************************
--**														**
--**		Iron Fields Part II Woodkeeper Awake			**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		-- Grimrot und seine Bäume spawnen in der Cutscene
		-- Schatten spawnen auch in der Cutscene
		"''",
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
				MapFlagIsTrue	{Name = "mf_CutsceneB03"},
				AND
				{
					QuestIsSolved {Quest = "AwakeTreants"},
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
			CameraTakeAddToTrack {File = "CS_B_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Grimrot Spawn und Ausrichtung
			MapFlagSetTrue {Name = "mf_CS_B_03_Grimrot_Spawn"},
			FigureLookAtDirection {Tag = "Grimrot", Direction = 270},
			-- Spawn der anderen Baumwächter und Ausrichtung
			MapFlagSetTrue {Name = "mf_CS_B_03_Baumwaechter_Spawn"},
			FigureLookAtDirection {Tag = "Tree1", Direction = 315.837},
			FigureLookAtDirection {Tag = "Tree2", Direction = 76.1577},
			FigureLookAtDirection {Tag = "Tree3", Direction = 18.8619},
			FigureLookAtDirection {Tag = "Tree4", Direction = 284.324},
			FigureLookAtDirection {Tag = "Tree5", Direction = 247.081},
			FigureLookAtDirection {Tag = "Tree6", Direction = 172.597},
			FigureLookAtDirection {Tag = "Tree7", Direction = 224.163},
			FigureLookAtDirection {Tag = "Tree8", Direction = 142.803},
			-- Avatar wird teleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 117.946, Y = 93.1854},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Grimrot geht zum Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			-- Grimrot kommt aus dem Wald gelaufen
			FigureWalk {Tag = "Grimrot", X = 121.189, Y = 93.18},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};



State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Grimrot: Grimrot1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Grimrot"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Grimrot1", Tag = "Grimrot"},
			FigureCutsceneTalkJobSet {Tag = "Grimrot"},	
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Grimrot: Grimrot2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer beibehalten, Satz fängt an wenn Kamera den Kopf erreicht hat
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Grimrot2", Tag = "Grimrot"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Grimrot: Grimrot3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Grimrot3", Tag = "Grimrot"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Schatten tauchen auf
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "CS_B_03_Shadow01", Level = 1, UnitId = 959, X = 116.566, Y = 94.7244, Team = "tm_CutsceneRed"},
			FigureLookAtEntity	{Tag = "CS_B_03_Shadow01", TargetTag = "pl_HumanAvatar"},
			FigureNpcSpawn	{Tag = "CS_B_03_Shadow02", Level = 1, UnitId = 959, X = 116.502, Y = 91.4195, Team = "tm_CutsceneRed"},
			FigureLookAtEntity	{Tag = "CS_B_03_Shadow02", TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar greift den ersten Schatten an
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureStop {Tag = "pl_HumanAvatar"},			
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "CS_B_03_Shadow01"},
			MapFlagSetTrue {Name = "mf_CS_B_03_Avatar_Anim_Attack_01"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11a",
	},
};

State
{
	StateName = "Cutscene11a",
	OnOneTimeEvent	-- SOUND: Avatar Attack1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B03_SOUND_Play_Avatar_Attack1"},
		},
		GotoState = "Cutscene11b",
	},
};

State
{
	StateName = "Cutscene11b",
	OnOneTimeEvent	-- Erster Schatten Kill
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.1},
		},
		Actions =
		{
			FigureKill	{Tag = "CS_B_03_Shadow01"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Avatar greift den zweiten Schatten an
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "CS_B_03_Shadow02"},
			MapFlagSetTrue {Name = "mf_CS_B_03_Avatar_Anim_Attack_02"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13a",
	},
};

State
{
	StateName = "Cutscene13a",
	OnOneTimeEvent	-- SOUND: Avatar Attack2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.05},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B03_SOUND_Play_Avatar_Attack2"},
		},
		GotoState = "Cutscene13b",
	},
};

State
{
	StateName = "Cutscene13b",
	OnOneTimeEvent	-- Zweiter Schatten Kill
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureKill	{Tag = "CS_B_03_Shadow02"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar: Avatar17
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},			
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			CutsceneSay {TextTag = "Avatar17", Tag = "pl_HumanAvatar"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			-- hier sollte ein Waffenwegesteck-Sound kommen
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Grimrot: Grimrot4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Grimrot4", Tag = "Grimrot"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Avatar: Avatar18
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Grimrot: Grimrot5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Grimrot5", Tag = "Grimrot"},
			FigureUnitChange {Tag = "Tree1", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree2", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree3", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree4", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree5", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree6", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree7", UnitId = 308, Level = 11},
			FigureUnitChange {Tag = "Tree8", UnitId = 308, Level = 11},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Kamera auf den Wald
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Bauwächter 1 und 5 gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Tree1", X = 121.686, Y = 98.4055},
			FigureSimpleWalk {Tag = "Tree5", X = 124.943, Y = 90.5747},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Bauwächter 2 und 6 gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Tree2", X = 114.012, Y = 98.9859},
			FigureSimpleWalk {Tag = "Tree6", X = 120.246, Y = 85.9709},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Bauwächter 3 und 7 gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Tree3", X = 117.33, Y = 101},
			FigureSimpleWalk {Tag = "Tree7", X = 123.9, Y = 86.4952},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Bauwächter 4 und 8 gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Tree4", X = 124.565, Y = 95.6118},
			FigureSimpleWalk {Tag = "Tree8", X = 115.307, Y = 87.4437},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Grimrot: Grimrot6
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Grimrot6", Tag = "Grimrot"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
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
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
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
			CutsceneEnd {},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Grimrot"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Bäume werden in das Team des Spielers gesteckt
			FigurePlayerTransfer {Tag = "Tree1"},
			FigurePlayerTransfer {Tag = "Tree2"},
			FigurePlayerTransfer {Tag = "Tree3"},
			FigurePlayerTransfer {Tag = "Tree4"},
			FigurePlayerTransfer {Tag = "Tree5"},
			FigurePlayerTransfer {Tag = "Tree6"},
			FigurePlayerTransfer {Tag = "Tree7"},
			FigurePlayerTransfer {Tag = "Tree8"},
			FigurePlayerTransfer {Tag = "Grimrot"},
			-- Scriptingkram für die Karte
			MapTimerStart {Name = "mt_P301_OutcriesAfterDragonFight"},
			PlayerKitTransfer {PlayerKit = "pk_Elenshrine"},
			DialogSetDisabled {Tag = "IoMission"},
			FigureOutcry {TextTag = "TothLar1", Tag = "TothLar"},
			PlayerBuildingUpgradeAdd {UpgradeId = 15}
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};