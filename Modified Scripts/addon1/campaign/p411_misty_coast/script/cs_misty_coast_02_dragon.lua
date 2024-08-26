--************************************************************
--**
--**		Misty Coast Dragon
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
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_02_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_02_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_02_Wind01"},
			FigureVanish {Tag = "Dummy_CS_02_Wind02"},
			FigureVanish {Tag = "Dummy_CS_02_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_02_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_02_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_02_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_02_Caine01"},
			FigureVanish {Tag = "Dummy_CS_02_Caine02"},
			FigureVanish {Tag = "Dummy_CS_02_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_02_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_02_Schattenlied01"},
			FigureVanish {Tag = "Dummy_CS_02_Schattenlied02"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon01"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon02"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon03"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon04"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon05"},
			FigureVanish {Tag = "Dummy_CS_02_Dragon06"},
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
					MapFlagIsTrue {Name = "mf_CS02Start"},
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
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 269.18, Y = 129.67, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 34},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 267.26, Y = 130.56, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 34},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 266.2, Y = 128.73, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 40},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 265.7, Y = 130.87, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 45},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 269.63, Y = 132.37, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 28},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 267.1, Y = 132.7, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 46},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 264.1, Y = 129.82, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 57},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroYasha"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			-- Drache wird als Held gespawnt
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "DragonCompanion", Level = 23, UnitId = 1601, X = 280.613, Y = 312.113, Team = "tm_Neutral"},},
			-- Drache fliegt los
			FigureSimpleRun {Tag = "DragonCompanion", X = 494.862, Y = 282.175},
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
	OnOneTimeEvent	-- Wind01 & Drache wird teleportiert
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Wind01", Tag = "pl_HumanHeroWind"},
			CutsceneFigureTeleport {Tag = "DragonCompanion", X = 280.613, Y = 312.113, },
			FigureLookAtDirection {Tag = "DragonCompanion", Direction = 85},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Drache kommt angeflogen
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
			FigureSimpleRun {Tag = "DragonCompanion", X = 494.862, Y = 282.175},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera auf anfliegenden Drachen
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
			CameraTakeAddToTrack {File = "CS_02_Take02b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Wisper01
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Wisper01", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar04
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
			CutsceneSay {TextTag = "Avatar04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar05 & Drache wird umteleportiert
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
			CutsceneSay {TextTag = "Avatar05", Tag = "pl_HumanAvatar"},
			CutsceneFigureTeleport {Tag = "DragonCompanion", X = 260.678, Y = 493.14},
			FigureLookAtDirection {Tag = "DragonCompanion", Direction = 216},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Drache fliegt auf die Insel zu
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
			FigureRun {Tag = "DragonCompanion", X = 183.954, Y = 576.137},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera auf den Drachen
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
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kamerawechsel und Feuerball 1 fliegt los
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
			EffectStartAddon1 {Tag = "CS_02_Fireball01", File = "Effect_Misc_Cutscene_Fireball"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

--State
--{
--	StateName = "Cutscene11",
--	OnOneTimeEvent	-- Feuerball 2 fliegt los
--	{
--		Conditions =
--		{
--			--CutsceneSayIsDone {},
--			--FigureIsIdle {Tag = ""},
--			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
--		},
--		Actions =
--		{
--			EffectStartAddon1 {Tag = "CS_02_Fireball02", File = "Effect_Misc_Cutscene_Fireball"},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene12",
--	},
--};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamera auf Avatar & Drache wird teleportiert
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
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "DragonCompanion", X = 238.941, Y = 572.191},
			FigureLookAtDirection {Tag = "DragonCompanion", Direction = 35},
			EffectStop {Tag = "CS_02_Fireball01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Drache fliegt los
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
			FigureRun {Tag = "DragonCompanion", X = 299.442, Y = 462.913},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Kamera auf Drache
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
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Feuerball 3 fliegt los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			EffectStartAddon1 {Tag = "CS_02_Fireball03", File = "Effect_Misc_Cutscene_Fireball"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Feuerball 4 fliegt los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.7},
			
		},
		Actions =
		{
			--EffectStartAddon1 {Tag = "CS_02_Fireball04", File = "Effect_Misc_Cutscene_Fireball"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Feuerball 5 fliegt los & Helden und Avatar werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.7},
		},
		Actions =
		{
			--EffectStartAddon1 {Tag = "CS_02_Fireball05", File = "Effect_Misc_Cutscene_Fireball"},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 259.996, Y = 134.662, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 115},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 258.932, Y = 135.771, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 109},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 260.363, Y = 132.523, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 261.07, Y = 130.516, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 335},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 259.149, Y = 137.794, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 97},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 258.14, Y = 134.14, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 92},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 258.5, Y = 131.9, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 120},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Kamera auf Avatar und Helden, Avatar spielt Military-Animation ab, Drache wird gespawnt
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
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_02_Dragon_Talking_Spawn"},
			EffectStop {Tag = "CS_02_Fireball03"},
			EntityTimerStart {Name = "et_CStimerA"},
		},

	},
	OnOneTimePlayHeroAnimEvent	
	{
		EventName = "Anim001",
		Tag = "pl_HumanAvatar", 
		Anim = "emote_military", 
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 0.5},
		},
		Actions = 
		{
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Wind kniet sich hin
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
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWind", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_down.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Whisper kniet sich hin
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
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWhisper", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Seelentraeger01
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take09b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Seelentraeger01", Tag = "CS_02_Dragon_Talking"},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWind", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_up.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWhisper", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Seelentraeger02
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
			CutsceneSay {TextTag = "Seelentraeger02", Tag = "CS_02_Dragon_Talking"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Avatar06
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
			CameraTakeAddToTrack {File = "CS_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Seelentraeger03
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
			CameraTakeAddToTrack {File = "CS_02_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Seelentraeger03", Tag = "CS_02_Dragon_Talking"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Avatar07
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
			CameraTakeAddToTrack {File = "CS_02_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Avatar08
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
			CameraTakeAddToTrack {File = "CS_02_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
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
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			-- Helden-Drache wird umteleportiert
			CutsceneFigureTeleport {Tag = "DragonCompanion", X = 273.288, Y = 136.142, },
			FigureLookAtDirection {Tag = "DragonCompanion", Direction = 228},
			FigurePlayerTransfer{Tag = "DragonCompanion", Player = "pl_Human"},
			-- sprechender Drache wird gelöscht
			FigureVanish {Tag = "CS_02_Dragon_Talking"},
			-- Scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS02Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};