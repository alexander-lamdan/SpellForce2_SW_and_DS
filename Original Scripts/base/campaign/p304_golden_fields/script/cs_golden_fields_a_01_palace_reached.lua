--************************************************************
--**														**
--**		Golden Fields Part I Palace Reached				**
--**														**
--************************************************************

-- Zum Testen vor das Schloß laufen

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Falkmar'",
		"'Schattenlied'",
		"'GeneralKaran'",
		"'GeneralEinar'",
		"'KingUlf'",
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
			FigureVanish {Tag = "CS_A_01_Avatar01"},
			FigureVanish {Tag = "CS_A_01_Avatar02"},
			FigureVanish {Tag = "CS_A_01_Avatar03"},
			FigureVanish {Tag = "CS_A_01_Avatar04"},
			FigureVanish {Tag = "CS_A_01_Avatar05"},
			FigureVanish {Tag = "CS_A_01_Falkmar01"},
			FigureVanish {Tag = "CS_A_01_Falkmar02"},
			FigureVanish {Tag = "CS_A_01_Falkmar03"},
			FigureVanish {Tag = "CS_A_01_Falkmar04"},
			FigureVanish {Tag = "CS_A_01_Shadowsong01"},
			FigureVanish {Tag = "CS_A_01_Shadowsong02"},
			FigureVanish {Tag = "CS_A_01_Shadowsong03"},
			FigureVanish {Tag = "CS_A_01_Shadowsong04"},
			FigureVanish {Tag = "CS_A_01_Shadowsong05"},
			FigureVanish {Tag = "CS_A_01_Karan01"},
			FigureVanish {Tag = "CS_A_01_Karan02"},
			FigureVanish {Tag = "CS_A_01_Karan03"},
			FigureVanish {Tag = "CS_A_01_Einar01"},
			FigureVanish {Tag = "CS_A_01_Einar02"},
			FigureVanish {Tag = "CS_A_01_Einar03"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_A_02_Avatar01"},
			FigureVanish {Tag = "CS_A_02_Avatar02"},
			FigureVanish {Tag = "CS_A_02_Jared01"},
			FigureVanish {Tag = "CS_A_02_Jared02"},
			FigureVanish {Tag = "CS_A_02_Asha01"},
			FigureVanish {Tag = "CS_A_02_Asha02"},
			ObjectVanish {Tag = "CS_A_02_Jandrim_Corpse"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_A_03_Asha01"},
			FigureVanish {Tag = "CS_A_03_Asha02"},
			FigureVanish {Tag = "CS_A_03_Avatar01"},
			FigureVanish {Tag = "CS_A_03_Avatar02"},
			FigureVanish {Tag = "CS_A_03_Jared01"},			
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_B_01_Avatar01"},
			FigureVanish {Tag = "CS_B_01_Hagard01"},
			FigureVanish {Tag = "CS_B_01_Hagard02"},
			FigureVanish {Tag = "CS_B_01_Hagard03"},
			FigureVanish {Tag = "CS_B_01_Hagard04"},
			FigureVanish {Tag = "CS_B_01_Hagard05"},
			-- fünfte Cutscene Vanish
			FigureVanish {Tag = "CS_C_01_Io01"},
			FigureVanish {Tag = "CS_C_01_Avatar01"},
			FigureVanish {Tag = "CS_C_01_Falkmar01"},
			-- sechst Cutscene Vanish
			FigureVanish {Tag = "CS_B_02_Avatar01"},
			FigureVanish {Tag = "CS_B_02_Avatar02"},
			FigureVanish {Tag = "CS_B_02_Avatar03"},
			FigureVanish {Tag = "CS_B_02_Avatar04"},
			FigureVanish {Tag = "CS_B_02_Ylia01"},
			FigureVanish {Tag = "CS_B_02_Ylia02"},
			FigureVanish {Tag = "CS_B_02_Ylia03"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Avatar läuft in Richtung "Palast"
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA01"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P304_CS01Start"},
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
			CameraTakeAddToTrack {File = "CS_A_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 440.969, Y = 280.407},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Schattenlied", X = 441.825, Y = 279.328},
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 180},
			FigureTeleport {Tag = "GeneralKaran", X = 440.969, Y = 296.671},
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 0},
			FigureTeleport {Tag = "GeneralEinar", X = 445.645, Y = 326.517},
			FigureLookAtDirection {Tag = "GeneralEinar", Direction = 325.623},
			FigureTeleport {Tag = "KingUlf", X = 441.018, Y = 326.252},
			FigureLookAtDirection {Tag = "KingUlf", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "GeneralKaran"},
			FigureCutsceneTalkJobSet {Tag = "KingUlf"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Schattenlied"},
			CutsceneFigureWeaponsHide {Tag = "GeneralKaran"},
			CutsceneFigureWeaponsHide {Tag = "GeneralEinar"},
			CutsceneFigureWeaponsHide {Tag = "KingUlf"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Avatar läuft in Richtung des Palast
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 440.969, Y = 294.595},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Schattenlied läuft in Richtung des Palast
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Schattenlied", X = 441.825, Y = 293.616},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- General Karan: PalaceArrival_01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_01", Tag = "GeneralKaran"},
			-- Teleport der Akteure(damit die Talkjobs nicht aufgehoben werden, falls die Akteure noch nicht da sind)
			FigureTeleport {Tag = "pl_HumanAvatar", X = 440.969, Y = 294.595},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Schattenlied", X = 441.825, Y = 293.616},
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 180},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			FigureCutsceneTalkJobSet {Tag = "Schattenlied"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: PalaceArrival_02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05a",
	},
};

