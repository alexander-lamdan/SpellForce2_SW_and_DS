--************************************************************
--**
--**		King Ulfs Palace Geweihter3
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
		"'ElementalMage'",
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
			FigureVanish {Tag = "Dummy_CS_04_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_04_Wind01"},
			FigureVanish {Tag = "Dummy_CS_04_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_04_Caine01"},
			FigureVanish {Tag = "Dummy_CS_04_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_04_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_04_Nightsong01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_04"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P412_StartGeweihter3CS"},
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
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 123.122, Y = 240.473, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 124.309, Y = 239.285, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 124.544, Y = 237.553, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 123.053, Y = 237.015, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 121.821, Y = 238.173, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 122.134, Y = 239.604, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 123.403, Y = 238.596, },
			CutsceneFigureTeleport {Tag = "ElementalMage", X = 126.058, Y = 265.663, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 180},
			FigureLookAtDirection {Tag = "ElementalMage", Direction = 0},
			-- Elementare werden gespawnt
			MapFlagSetTrue {Name = "mf_SpawnElementals"},
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
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
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
			MapFlagSetTrue {Name = "mf_EndGeweihter3CS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};