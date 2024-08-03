--************************************************************
--**														**
--**		Rushwater Downs Convoi							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'Falkmar'",
		"'Helger'",
		"'Horse1'",
		"'Horse2'",
		"'Horse3'",
		"'Horse4'",
		"'Horse5'",
		"'CronachGuards1'",
		"'CronachGuards2'",
		"'CronachGuards3'",
		"'CronachGuards4'",
		"'LyrraineCrossbowmen1'",
		"'LyrraineCrossbowmen2'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_Cutscene"},
			AvatarFlagIsTrue {Name = "af_P303_PlayerNearCity"},
			FigureIsDead {Tag = "OrcAttack1"},
			FigureIsDead {Tag = "OrcAttack2"},
			FigureIsDead {Tag = "OrcAttack3"},
			FigureIsDead {Tag = "OrcAttack4"},
			FigureIsDead {Tag = "OrcAttack5"},
			FigureIsDead {Tag = "OrcAttack6"},
			FigureIsDead {Tag = "OrcAttack7"},
			FigureIsDead {Tag = "OrcAttack8"},
			FigureIsDead {Tag = "OrcAttack9"},
			FigureIsDead {Tag = "OrcAttack10"},
			FigureIsDead {Tag = "OrcAttack11"},
			FigureIsDead {Tag = "OrcAttack12"},
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 302, Y = 243},
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 308, Y = 265},
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 308, Y = 254},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSStart"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P303_CutsceneShown"},	
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				EntityTimerIsElapsed {Name = "et_CSStart", Seconds = 7},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure(Main)
			FigureTeleport {Tag = "pl_HumanAvatar", X = 308.09, Y = 269.185},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 179.037},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 306.627, Y = 269.698},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 168.541},
			FigureTeleport {Tag = "Falkmar", X = 306.008, Y = 271.776},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 132.444},
			FigureTeleport {Tag = "Helger", X = 308.259, Y = 274.072},
			FigureLookAtDirection {Tag = "Helger", Direction = 28.6479},
			-- Teleport der Akteure(Side)
			FigureTeleport {Tag = "Horse1", X = 306.6, Y = 260.4},
			FigureLookAtDirection {Tag = "Horse1", Direction = 180},
			FigureTeleport {Tag = "Horse2", X = 309.4, Y = 259},
			FigureLookAtDirection {Tag = "Horse2", Direction = 180},
			FigureTeleport {Tag = "Horse3", X = 306.6, Y = 256.2},
			FigureLookAtDirection {Tag = "Horse3", Direction = 180},
			FigureTeleport {Tag = "Horse4", X = 309.4, Y = 254.8},
			FigureLookAtDirection {Tag = "Horse4", Direction = 180},
			FigureTeleport {Tag = "Horse5", X = 308, Y = 252},
			FigureLookAtDirection {Tag = "Horse5", Direction = 180},
			FigureTeleport {Tag = "CronachGuards1", X = 299.657, Y = 273.478},
			FigureLookAtDirection {Tag = "CronachGuards1", Direction = 0},
			FigureTeleport {Tag = "CronachGuards2", X = 301.937, Y = 273.33},
			FigureLookAtDirection {Tag = "CronachGuards2", Direction = 0},
			FigureTeleport {Tag = "CronachGuards3", X = 315.269, Y = 272.301},
			FigureLookAtDirection {Tag = "CronachGuards3", Direction = 0},
			FigureTeleport {Tag = "CronachGuards4", X = 317.199, Y = 272.09},
			FigureLookAtDirection {Tag = "CronachGuards4", Direction = 0},
			FigureTeleport {Tag = "LyrraineCrossbowmen1", X = 319.178, Y = 271.612},
			FigureLookAtDirection {Tag = "LyrraineCrossbowmen1", Direction = 0},
			FigureTeleport {Tag = "LyrraineCrossbowmen2", X = 296.931, Y = 273.765},
			FigureLookAtDirection {Tag = "LyrraineCrossbowmen2", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			FigureCutsceneTalkJobSet {Tag = "Helger"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Timer stoppen und neuen setzen
			EntityTimerStop {Name = "et_CSStart"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- -- Helger: Helger1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Helger1", Tag = "Helger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Falkmar: Falkmar11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar11", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Falkmar: Falkmar12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar12", Tag = "Falkmar"},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 40.77},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Helger: Helger2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Helger2", Tag = "Helger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Helger: Helger3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Helger3", Tag = "Helger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
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
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tore öffnen sich
			GateSetOpen {Tag = "TownGate"},
			GateSetOpen {Tag = "TownGate2"},
			GateSetOpen {Tag = "Towngate3"},
			-- SOUND: Gate Open Play
			MapFlagSetTrue {Name = "mf_P303_Rushwater_Downs_02_SOUND_Play_Gate_Open"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
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
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "Helger"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Falkmar"},
			-- Scriptingkram für die Karte
			AvatarFlagSetFalse {Name = "af_P303_PlayerNearCity"},
			QuestSetSolved {Quest = "FalkmarMustLive"},
			QuestSetActive {Quest = "RushwaterPart2SpeakToMatricus"},
			QuestSetSolved {Quest = "RushwaterPart1ConvoiToTown"},
			FogOfWarRevealAtEntity {Tag = "Matricus", Range = 7},
			DialogTypeSetMainQuest {Tag = "Matricus"},
			DialogSetEnabled {Tag = "Matricus"},
			-- Timer für die Walkbefehle
			EntityTimerStart {Name = "et_CStimerWalk"},
		},
	},
	OnOneTimeEvent	-- Pferde und Falkmar laufen in die Stadt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerWalk", Seconds = 1},
		},
		Actions =
		{
			-- Pferde laufen zum Stall
			FigureWalk {Tag = "Horse1", X = 292, Y = 354},
			FigureWalk {Tag = "Horse2", X = 295, Y = 347},
			FigureWalk {Tag = "Horse3", X = 288, Y = 349},
			FigureWalk {Tag = "Horse4", X = 290, Y = 349},
			FigureWalk {Tag = "Horse5", X = 293, Y = 356},
			FigureTeamTransfer {Team = "tm_Neutral", Tag = "Horse1"},
			FigureTeamTransfer {Team = "tm_Neutral", Tag = "Horse2"},
			FigureTeamTransfer {Team = "tm_Neutral", Tag = "Horse3"},
			FigureTeamTransfer {Team = "tm_Neutral", Tag = "Horse4"},
			FigureTeamTransfer {Team = "tm_Neutral", Tag = "Horse5"},
			-- Falkmar läuft in die Stadt
			FigureWalk {Tag = "Falkmar", X = 296.8, Y = 331.8},
			-- Timer stoppen		
			EntityTimerStart {Name = "et_CStimerWalk"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};