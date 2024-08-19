--************************************************************
--**
--**		Alluvyan Endcutszene (das schreibt man mit C nicht mit Z!)
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
	}
}

local _tRenderList2 = CutsceneFigureRenderList{Tag = "CS_05_Skjadir01"}
_tRenderList2.tModFuncs =
{
	Add =
	{
		"'Summoner'",
		"'CS_05_Dwarf01'",
		"'CS_05_Dwarf02'",
		"'CS_05_Dwarf03'",
		"'CS_05_Dwarf04'",
		"'CS_05_Dwarf05'",
		"'CS_05_Dwarf06'",
		"'CS_05_Dwarf07'",
		"'CS_05_Dwarf08'",
		"'CS_05_Dwarf09'",
	}
}

local _tRenderList3 = CutsceneFigureRenderList{Tag = "CS_05_Skjadir01"}
_tRenderList3.tModFuncs =
{
	Add =
	{
		"'Summoner'",
		"'CS_05_Dwarf01'",
		"'CS_05_Dwarf02'",
		"'CS_05_Dwarf03'",
		"'CS_05_Dwarf04'",
		"'CS_05_Dwarf05'",
		"'CS_05_Dwarf06'",
		"'CS_05_Dwarf07'",
		"'CS_05_Dwarf08'",
		"'CS_05_Dwarf09'",
		"'EndMonster'",
	}
}

local _tRenderList4 = CutsceneFigureRenderList{Tag = "CS_05_Skjadir01"}
_tRenderList4.tModFuncs =
{
	Add =
	{
		"'Summoner'",
		"'CS_05_Dwarf01'",
		"'CS_05_Dwarf02'",
		"'CS_05_Dwarf03'",
		"'CS_05_Dwarf04'",
		"'CS_05_Dwarf05'",
		"'CS_05_Dwarf06'",
		"'CS_05_Dwarf07'",
		"'CS_05_Dwarf08'",
		"'CS_05_Dwarf09'",
		"'EndMonster'",
		"'Satras'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_05"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P402_EndcutszeneCS"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList2,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Actors werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_05_Actors_Spawn"},
			-- Zwerge werden gespawnt
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- FifthCutsceneDummy1
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			_tRenderList2,
			CutsceneSay {TextTag = "FifthCutsceneDummy1", Tag = "CS_05_Skjadir01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Skjaldir läuft los
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleWalkToEntity {Tag = "CS_05_Skjadir01", TargetTag = "CS_05_Skjadir02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Zwerge laufen los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf01", TargetTag = "CS_05_Dwarf11"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf02", TargetTag = "CS_05_Dwarf12"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf03", TargetTag = "CS_05_Dwarf13"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf04", TargetTag = "CS_05_Dwarf14"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf05", TargetTag = "CS_05_Dwarf15"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf06", TargetTag = "CS_05_Dwarf16"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf07", TargetTag = "CS_05_Dwarf17"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf08", TargetTag = "CS_05_Dwarf18"},
			FigureSimpleWalkToEntity {Tag = "CS_05_Dwarf09", TargetTag = "CS_05_Dwarf19"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf Summoner
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- FifthCutsceneDummy2
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- FifthCutsceneDummy3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy3", Tag = "Summoner"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07a",
	},
};

State
{
	StateName = "Cutscene07a",
	OnOneTimeEvent	-- Kurze Pause
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07b",
	},
};

State
{
	StateName = "Cutscene07b",
	OnOneTimeEvent	-- Effekt auf Titan
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "EndMonster", File = "Effect_Misc_TitanSpawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Titan wird sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			_tRenderList3,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- FifthCutsceneDummy4
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy4", Tag = "Summoner"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kamera auf Satras
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Effekt auf Satras
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStart {Tag = "Satras", File = "Effect_Rage_Initial"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Satras wird sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			_tRenderList4,
			CutsceneFigureWeaponsHide {Tag = "Satras"},
			FigureCutsceneTalkJobSet {Tag = "Satras"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- FifthCutsceneDummy5
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy5", Tag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- FifthCutsceneDummy6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy6", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- FifthCutsceneDummy7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FifthCutsceneDummy7", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- FifthCutsceneDummy8
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FifthCutsceneDummy8", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Zwerge werden umteleportiert
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{			
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf01", TargetTag = "CS_05_Dwarf21"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf02", TargetTag = "CS_05_Dwarf22"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf03", TargetTag = "CS_05_Dwarf23"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf04", TargetTag = "CS_05_Dwarf24"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf05", TargetTag = "CS_05_Dwarf25"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf06", TargetTag = "CS_05_Dwarf26"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf07", TargetTag = "CS_05_Dwarf27"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf08", TargetTag = "CS_05_Dwarf28"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Dwarf09", TargetTag = "CS_05_Dwarf29"},
			CutsceneFigureTeleportToEntity {Tag = "CS_05_Skjadir01", TargetTag = "CS_05_Skjadir03"},
			FigureLookAtDirection {Tag = "CS_05_Dwarf01", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf02", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf03", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf04", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf05", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf06", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf07", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf08", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Dwarf09", Direction = 180},
			FigureLookAtDirection {Tag = "CS_05_Skjadir01", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};



State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Kamera auf Zwerge
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			-- Kameras werden gestoppt, Balken verschwinden, UI wird eingeblendet
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Talkjobs werden durch den Event direkt beendet
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Waffen werden wieder eingeblendet
			CutsceneFigureWeaponsShow {Tag = "Satras"},
			-- Akteure werden gelöscht
			MapFlagSetTrue {Name = "mf_Delete_Actors_CS_05"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_EndcutszeneCS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};