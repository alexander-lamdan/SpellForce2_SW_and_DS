--************************************************************
--**
--**		King Ulfs Palace Geweihter1
--**
--************************************************************

Double_Spawn_Timer = 0.6

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
		"'Illusionist'",
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
			FigureVanish {Tag = "Dummy_CS_02_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_02_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_02_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_02_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_02_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_02_Nightsong02"},
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
					MapFlagIsTrue {Name = "mf_P412_StartGeweihter1CS"},
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
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 217, Y = 176.4, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 215.576, Y = 175.426, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 215.949, Y = 177.433, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 214.572, Y = 176.636, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 213.192, Y = 177.339, },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 213.181, Y = 175.575, },
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 211.54, Y = 176.501, },
			CutsceneFigureTeleport {Tag = "Illusionist", X = 249.41, Y = 177.4, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 90},
			FigureLookAtDirection {Tag = "Illusionist", Direction = 270},
			-- Avatar und Mordecay laufen los
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 228.2, Y = 176.4, },
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 224.381, Y = 175.575, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
	},
	OnOneTimeEvent -- Wind und Yasha laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 226.776, Y = 175.426, },
			FigureSimpleWalk {Tag = "pl_HumanHeroYasha", X = 224.392, Y = 177.339, },
		},
	},
	OnOneTimeEvent -- Whisper und Nightsong laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 227.149, Y = 177.433, },
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 222.74, Y = 176.501, },
		},
	},
	OnOneTimeEvent -- Caine läuft los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.6},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 225.772, Y = 176.636, },
		},
	},
	OnOneTimeEvent -- Doppelgänger Wind spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_Wind"},
			EntityTimerStart {Name = "et_Doubles_Spawn1"},
		},
	},
	OnOneTimeEvent -- Doppelgänger NightSong spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Doubles_Spawn1", Seconds = Double_Spawn_Timer},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_NightSong"},
			EntityTimerStart {Name = "et_Doubles_Spawn2"},
		},
	},
	OnOneTimeEvent -- Doppelgänger Whisper spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Doubles_Spawn2", Seconds = Double_Spawn_Timer},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_Whisper"},
			EntityTimerStart {Name = "et_Doubles_Spawn3"},
		},
	},
	OnOneTimeEvent -- Doppelgänger Mordecay spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Doubles_Spawn3", Seconds = Double_Spawn_Timer + 1.3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_Mordecay"},
			EntityTimerStart {Name = "et_Doubles_Spawn4"},
		},
	},
	OnOneTimeEvent -- Doppelgänger Caine spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Doubles_Spawn4", Seconds = Double_Spawn_Timer},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_Caine"},
			EntityTimerStart {Name = "et_Doubles_Spawn5"},
		},
	},
	OnOneTimeEvent -- Doppelgänger Yasha spawnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Doubles_Spawn5", Seconds = Double_Spawn_Timer},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnIllusion_Yasha"},
		},
	},	
	OnOneTimeEvent -- State-Wechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
		},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 18},
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
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_EndGeweihter1CS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};