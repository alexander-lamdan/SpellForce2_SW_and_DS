--************************************************************
--**
--**		Citadel Gate1
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
		"'pl_HumanHeroCaine'",
		"'ShadowWarrior'",
		"'GateMonster'",
		"'FEMALESHAPER'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_02_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_02_Wind01"},
			FigureVanish {Tag = "Dummy_CS_02_Wind02"},
			FigureVanish {Tag = "Dummy_CS_02_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_02_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_02_Caine01"},
			FigureVanish {Tag = "Dummy_CS_02_Caine02"},
			FigureVanish {Tag = "Dummy_CS_02_Shadowwarrior01"},
			FigureVanish {Tag = "Dummy_CS_02_GateGuard01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_02"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P406_StartGate1CS"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
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
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 256.2, Y = 256.2, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 258.383, Y = 255.453, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 255.688, Y = 258.461, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 253.801, Y = 259.279, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 315},
			CutsceneFigureTeleport {Tag = "ShadowWarrior", X = 239.4, Y = 239.4, },
			FigureLookAtDirection {Tag = "ShadowWarrior", Direction = 135},
			CutsceneFigureTeleport {Tag = "GateMonster", X = 260.397, Y = 260.025, },
			FigureLookAtDirection {Tag = "GateMonster", Direction = 315},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "ShadowWarrior"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			FigureCutsceneTalkJobSet {Tag = "ShadowWarrior"},
			-- zusätzliche Akteure werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_02_Actors_Spawn"},
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
	OnOneTimeEvent	-- GateCutsceneDummy1
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
			CutsceneSay {TextTag = "GateCutsceneDummy1", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar läuft los
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
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 242.2, Y = 242.2, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Whisper läuft los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.15},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "pl_HumanHeroWhisper", X = 241.688, Y = 244.461, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Wind läuft los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.15},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "pl_HumanHeroWind", X = 244.383, Y = 241.453, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Caine läuft los, GateMonster läuft hinterher
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.15},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanHeroCaine", X = 239.801, Y = 245.279, },
			MapFlagSetTrue {Name = "mf_CS_02_GateGuard_Walk"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- GateCutsceneDummy2
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "GateCutsceneDummy2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- GateCutsceneDummy3
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
			CutsceneSay {TextTag = "GateCutsceneDummy3", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- GateCutsceneDummy4
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
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy4", Tag = "ShadowWarrior"},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 300},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 330},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 355},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- GateCutsceneDummy5
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
			CutsceneSay {TextTag = "GateCutsceneDummy5", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- GateCutsceneDummy6
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
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy6", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- GateCutsceneDummy7
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
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy7", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- GateCutsceneDummy8
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
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy8", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- GateCutsceneDummy9
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
			CutsceneSay {TextTag = "GateCutsceneDummy9", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- GateCutsceneDummy10
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
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- GateCutsceneDummy11
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
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy11", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- GateCutsceneDummy12
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
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GateCutsceneDummy12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- GateCutsceneDummy13
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
			CutsceneSay {TextTag = "GateCutsceneDummy13", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- 
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
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Wind geht weg
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
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 253.4, Y = 213, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Avatar geht weg
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 250.6, Y = 232.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Whisper geht weg
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
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 253.4, Y = 213, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Caine geht weg
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
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 256.2, Y = 226.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26a",
	},
};

State
{
	StateName = "Cutscene26a",
	OnOneTimeEvent	-- Effekt auf Schattenkriegers Position
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
			EffectStartAtEntityPosition	{Tag = "ShadowWarrior", File = "Effect_Misc_SpawnSpecial_01"},
			EntityTimerStart {Name = "et_ShadowWarriorVanishTimer"},
		},
		GotoState = "Cutscene26b",
	},
};

State
{
	StateName = "Cutscene26b",
	OnOneTimeEvent	-- Schattenkrieger verschwindet
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_ShadowWarriorVanishTimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "ShadowWarrior"},
			EntityTimerStop {Name = "et_ShadowWarriorVanishTimer"},
		},
		GotoState = "Cutscene26c",
	},
};

State
{
	StateName = "Cutscene26c",
	OnOneTimeEvent	-- Avatar und Helden werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5.5},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 100.8, Y = 103.6, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 102.2, Y = 107.8, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 105, Y = 106.4, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 105, Y = 103.6, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 315},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26d",
	},
};

State
{
	StateName = "Cutscene26d",
	OnOneTimeEvent	-- Kamera auf Portal
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Avatar geht Richtung Portal
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 96.6, Y = 99.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- Caine geht Richtung Portal
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 100.8, Y = 99.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- Wind geht Richtung Portal
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 98, Y = 103.6, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- Whisper geht Richtung Portal
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 100.8, Y = 102.2, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	-- GateCutsceneDummy14
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 280},
			CutsceneSay {TextTag = "GateCutsceneDummy14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- Avatar geht zum Portal, Constructor rennt weg
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 89.6, Y = 92.4, },
			FigureSimpleRun {Tag = "CS_02_Constructor", X = 114.8, Y = 124.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	-- Caine geht zum Portal
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
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 93.8, Y = 92.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- Wind geht zum Portal
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
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 91, Y = 96.6, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene35",
	},
};

State
{
	StateName = "Cutscene35",
	OnOneTimeEvent	-- Whisper geht zum Portal
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
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 93.8, Y = 95.2, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene36",
	},
};

State
{
	StateName = "Cutscene36",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.5},
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
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "ShadowWarrior"},
			-- Akteure werden gelöscht
			MapFlagSetTrue {Name = "mf_Delete_Actors_CS_02"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_P406_EndGate1CS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};