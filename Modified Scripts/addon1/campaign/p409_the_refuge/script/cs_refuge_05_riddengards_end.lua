--************************************************************
--**
--**		Refuge Riddengards End
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
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
	}
}

-- Figuren die gerendert werden
local _tRenderList2 = CutsceneFigureRenderList{Tag = "pl_HumanHeroCaine"}

-- Figuren die gerendert werden
local _tRenderList3 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList3.tModFuncs =
{
	Add =
	{
		"'CS_05_Riddengard'",
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_04_Noradim'",
		"'CS_05_Soulcarrier'",
		"'CS_03_Drakling01'",
		"'CS_03_Drakling02'",
		"'CS_03_Drakling03'",
		"'CS_03_Drakling04'",
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
			FigureVanish {Tag = "Dummy_CS_05_Riddengard01"},
			FigureVanish {Tag = "Dummy_CS_05_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_05_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_05_Wind01"},
			FigureVanish {Tag = "Dummy_CS_05_Wind02"},
			FigureVanish {Tag = "Dummy_CS_05_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_05_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_05_Caine01"},
			FigureVanish {Tag = "Dummy_CS_05_Caine02"},
			FigureVanish {Tag = "Dummy_CS_05_Caine03"},
			FigureVanish {Tag = "Dummy_CS_05_Caine04"},
			FigureVanish {Tag = "Dummy_CS_05_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_05_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_05_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_05_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_05_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_05_Nightsong02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_05"},
				-- hier korrekte Startbedingungen eintragen
				MapFlagIsTrue {Name = "mf_CS05Start"},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSStartTimer"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSStartTimer", Seconds = 2.5},
			-- Avatar führt keine Dialog und die UI ist sichtbar
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 520.8, Y = 579.6, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 521, Y = 577, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 152},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 523.74, Y = 576.88, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 180},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 527.8, Y = 586.6, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 315},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 517.67, Y = 582, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 92},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 521.356, Y = 574.068, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 165},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 518.31, Y = 579.82, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 120},
			CutsceneFigureTeleport {Tag = "CS_04_Noradim", X = 128.72, Y = 546.455, },
			FigureLookAtDirection {Tag = "CS_04_Noradim", Direction = 300},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroYasha"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Helden und Avatar werden unverwundbar
			FigureAbilityAdd {Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroWind", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroWhisper", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroYasha", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanHeroMordecay", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "pl_HumanNightsong", AbilityId = Ability.Immortal},
			-- Drachen werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_05_Actors_Spawn"},
			-- Riddengard kniet direkt aus seinem Script
			EntityTimerStop {Name = "et_CSStartTimer"},
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
	OnOneTimeEvent	-- CS05Riddengard01
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
			CutsceneSay	{TextTag = "CS05Riddengard01", Tag = "CS_05_Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Riddengard steht auf
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
			MapFlagSetTrue {Name = "mf_CS_05_Riddengard_Kneel_Up_Anim_Play"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Caine kommt von hinten angelaufen
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
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 525, Y = 583.8, },
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- CS05Riddengard02
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Riddengard02", Tag = "CS_05_Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- CS05Caine03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanHeroCaine"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS05Caine03", Tag = "pl_HumanHeroCaine"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- CS05Riddengard04
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
			CutsceneSay	{TextTag = "CS05Riddengard04", Tag = "CS_05_Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- CS05Caine05
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
			_tRenderList2,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Caine05", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Caine spielt Schlag-Animation ab
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
			_tRenderList3,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_attack_2h_sword_1.ska"}, -- 2s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Riddengard stirbt
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.3},
		},
		Actions =
		{
			FigureKill {Tag = "CS_05_Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Caine geht näher an Riddengards Leiche
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
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 524, Y = 582.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11a",
	},
};

State
{
	StateName = "Cutscene11a",
	OnOneTimeEvent	-- Caine kniet sich hin
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanHeroCaine"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11b",
	},
};

