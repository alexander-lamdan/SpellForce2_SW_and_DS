--************************************************************
--**														**
--**		Gate of Swords Gate								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'pl_HumanKor'",
		"'GateKeeper1'",
		"'GateKeeper2'",
		"'GateKeeper3'",
		"'GateKeeper4'",
		"'GateKeeper5'",
		"'GateKeeper6'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					FigureIsInRange	{Range = 8, X = 488, Y = 589, Tag = "pl_HumanAvatar"},
					PlayerFigureIsNotInRange {Player = "pl_EnemyPact", Range = 20, X = 488, Y = 589},
					FigureIsDead {Tag = "GateBoss"},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 490.95, Y = 598.501},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			FigureTeleport {Tag = "pl_HumanKor", X = 487.602, Y = 598.631},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 0},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 489.069, Y = 599.409},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 0},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightSong"},
			-- Avatar, Schattenlied und Kor gehen zum Tor
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 490.95, Y = 590.841},
			FigureSimpleWalk {Tag = "pl_HumanKor", X = 487.602, Y = 590.872},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 489.069, Y = 592.198},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kor: Kor9
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanKor"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Kor9", Tag = "pl_HumanKor"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Erstes Tor geht auf
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			GateSetOpen	{Tag = "Wall_Gate01"},
			-- Talkjob von Kor beenden
			FigureStop {Tag = "pl_HumanKor"},
			-- SOUND: Gate1 Open
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate1_Open"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Zweites Tor geht auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Wall_Gate02"},
			-- SOUND: Gate2 Open
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate2_Open"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Trolle laufen durch das Tor Part 1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "GateKeeper1", X = 488.435, Y = 606.123},
			FigureSimpleRun {Tag = "GateKeeper4", X = 488.435, Y = 606.123},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Trolle laufen durch das Tor Part 2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "GateKeeper2", X = 488.435, Y = 606.123},
			FigureSimpleRun {Tag = "GateKeeper6", X = 488.435, Y = 606.123},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Trolle laufen durch das Tor Part 3
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "GateKeeper3", X = 488.435, Y = 606.123},
			FigureSimpleRun {Tag = "GateKeeper5", X = 488.435, Y = 606.123},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kor: Kor10
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor10", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kor geht durch das Tor
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanKor", X = 487.602, Y = 560.584},
			-- Teleport der Gatekeeper an finale Positionen
			FigureTeleport {Tag = "GateKeeper1", X = 488.435, Y = 606.123},
			FigureLookAtDirection {Tag = "GateKeeper1", Direction = 180},
			FigureTeleport {Tag = "GateKeeper2", X = 493.316, Y = 606.1},
			FigureLookAtDirection {Tag = "GateKeeper2", Direction = 157.082},
			FigureTeleport {Tag = "GateKeeper3", X = 483.714, Y = 607.481},
			FigureLookAtDirection {Tag = "GateKeeper3", Direction = 231.566},
			FigureTeleport {Tag = "GateKeeper4", X = 495.246, Y = 612.296},
			FigureLookAtDirection {Tag = "GateKeeper4", Direction = 145.623},
			FigureTeleport {Tag = "GateKeeper5", X = 490.24, Y = 612.776},
			FigureLookAtDirection {Tag = "GateKeeper5", Direction = 180},
			FigureTeleport {Tag = "GateKeeper6", X = 482.154, Y = 612.918},
			FigureLookAtDirection {Tag = "GateKeeper6", Direction = 202.918},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar geht durch das Tor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 490.95, Y = 560.553},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Schattenlied geht durch das Tor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 489.069, Y = 561.91},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Erstes Tor schließt sich
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			GateSetClosed {Tag = "Wall_Gate01"},
			-- SOUND: Gate1 Close
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate1_Close"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Zweites Tor schließt sich
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.5},
		},
		Actions =
		{
			GateSetClosed {Tag = "Wall_Gate02"},
			-- SOUND: Gate2 Close
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate2_Close"},			
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
			AND
			{
				FigureIsIdle {Tag = "pl_HumanAvatar"},
				FigureIsIdle {Tag = "pl_HumanNightsong"},
				FigureIsIdle {Tag = "pl_HumanKor"},
			},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightSong"},
			-- Akteure werden an finale Positione teleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 490.95, Y = 560.553},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 489.069, Y = 561.91},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 0},
			FigureTeleport {Tag = "pl_HumanKor", X = 487.602, Y = 560.584},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 0},
			-- Scriptinkram für die Karte
			AvatarFlagSetTrue {Name = "af_P309_CutsceneGateEnd"},
			QuestSetSolved {Quest = "ThroughTheGate"},
			QuestSetActive {Quest = "ToIronLord"},
			FigurePlayerTransfer {Tag = "Kor", Player = "pl_Kor"},
			FogOfWarRevealAtEntity {Tag = "IronLord", Range = 80, Height = 169},
			PlayerHeroRemove {Player = "pl_Human", Tag = "Kor"},
			-- Weg ist der Kor
			FigureOutcry {TextTag = "System2", Tag = "System_Npc"},
			PlayerBuildingTeamTransfer {Team = "tm_Hero"},
			-- Teleport der Helden, hinter das Tor
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 485.67, Y = 561.482},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 491.685, Y = 563.238},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 486.697, Y = 563.558},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 492.699, Y = 561.296},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 0},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};