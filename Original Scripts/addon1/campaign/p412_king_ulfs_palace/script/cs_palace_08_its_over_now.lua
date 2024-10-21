--************************************************************
--**
--**		King Ulfs Palace Its Over Now
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
			FigureVanish {Tag = "Dummy_CS_08_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_08_Wind01"},
			FigureVanish {Tag = "Dummy_CS_08_Wind02"},
			FigureVanish {Tag = "Dummy_CS_08_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_08_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_08_Caine01"},
			FigureVanish {Tag = "Dummy_CS_08_Caine02"},
			FigureVanish {Tag = "Dummy_CS_08_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_08_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_08_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_08_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_08_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_08_Nightsong02"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_08"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P412_Its_Over_Now_Start"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
    		FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = 527},
    		FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = 517},
			--FigureKill	{Tag = "pl_HumanAvatar"},
			--NoSpawnEffect{Spawn = AvatarSpawn	{Player = "pl_Human", X = 185.439, Y = 314.012, Direction = 0}},

			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 185.439, Y = 314.012, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 186.2, Y = 305.2, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 64},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 180},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 160, Y = 273, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 160, Y = 273, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 160, Y = 273, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 160, Y = 273, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 160, Y = 273, },
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Avatar spielt Anim ab
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanAvatar_Die"},
			MapTimerStart {Name = "mt_CS_08_pl_HumanAvatar_Die"},
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
	OnOneTimeEvent	-- Yasha kommt angerannt und kniet sich hin
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
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanHeroYasha_KneelDown"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanHeroYasha"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- YashaTE01 
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
			CutsceneSay {TextTag = "YashaTE01", Tag = "pl_HumanHeroYasha", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera fängt an sich zu drehen & restliche Helden werden umteleportiert
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
			CameraTakeAddToTrack {File = "CS_08_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_08_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
--			MapFlagSetTrue {Name = "mf_CS_08_Rotate_Camera_Start"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 181.248, Y = 309.807, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 191.345, Y = 318.561, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 186.449, Y = 320.192, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 191.162, Y = 310.019, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 181.276, Y = 318.577, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 123},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 322},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 0},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 230},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 50},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- 
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
			CutsceneSay {TextTag = "AvatarTE02", Tag = "pl_HumanAvatar", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- YashaTE03
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
			CutsceneSay {TextTag = "YashaTE03", Tag = "pl_HumanHeroYasha", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- AvatarTE04
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
			CutsceneSay {TextTag = "AvatarTE04", Tag = "pl_HumanAvatar", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- AvatarTE05
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
			CutsceneSay {TextTag = "AvatarTE05", Tag = "pl_HumanAvatar", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
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
			CutsceneSay {TextTag = "YashaTE06", Tag = "pl_HumanHeroYasha", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- AvatarTE07
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
			CutsceneSay {TextTag = "AvatarTE07", Tag = "pl_HumanAvatar", PlayTalkAnim = false},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Yasha fängt an zu singen
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
			SoundGlobalPlayOnceAddon1 {File = "00_music/ds_13_lullaby_of_death_short"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Helden kommen angelaufen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanHeroWind_KneelDown"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanHeroWhisper_KneelDown"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanHeroCaine_KneelDown"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanHeroMordecay_KneelDown"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_08_pl_HumanNightsong_KneelDown"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 44},
		},
		Actions =
		{

			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
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
			-- EXTRO-BINK ANZEIGEN
			CutscenePlayBinkVideo{File = "Addon1/video/extro_1.bik"},
			-- scriptingrelevante Flags
			--MapFlagSetTrue {Name = "mf_P412_Its_Over_Now_Ended"},
		},
		GotoState = "WaitForBink",
	},
};

State
{
	StateName = "WaitForBink",

	OnOneTimeEvent	-- 
	{
		Conditions =
		{
		},
		Actions =
		{
			-- SPIEL GEWONNEN
			PlayerGameEnds {},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};