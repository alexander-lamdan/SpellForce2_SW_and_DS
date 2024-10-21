--************************************************************
--**														**
--**		Gate of Sowrds Intro							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'Attacker1'",
		"'Attacker2'",
		"'Attacker3'",
		"'Attacker4'",
		"'Attacker5'",
		"'Attacker6'",
		"'Attacker7'",
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
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			FigureVanish {Tag = "CS_01_Shadowsong02"},
			FigureVanish {Tag = "CS_01_TeleportDummy"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Kor01"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Shadowsong02"},
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Avatar02"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			FigureVanish {Tag = "CS_03_Avatar03"},
			FigureVanish {Tag = "CS_03_Kor01"},
			FigureVanish {Tag = "CS_03_Kor02"},
			FigureVanish {Tag = "CS_03_Kor03"},
			FigureVanish {Tag = "CS_03_Shadowsong01"},
			FigureVanish {Tag = "CS_03_Shadowsong02"},
			FigureVanish {Tag = "CS_03_Shadowsong03"},
			FigureVanish {Tag = "CS_03_Troll01"},
			FigureVanish {Tag = "CS_03_Troll02"},
			FigureVanish {Tag = "CS_03_Troll03"},
			FigureVanish {Tag = "CS_03_Troll04"},
			FigureVanish {Tag = "CS_03_Troll05"},
			FigureVanish {Tag = "CS_03_Troll06"},
			FigureVanish {Tag = "CS_03_Bor01"},
			FigureVanish {Tag = "CS_03_Lya01"},
			FigureVanish {Tag = "CS_03_Jared01"},
			FigureVanish {Tag = "CS_03_Shae01"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_04_Avatar01"},
			FigureVanish {Tag = "CS_04_Avatar02"},
			FigureVanish {Tag = "CS_04_Kor01"},
			FigureVanish {Tag = "CS_04_Kor02"},
			FigureVanish {Tag = "CS_04_Shadowsong01"},
			FigureVanish {Tag = "CS_04_Shadowsong02"},
			FigureVanish {Tag = "CS_04_IronLord01"},
			FigureVanish {Tag = "CS_04_Lokar01"},
			-- fünfte Cutscene Vanish
			FigureVanish {Tag = "CS_05_Avatar01"},
			FigureVanish {Tag = "CS_05_Mordecay01"},
			-- sechste Cutscene Vanish
			FigureVanish {Tag = "CS_06_Avatar01"},
			FigureVanish {Tag = "CS_06_Avatar02"},
			FigureVanish {Tag = "CS_06_Kor01"},
			FigureVanish {Tag = "CS_06_Kor02"},
			FigureVanish {Tag = "CS_OracleSpeaker"},
			-- siebte Cutscene Vanish
			FigureVanish {Tag = "CS_07_Mardrag01"},
			FigureVanish {Tag = "CS_07_Mardrag02"},
			-- achte Cutscene Vanish
			FigureVanish {Tag = "CS_08_Avatar01"},
			FigureVanish {Tag = "CS_08_Kor01"},
			-- neunte Cutscene Vanish
			FigureVanish {Tag = "CS_09_Avatar01"},
			FigureVanish {Tag = "CS_09_Avatar02"},
			FigureVanish {Tag = "CS_09_IronLord01"},
			FigureVanish {Tag = "CS_09_IronLord02"},
			FigureVanish {Tag = "CS_09_IronLord03"},
			FigureVanish {Tag = "CS_09_Shadowsong01"},
			FigureVanish {Tag = "CS_09_Shadowsong02"},
			-- zehnte Cutscene Vanish
			FigureVanish {Tag = "CS_10_Avatar01"},
			FigureVanish {Tag = "CS_10_Mordecay01"},
			FigureVanish {Tag = "CS_10_Berserker01"},
			-- elfte Cutscene Vanish
			FigureVanish {Tag = "CS_11_Avatar01"},
			FigureVanish {Tag = "CS_11_Mordecay01"},
			-- zwölfte Cutscene Vanish
			FigureVanish {Tag = "CS_12_Avatar01"},
			FigureVanish {Tag = "CS_12_Bor01"},
			FigureVanish {Tag = "CS_12_Lya01"},
			FigureVanish {Tag = "CS_12_Jared01"},
			FigureVanish {Tag = "CS_12_Shae01"},
			FigureVanish {Tag = "CS_12_Shadowsong01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Portal
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_Cutscene01"},
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
			FigureTeleport {Tag = "pl_HumanAvatar", X = 473.415, Y = 676.144},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 475.78, Y = 676.313},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightSong"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightSong"},
			-- Effekt auf Avatar
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			-- Effekt auf Portal
			EffectStart {Tag = "PortalStart", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 489.854, Y = 690.022},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar läuft aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 488.942, Y = 684.286},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Effekt auf Schattenlied
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanNightSong", File = "Effect_Spawn_Unit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Schattenlied wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanNightSong", X = 489.854, Y = 690.022},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Schattenlied läuft aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanNightSong", X = 490.744, Y = 684.25},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Schattenlied: ShadowSong1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "ShadowSong1", Tag = "pl_HumanNightSong"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 4.63},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 358.235},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Schattenlied: ShadowSong2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer muss bleiben wegen Kamerafahrt
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "ShadowSong2", Tag = "pl_HumanNightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
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
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
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
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightSong"},
			-- Effekt auf Portal stoppen
			EffectStop {Tag = "PortalStart"},
			-- Objekt MordecayAlive2 wird gelöscht(damit kein Dialogfehler kommt, erst nach der ersten Cutscene)
			ObjectVanish {Tag = "MordecayAlive2"},
			-- Scriptingkram für die Karte
			MapTimerStart {Name = "mt_P309_CutsceneEnd"},
			FogOfWarReveal {X = 267, Y = 608, Range = 20, Height = 102},
			-- Questen solven
			QuestSetActive {Quest = "GoSPart1ToSwordwall"},
			QuestSetActive {Quest = "ReachKor"},
			QuestSetSolved  {Quest = "1_KapitelAkt2"},
			QuestSetSolved  {Quest = "IronFieldsPart23FleeToGoS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};