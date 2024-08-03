--************************************************************
--**														**
--**		Underhall Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Skjadir_Blutaxt'",
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
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Avatar03"},
			FigureVanish {Tag = "CS_01_Jandrim01"},
			FigureVanish {Tag = "CS_01_Bor01"},
			FigureVanish {Tag = "CS_01_Bor02"},
			FigureVanish {Tag = "CS_01_Lya01"},
			FigureVanish {Tag = "CS_01_Lya02"},
			FigureVanish {Tag = "CS_01_Jared01"},
			FigureVanish {Tag = "CS_01_Jared02"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Bor01"},
			FigureVanish {Tag = "CS_02_Lya01"},
			FigureVanish {Tag = "CS_02_Jandrim01"},
			FigureVanish {Tag = "CS_02_Jared01"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Bor01"},
			FigureVanish {Tag = "CS_03_Lya01"},
			FigureVanish {Tag = "CS_03_Jared01"},
			FigureVanish {Tag = "CS_03_Jandrim01"},
			FigureVanish {Tag = "CS_03_Thane01"},
			ObjectVanish {Tag = "CS_03_Corpse01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Effekt auf Avatar und Teleport außer Sichtweite
	{
		Conditions =
		{
			--CutsceneFiguresAreAlive {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},	
			FigureTeleport {Tag = "pl_HumanAvatar", X = 62.9151, Y = 115.981},
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			-- Helden wegstellen und am Ende der Cutscene wieder holen, solange
			-- es kein RenderOnly gibt
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 102.524, Y = 122.16},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 101.559, Y = 123.095},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 100.495, Y = 124.023},
			-- Taskjob für Skjadir Blutaxt
			FigureCutsceneTalkJobSet {Tag = "Skjadir_Blutaxt"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Skjadir_Blutaxt"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar Teleport ins Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 95.6021, Y = 120.304}, 
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 325.05},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar geht aus dem Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 92.3258, Y = 118.969},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Jandrim Spawn im Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_01_Jandrim_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Jandrim geht aus dem Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Jandrim", X = 94.0188, Y = 117.173},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Skjadir_Blutaxt: Sjadir01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			FigureIsIdle {Tag = "Jandrim"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 337.655},
			FigureLookAtDirection {Tag = "Jandrim", Direction = 295.256},
			-- Talkjobs für Avatar und Jandrim
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Jandrim"},
			CutsceneSay {TextTag = "Sjadir01", Tag = "Skjadir_Blutaxt"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Jandrim: Jandrim01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Jandrim01", Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Skjadir_Blutaxt: Sjadir02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sjadir02", Tag = "Skjadir_Blutaxt"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Skjadir_Blutaxt: Sjadir03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sjadir03", Tag = "Skjadir_Blutaxt"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Jandrim: Jandrim02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Jandrim02", Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Skjadir_Blutaxt: Sjadir04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sjadir04", Tag = "Skjadir_Blutaxt"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Jandrim: Jandrim03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Jandrim03", Tag = "Jandrim"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 32.0862},			
			FigureLookAtDirection {Tag = "Jandrim", Direction = 242.544},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Avatar: Avatar12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Jandrim: Jandrim04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Jandrim04", Tag = "Jandrim"},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim"},
			FigureLookAtEntity	{Tag = "Jandrim", TargetTag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Jandrim: Jandrim05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Jandrim05", Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
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
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	--OnCutsceneFigureDespawnEvent {},
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
			-- Helden werden umteleportiert
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 95.5898, Y = 113.873},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 222.49},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 97.5965, Y = 113.502},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 232.23},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 96.0527, Y = 111.666},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 229.366},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Jared"},
			FigureStop {Tag = "Skjadir_Blutaxt"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Skjadir_Blutaxt"},
			CutsceneFigureWeaponsShow {Tag = "Jandrim"},
			MapFlagSetTrue	{Name = "mf_CutsceneJandrimStartEnded"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};