State
{
	StateName = "Cutscene05a",
	OnOneTimeEvent	-- General Karan: PalaceArrival_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_03", Tag = "GeneralKaran"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05b",
	},
};

State
{
	StateName = "Cutscene05b",
	OnOneTimeEvent	-- Falkmar wird umteleportiert und kommt angelaufen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Falkmar wird teleportiert
			FigureTeleport {Tag = "Falkmar", X = 440.239, Y = 279.169},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 180},
			-- Falkmar kommt angelaufen
			FigureSimpleWalk {Tag = "Falkmar", X = 440.239, Y = 293.413},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Falkmar: PalaceArrival_04
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Falkmar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take05a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_04", Tag = "Falkmar"},
			-- Talkjobs Falkmar
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- General Karan geht zur Seite
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "GeneralKaran", X = 436.728, Y = 296.671},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar geht weiter, vorbei an General Karan
	{
		Conditions =
		{
			FigureIsIdle {Tag = "GeneralKaran"},
		},
		Actions =
		{
			-- Ausrichten von Karan
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 90},
			-- Avatar geht los
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 440.969, Y = 312.689},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Schattenlied geht weiter, vorbei an General Karan
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			-- Karan salutiert
			FigureAnimPlayOnce	{Tag = "GeneralKaran", File = "base/gfx/figures/hero/figure_hero_male_emote_military.ska"},
			-- Schattenlied geht los
			FigureSimpleWalk {Tag = "Schattenlied", X = 441.825, Y = 311.873},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Falkmar geht weiter, vorbei an General Karan
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			-- Falkmar geht los
			FigureSimpleWalk {Tag = "Falkmar", X = 440.239, Y = 311.67},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

