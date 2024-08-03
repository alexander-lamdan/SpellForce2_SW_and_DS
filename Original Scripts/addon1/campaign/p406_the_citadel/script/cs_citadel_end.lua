--************************************************************
--**
--**		Citadel End
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
		"'pl_HumanHeroYasha'",
		"'pl_HumanNightsong'",
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
			FigureVanish {Tag = "CS_03_Mordecay01"},
			FigureVanish {Tag = "CS_03_Mordecay02"},
			FigureVanish {Tag = "CS_03_Mordecay03"},
			FigureVanish {Tag = "CS_03_Mordecay04"},
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			FigureVanish {Tag = "CS_03_Avatar03"},
			FigureVanish {Tag = "CS_03_Wind01"},
			FigureVanish {Tag = "CS_03_Wind02"},
			FigureVanish {Tag = "CS_03_Wind03"},
			FigureVanish {Tag = "CS_03_Whisper01"},
			FigureVanish {Tag = "CS_03_Whisper02"},
			FigureVanish {Tag = "CS_03_Whisper03"},
			FigureVanish {Tag = "CS_03_Caine01"},
			FigureVanish {Tag = "CS_03_Caine02"},
			FigureVanish {Tag = "CS_03_Caine03"},
			FigureVanish {Tag = "CS_03_Yasha01"},
			FigureVanish {Tag = "CS_03_Yasha02"},
			FigureVanish {Tag = "CS_03_Yasha03"},
			FigureVanish {Tag = "CS_03_Schattenlied01"},
			FigureVanish {Tag = "CS_03_Schattenlied02"},
			FigureVanish {Tag = "CS_03_Schattenlied03"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_03"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P406_StartEndCS"},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 583.69, Y = 538.4, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 581, Y = 534.95, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 165},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 585.5, Y = 534.28, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 200},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 586.753, Y = 535.391, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 200},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 582.14, Y = 534.39, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 170},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 583.662, Y = 534.594, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 180},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroYasha"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Avatar und Helden werden unverwundbar
			FigureAbilityAdd {Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroWind", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroWhisper", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroYasha", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanNightsong", AbilityId = Ability.Immortal},
			-- Mordecay spawnt und stirbt
			MapFlagSetTrue {Name = "mf_CS_03_Dying_Mordecay_Spawn"},			
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
	OnOneTimeEvent	-- Avatar kniet sich hin
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_03_pl_HumanAvatar_KneelDown"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Kamera auf Helden, Mordecay als Held wir gespawnt, toter Mordecay wirdgelöscht
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 106},
			NoSpawnEffect {Spawn = FigureHeroSpawn {Tag = "HeroMordecay", X = 583.62, Y = 541.33, Direction = 0},},
			MapFlagSetTrue {Name = "mf_CS_03_Dying_Mordecay_Vanish"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar steht wieder, Mordecay steht auf
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
			MapFlagSetTrue {Name = "mf_CS_03_pl_HumanAvatar_KneelStop"},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroMordecay", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf Mordecay und Avatar
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
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- EndCutsceneDummy1
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
			CutsceneSay {TextTag = "EndCutsceneDummy1", Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- EndCutsceneDummy2
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
			CutsceneSay {TextTag = "EndCutsceneDummy2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- EndCutsceneDummy3
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
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy3", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- EndCutsceneDummy4
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
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy4", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- EndCutsceneDummy5
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
			CutsceneSay {TextTag = "EndCutsceneDummy5", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- EndCutsceneDummy6
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
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy6", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- EndCutsceneDummy7
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
			CutsceneSay {TextTag = "EndCutsceneDummy7", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- EndCutsceneDummy8
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
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy8", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- EndCutsceneDummy9
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
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy9", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- EndCutsceneDummy10
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
			CutsceneSay {TextTag = "EndCutsceneDummy10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- EndCutsceneDummy11
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
			CameraTakeAddToTrack {File = "CS_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy11", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- EndCutsceneDummy13
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
			CutsceneSay {TextTag = "EndCutsceneDummy13", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- EndCutsceneDummy14
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
			CameraTakeAddToTrack {File = "CS_03_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy14", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- EndCutsceneDummy15
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
			CutsceneSay {TextTag = "EndCutsceneDummy15", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- EndCutsceneDummy16
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
			CameraTakeAddToTrack {File = "CS_03_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20a",
	},
};

----- zusätzliche Takes Start

State
{
	StateName = "Cutscene20a",
	OnOneTimeEvent	-- EndCutsceneDummy18
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
			CameraTakeAddToTrack {File = "CS_03_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy18", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20b",
	},
};

State
{
	StateName = "Cutscene20b",
	OnOneTimeEvent	-- EndCutsceneDummy19
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
			CutsceneSay {TextTag = "EndCutsceneDummy19", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20c",
	},
};

State
{
	StateName = "Cutscene20c",
	OnOneTimeEvent	-- EndCutsceneDummy20
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
			CutsceneSay {TextTag = "EndCutsceneDummy20", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20d",
	},
};

State
{
	StateName = "Cutscene20d",
	OnOneTimeEvent	-- EndCutsceneDummy21
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
			CutsceneSay {TextTag = "EndCutsceneDummy21", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

----- zusätzliche Takes Ende


State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- EndCutsceneDummy17
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
			CameraTakeAddToTrack {File = "CS_03_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "EndCutsceneDummy17", Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
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
			CameraTakeAddToTrack {File = "CS_03_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Schattenlied und Wind gehen weg
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
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 583.662, Y = 514, },
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 581, Y = 514, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Yasha und Caine gehen weg
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
			FigureSimpleWalk {Tag = "pl_HumanHeroYasha", X = 582.14, Y = 514, },
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 586.753, Y = 515, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Avatar und Whisper gehen weg
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 583.69, Y = 514, },
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 585.5, Y = 514, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Mordecay geht hinterher
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
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 583.62, Y = 514, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26a",
	},
};

State
{
	StateName = "Cutscene26a",
	OnOneTimeEvent	-- Avatar und Helden werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
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
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 105, Y = 109.2, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 102.2, Y = 110.6, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 107.8, Y = 105, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 315},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26b",
	},
};

State
{
	StateName = "Cutscene26b",
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
			CameraTakeAddToTrack {File = "CS_03_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Schattenlied und Wind gehen
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
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 91, Y = 99.4, },
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 91, Y = 96.6, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- Yasha und Caine gehen
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
			FigureSimpleWalk {Tag = "pl_HumanHeroYasha", X = 93.8, Y = 98, },
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 93.8, Y = 92.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- Avatar und Whisper gehen
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
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 89.6, Y = 92.4, },
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 93.8, Y = 95.2, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- Mordecay geht hinterher
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
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 96.6, Y = 93.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
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
			-- Figuren werden an finale Positionen teleportiert
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 91.4016, Y = 94.1069, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 92.8016, Y = 98.3069, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 95.6016, Y = 96.9069, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 95.6016, Y = 94.1069, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 95.6016, Y = 99.7069, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 92.8016, Y = 101.107, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 98.4016, Y = 95.5069, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 315},
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			-- Avatar und Helden sind wieder verwundbar
			FigureAbilityRemove {Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroWind", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroWhisper", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroYasha", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanNightsong", AbilityId = Ability.Immortal},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_P406_EndLastCS"},			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};