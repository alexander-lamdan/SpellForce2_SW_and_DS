--************************************************************
--**														**
--**		Uram Gor Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanKor'",
		"'DwarfFred'",
		"'Orc_Mercenary_01'",
		"'Orc_Mercenary_02'",
		"'OrkArbeiter01'",
		"'OrkArbeiter02'",
		"'OrkArbeiter03'",
		"'OrkArbeiter04'",
		"'OrkArbeiter05'",
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
			FigureVanish {Tag = "CS_01_Portal_Walk_To"},
			FigureVanish {Tag = "CS_01_SillyDwarf_Goto"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Kor01"},
			FigureVanish {Tag = "CS_02_Kor02"},
			FigureVanish {Tag = "CS_02_Truchsess01"},
			FigureVanish {Tag = "CS_02_Truchsess02"},
			FigureVanish {Tag = "CS_02_Mercenary01"},
			FigureVanish {Tag = "CS_02_Mercenary02"},
			FigureVanish {Tag = "CS_02_Worker01"},
			FigureVanish {Tag = "CS_02_Worker02"},
			FigureVanish {Tag = "CS_02_Worker03"},
			FigureVanish {Tag = "CS_02_Worker04"},
			FigureVanish {Tag = "CS_02_Worker05"},
		},
	},	
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			--MapFlagIsTrue	{Name = "mf_Cutscene01"},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 67.2, Y = 106.4},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 175},
			FigureTeleport {Tag = "pl_HumanKor", X = 70, Y = 106.4},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 185},
			FigureTeleport {Tag = "OrkArbeiter01", X = 65.8, Y = 103.6},
			FigureLookAtDirection	{Tag = "OrkArbeiter01", Direction = 176},
			FigureTeleport {Tag = "OrkArbeiter02", X = 72.8, Y = 103.6},
			FigureLookAtDirection	{Tag = "OrkArbeiter02", Direction = 245},
			FigureTeleport {Tag = "OrkArbeiter03", X = 74.2, Y = 102.2},
			FigureLookAtDirection	{Tag = "OrkArbeiter03", Direction = 222},
			FigureTeleport {Tag = "OrkArbeiter04", X = 64.4, Y = 105},
			FigureLookAtDirection	{Tag = "OrkArbeiter04", Direction = 154},
			FigureTeleport {Tag = "OrkArbeiter05", X = 74.2, Y = 105},
			FigureLookAtDirection	{Tag = "OrkArbeiter05", Direction = 257},
			FigureTeleport {Tag = "Orc_Mercenary_01", X = 64.627, Y = 113.735},
			FigureLookAtDirection	{Tag = "Orc_Mercenary_01", Direction = 126.051},
			FigureTeleport {Tag = "Orc_Mercenary_02", X = 64.673, Y = 111.963},
			FigureLookAtDirection	{Tag = "Orc_Mercenary_02", Direction = 114.592},
			FigureTeleport {Tag = "DwarfFred", X = 68.526, Y = 124.6},
			FigureLookAtDirection	{Tag = "DwarfFred", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Start_Avatar01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Start_Avatar01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Tore öffnen sich
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tore werden geöffnet
			GateSetOpen	{Tag = "DoorStart01"},
			GateSetOpen	{Tag = "DoorStart02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Verrückter Zwerg rennt aus dem Tor & Verrückter Zwerg: SillyDwarf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SillyDwarf", Tag = "DwarfFred"},
			-- Zwerg rennt los
			FigureSimpleRun {Tag = "DwarfFred", X = 68.526, Y = 98.998},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 3.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Zwerg verschwindet im Portal
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "DwarfFred"},
		},
		Actions =
		{
			FigureVanish {Tag = "DwarfFred"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kor: Start_Kor01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Start_Kor01", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kor: Start_Kor02
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
			CameraTakeAddToTrack {File = "CS_01_Take06_B", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Start_Kor02", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kor: Start_Kor03
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
			CutsceneSay {TextTag = "Start_Kor03", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kor: Start_Kor04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Start_Kor04", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kor: Start_Kor05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Start_Kor05", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
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
			FigureStop {Tag = "pl_HumanKor"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanKor"},
			-- Helden werden auf Avatar ausgerichtet
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroJared", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroShae", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "pl_HumanAvatar"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue	{Name = "mf_CutsceneStartEnded"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};