-- BLEEEEEEEEEEENDEEEEEEEEEEEEEEEEEEEEEEEEEE!

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Umteleportieren der Figuren
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 441.018, Y = 323.382},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Falkmar", X = 439.288, Y = 322.414},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 165},
			FigureTeleport {Tag = "Schattenlied", X = 442.61, Y = 322.414},
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 195},
			FigureTeleport {Tag = "GeneralKaran", X = 442.929, Y = 318.375},
			FigureLookAtDirection {Tag = "GeneralKaran", Direction = 211.459},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			FigureCutsceneTalkJobSet {Tag = "Schattenlied"},
			FigureCutsceneTalkJobSet {Tag = "KingUlf"},
			FigureCutsceneTalkJobSet {Tag = "GeneralEinar"},
			FigureCutsceneTalkJobSet {Tag = "GeneralKaran"},
		},	
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_05
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "PalaceArrival_05", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar: PalaceArrival_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Schattenlied: PalaceArrival_07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_07", Tag = "Schattenlied"},
			-- Falkmar schaut zu Schattenlied
			FigureLookAtDirection {Tag = "Falkmar", Direction = 90},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Falkmar: PalaceArrival_08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_08", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_09", Tag = "KingUlf"},
			-- Falkmar schaut wieder zum König
			FigureLookAtDirection {Tag = "Falkmar", Direction = 165},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_10", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "PalaceArrival_11", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Schattenlied: PalaceArrival_12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_12", Tag = "Schattenlied"},
			-- Falkmar schaut zu Schattenlied
			FigureLookAtDirection {Tag = "Falkmar", Direction = 90},
			-- Avatar schaut zu Falkmar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 310},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Falkmar: PalaceArrival_13
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_13", Tag = "Falkmar"},
			-- Schattenlied schaut zu Falkmar
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 270},
			-- Avatar schaut zu Schattenlied
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 35},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Schattenlied: PalaceArrival_14 & Schattenlied zieht Waffe
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_14", Tag = "Schattenlied"},
			-- Schattenlied zieht ihre Waffen
			CutsceneFigureWeaponsShow {Tag = "Schattenlied"},
			-- SOUND: Shadowsong Sword
			MapFlagSetTrue {Name = "mf_P304_Golden_Fields_A01_SOUND_Play_Shadowsong_Sword"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Avatar: PalaceArrival_15
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take16a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_15", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Falkmar: PalaceArrival_16
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_16", Tag = "Falkmar"},
			-- Avatar schaut zu Falkmar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 310},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Avatar: PalaceArrival_17
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_17", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Falkmar zieht seine Waffe
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Falkmar zieht seine Waffe
			CutsceneFigureWeaponsShow {Tag = "Falkmar"},
			-- SOUND: Falkmar Sword
			MapFlagSetTrue {Name = "mf_P304_Golden_Fields_A01_SOUND_Play_Falkmar_Sword"},
			-- Avatar schaut wieder zu Schattenlied
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 35},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Schattenlied droht Falkmar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Schattenlied", File = "base/gfx/figures/hero/figure_hero_female_emote_taunt.ska"}, -- 3.71s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- General Einar kommt angerannt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Einar rennt los	
			FigureSimpleRun {Tag = "GeneralEinar", X = 443.057, Y = 324.22},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- General Karan kommt angerannt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			-- Karan rennt los
			FigureSimpleRun {Tag = "GeneralKaran", X = 441.781, Y = 320.833},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- General Karan: PalaceArrival_18
	{
		Conditions =
		{
			FigureIsIdle {Tag = "GeneralKaran"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "PalaceArrival_18", Tag = "GeneralKaran"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31a",
	},
};

State
{
	StateName = "Cutscene31a",
	OnOneTimeEvent	-- kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
		},
		GotoState = "Cutscene31b",
	},
};

State
{
	StateName = "Cutscene31b",
	OnOneTimeEvent	-- Kamera auf Schattenlied und Falkmar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Waffen werden weggesteckt
			CutsceneFigureWeaponsHide {Tag = "Schattenlied"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureLookAtDirection {Tag = "GeneralEinar", Direction = 225},
			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- General Einar: PalaceArrival_19
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take22", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_19", Tag = "GeneralEinar"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 195},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 165},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_20
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take23", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_20", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_21
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take24", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_21", Tag = "KingUlf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene36",
	},
};

State
{
	StateName = "Cutscene36",
	OnOneTimeEvent	-- Avatar: PalaceArrival_22
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take25", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene37",
	},
};

