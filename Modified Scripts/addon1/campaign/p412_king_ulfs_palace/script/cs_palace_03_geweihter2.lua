--************************************************************
--**
--**		King Ulfs Palace Geweihter2
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
		"'NecroGuard1'",
		"'NecroGuard2'",
		"'NecroGuard3'",
		"'NecroGuard4'",
		"'NecroGuard5'",
		"'NecroGuard6'",
		"'Necromancer'",
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
			FigureVanish {Tag = "Dummy_CS_03_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_03_Wind01"},
			FigureVanish {Tag = "Dummy_CS_03_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_03_Caine01"},
			FigureVanish {Tag = "Dummy_CS_03_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_03_Nightsong01"},
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
					MapFlagIsTrue {Name = "mf_P412_StartGeweihter2CS"},
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
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 122.286, Y = 89.6535, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 122.852, Y = 87.6784, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 122.893, Y = 91.5173, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 124.74, Y = 88.5627, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 125.196, Y = 92.0518, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 124.052, Y = 90.4138, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 125.295, Y = 87.0039, },
			CutsceneFigureTeleport {Tag = "Necromancer", X = 97, Y = 91, },
			CutsceneFigureTeleport {Tag = "NecroGuard1", X = 92.5012, Y = 91.9495, },
			CutsceneFigureTeleport {Tag = "NecroGuard2", X = 97.21, Y = 87.85, },
			CutsceneFigureTeleport {Tag = "NecroGuard3", X = 95.663, Y = 92.9932, },
			CutsceneFigureTeleport {Tag = "NecroGuard4", X = 94.0066, Y = 85.4331, },
			CutsceneFigureTeleport {Tag = "NecroGuard5", X = 92.6986, Y = 89.6175, },
			CutsceneFigureTeleport {Tag = "NecroGuard6", X = 91.9578, Y = 87.09, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 270},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureLookAtDirection {Tag = "Necromancer", Direction = 85},
			FigureLookAtDirection {Tag = "NecroGuard1", Direction = 74},
			FigureLookAtDirection {Tag = "NecroGuard2", Direction = 90},
			FigureLookAtDirection {Tag = "NecroGuard3", Direction = 80},
			FigureLookAtDirection {Tag = "NecroGuard4", Direction = 125},
			FigureLookAtDirection {Tag = "NecroGuard5", Direction = 85},
			FigureLookAtDirection {Tag = "NecroGuard6", Direction = 97},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Effekt auf Positionen von Nekromant und Skelett
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
			--EffectStartAtEntityPosition {Tag = "NecroGuard2", File = "Effect_AreaDecay_Cast"},
			--EffectStartAtEntityPosition {Tag = "Necromancer", File = "Effect_AreaDecay_Cast"},
			EffectStartAtEntityPosition {Tag = "NecroGuard2", File = "Effect_Charm_Cast"},
			EffectStartAtEntityPosition {Tag = "Necromancer", File = "Effect_Charm_Cast"},
		},
	},
	OnOneTimeEvent	-- Necromancer und NecroGuard2 tauschen ihre Positionen(schaut so aus als würden die Meshes getauscht)
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
			CutsceneFigureTeleport {Tag = "NecroGuard2", X = 97, Y = 91, },
			CutsceneFigureTeleport {Tag = "Necromancer", X = 97.21, Y = 87.85, },
			FigureLookAtDirection {Tag = "NecroGuard2", Direction = 85},
			FigureLookAtDirection {Tag = "Necromancer", Direction = 90},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Necromancer", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Zoom auf Avatar und Helden
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
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
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_EndGeweihter2CS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};