State
{
	StateName = "Cutscene11b",
	OnOneTimeEvent	-- Caine kniet sich hin
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = "pl_HumanHeroCaine"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_05_Caine_Kneel_Down_Anim_Play"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- CS05Caine06
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.2},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS05Caine06", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- CS05Avatar07, Caine steht auf
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
			CameraTakeAddToTrack {File = "CS_05_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Avatar07", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue {Name = "mf_CS_05_Caine_Kneel_Up_Anim_Play"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- CS05Wind08
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
			CameraTakeAddToTrack {File = "CS_05_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Wind08", Tag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- CS05Yasha13
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
			CameraTakeAddToTrack {File = "CS_05_Take08b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Yasha13", Tag = "pl_HumanHeroYasha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- CS05Avatar14
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
			CameraTakeAddToTrack {File = "CS_05_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Avatar14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- CS05Yasha15
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
			CameraTakeAddToTrack {File = "CS_05_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Yasha15", Tag = "pl_HumanHeroYasha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- CS05Avatar16
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
			CameraTakeAddToTrack {File = "CS_05_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Avatar16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- CS05Nightsong17
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
			CameraTakeAddToTrack {File = "CS_05_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Nightsong17", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- CS05Avatar18
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
			CameraTakeAddToTrack {File = "CS_05_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Avatar18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- CS05Caine19
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
			CameraTakeAddToTrack {File = "CS_05_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Caine19", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- CS05Caine20
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
			CutsceneSay	{TextTag = "CS05Caine20", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- CS05Caine21
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
			CameraTakeAddToTrack {File = "CS_05_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Caine21", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- CS05Whisper22
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
			CameraTakeAddToTrack {File = "CS_05_Take15b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Whisper22", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- kurze Pause bevor die Kameraeinstellung gewechselt wird
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
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Kameraflüge zum Drachenhorst, Avatar und Helden werden umteleportiert
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take16", Tag = "default", TargetTag = "default"}, -- 3s
			CameraTakeAddToTrack {File = "CS_05_Take17", Tag = "default", TargetTag = "default"}, -- 3s
			CameraTakeAddToTrack {File = "CS_05_Take18", Tag = "default", TargetTag = "default"}, -- 5s
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 121.8, Y = 525, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 119.9, Y = 522.72, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 120.25, Y = 518.86, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 117.12, Y = 523.59, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 117.89, Y = 521.84, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 118.04, Y = 519.51, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 160},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 121.37, Y = 520.59, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 160},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- CS05Soulcarrier09
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 11},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05Soulcarrier09", Tag = "CS_05_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- CS05LordDragon10
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
			CutsceneSay	{TextTag = "CS05LordDragon10", Tag = "CS_04_Noradim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- CS05LordDragon11
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
			CameraTakeAddToTrack {File = "CS_05_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS05LordDragon11", Tag = "CS_04_Noradim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- CS05LordDragon12
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
			CutsceneSay	{TextTag = "CS05LordDragon12", Tag = "CS_04_Noradim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	-- CS05Soulcarrier23, Ausrichtung der Akteure
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
			CameraTakeAddToTrack {File = "CS_05_Take21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},		
			CutsceneSay	{TextTag = "CS05Soulcarrier23", Tag = "CS_05_Soulcarrier"},
			FigureLookAtDirection {Tag = "CS_05_Soulcarrier", Direction = 190},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroWind", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "CS_05_Soulcarrier"},
			FigureLookAtEntity	{Tag = "pl_HumanNightsong", TargetTag = "CS_05_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};State
{
	StateName = "Cutscene32",
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
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
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Helden und Avatar werden unverwundbar
			FigureAbilityRemove {Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroWind", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroWhisper", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroYasha", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanHeroMordecay", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "pl_HumanNightsong", AbilityId = Ability.Immortal},
			-- Soulcarrier wird gelöscht
			FigureVanish {Tag = "CS_04_SoulCarrier"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS05Ended"},
			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};