State
{
	StateName = "Cutscene37",
	OnOneTimeEvent	-- König Ulf: PalaceArrival_23
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take26", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PalaceArrival_23", Tag = "KingUlf"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW01",
	},
};

-----------------------------------------------------------------------------------
-- zusätzlich kommen jetzt die Ex-Outcries nach der Cutscene als eigene Cutscene --
-----------------------------------------------------------------------------------

State
{
	StateName = "CutsceneNEW01",
	OnOneTimeEvent	-- Avatar geht weg
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take27", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 441.018, Y = 316.2},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW02",
	},
};

State
{
	StateName = "CutsceneNEW02",
	OnOneTimeEvent	-- Avatar: NEWAudienzEnde01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take28", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW03",
	},
};

State
{
	StateName = "CutsceneNEW03",
	OnOneTimeEvent	-- Malacay: NEWAudienzEnde02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take29", Tag = "pl_HumanAvatar", TargetTag = "pl_HumanAvatar"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde02", Tag = "Oddvoice"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW04",
	},
};

State
{
	StateName = "CutsceneNEW04",
	OnOneTimeEvent	-- Malacay: NEWAudienzEnde03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NEWAudienzEnde03", Tag = "Oddvoice"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW05",
	},
};

State
{
	StateName = "CutsceneNEW05",
	OnOneTimeEvent	-- Avatar: NEWAudienzEnde04, Schattenlied kommt angelaufen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take30", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde04", Tag = "pl_HumanAvatar"},
			-- Schattenlied kommt angelaufen
			FigureSimpleWalk {Tag = "Schattenlied", X = 442.61, Y = 317.5},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW06",
	},
};

State
{
	StateName = "CutsceneNEW06",
	OnOneTimeEvent	-- Schattenlied: NEWAudienzEnde05, Ausrichten von Schattenlied
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Schattenlied"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NEWAudienzEnde05", Tag = "Schattenlied"},
			-- Ausrichten von Schattenlied
			FigureLookAtDirection {Tag = "Schattenlied", Direction = 320},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW07",
	},
};

State
{
	StateName = "CutsceneNEW07",
	OnOneTimeEvent	-- Avatar: NEWAudienzEnde06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take31", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW08",
	},
};

State
{
	StateName = "CutsceneNEW08",
	OnOneTimeEvent	-- Malacay: NEWAudienzEnde07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take32", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde07", Tag = "Oddvoice"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW09",
	},
};

State
{
	StateName = "CutsceneNEW09",
	OnOneTimeEvent	-- Schattenlied: NEWAudienzEnde08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take33", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NEWAudienzEnde08", Tag = "Schattenlied"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "CutsceneNEW10",
	},
};

State
{
	StateName = "CutsceneNEW10",
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
		GotoState = "CutsceneNEW11",
	},
};

State
{
	StateName = "CutsceneNEW11",
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
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Falkmar"},
			FigureStop {Tag = "Schattenlied"},
			FigureStop {Tag = "GeneralEinar"},
			FigureStop {Tag = "KingUlf"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Schattenlied"},
			CutsceneFigureWeaponsShow {Tag = "GeneralKaran"},
			CutsceneFigureWeaponsShow {Tag = "GeneralEinar"},
			CutsceneFigureWeaponsShow {Tag = "KingUlf"},
			-- General Einar wird neu ausgerichtet
			FigureLookAtDirection {Tag = "GeneralEinar", Direction = 340},
			-- General Karan geht wieder zurück zu seinem Editorplatz
			EntityFlagSetTrue {Name = "ef_CS_End"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P304_CS01Finished"},
		},
	},
	OnOneTimeEvent	-- General Karan geht wieder zurück zu seinem Editorplatz
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_CS_End"},
		},
		Actions =
		{
			FigureWalk {Tag = "GeneralKaran", X = 440.969, Y = 296.671},
		},
		GotoState = "CutsceneEnd",
	},
	
};

State
{
	StateName = "CutsceneEnd",
};