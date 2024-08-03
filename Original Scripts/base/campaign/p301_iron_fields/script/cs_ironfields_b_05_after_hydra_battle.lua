--************************************************************
--**														**
--**		Iron Fields Part II After Hydra Battle			**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'FalkmarMission'",
		"'IoMission'",
		"'pl_HumanNightsong'",
	}
}
State
{
	StateName = "INIT",
	OnOneTimeEvent	-- Timer wird gestartet nachdem der Verschlinger getötet wurde(5 Sekunden, Todesanimation dauert 5.92s)
	{
		Conditions =
		{
			FigureIsDead {Tag = "Hydra"},
			MapFlagIsTrue {Name = "mf_P301_Hydra_Spawned"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSStarttimer"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Avatar, Io, Falkmar und Leiche der Hydra
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB05"},
				AND
				{
					EntityTimerIsElapsed {Name = "et_CSStarttimer", Seconds = 5},
					QuestIsActive {Quest = "KillHydra"},
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
			CameraTakeAddToTrack {File = "CS_B_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 68.6, Y = 646.8},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 71.4, Y = 645.4},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 260},
			FigureTeleport {Tag = "FalkmarMission", X = 65.8, Y = 644},
			FigureLookAtDirection {Tag = "FalkmarMission", Direction = 135},
			FigureTeleport {Tag = "IoMission", X = 67.2, Y = 642.6},
			FigureLookAtDirection {Tag = "IoMission", Direction = 165},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "FalkmarMission"},
			FigureCutsceneTalkJobSet {Tag = "IoMission"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "FalkmarMission"},
			CutsceneFigureWeaponsHide {Tag = "IoMission"},
			EntityTimerStop {Name = "et_CSStarttimer"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar22
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Falkmar: Falkmar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Falkmar2", Tag = "FalkmarMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};


State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Avatar23
	{
		Conditions =
		{	CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar23", Tag = "pl_HumanAvatar"},
			-- Talkjobs Avatar
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: Avatar24
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar24", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Falkmar: Falkmar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar3", Tag = "FalkmarMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Io: Io2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Io2", Tag = "IoMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Falkmar: Falkmar4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar4", Tag = "FalkmarMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar(Malacays Stimme): Avatar25
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar25", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Io: Io3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Io3", Tag = "IoMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar: Avatar26
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Avatar26", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Falkmar: Falkmar5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar5", Tag = "FalkmarMission"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
			CameraTakeAddToTrack {File = "CS_B_05_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 74.2, Y = 616},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Teleport Avatar und Schattenlied
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6.5},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 645.775, Y = 63.2692},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 266.608},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 635.311, Y = 63.489},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 90},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar: Avatar27
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar27", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14a",
	},
};

State
{
	StateName = "Cutscene14a",
	OnOneTimeEvent	-- Schattenlied kommt angelaufen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 643.362, Y = 63.489},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Schattenlied: NightSong12, Talkjob Schattenlied
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NightSong12", Tag = "pl_HumanNightsong"},
			-- Talkjob Schattenlied
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Avatar: Avatar27a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar27a", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Schattenlied: NightSong12a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong12a", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Avatar: Avatar27b
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar27b", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Avatar: Avatar27c
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar27c", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Avatar: Avatar28
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take18b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar28", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Schattenlied: NightSong13
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong13", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Avatar: Avatar29
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar29", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Schattenlied: NightSong14
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NightSong14", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Malacays Stimme: Malacay1 (Kamera auf Avatar)
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_05_Take21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Malacay1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
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
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
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
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "FalkmarMission"},
			FigureStop {Tag = "IoMission"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "FalkmarMission"},
			CutsceneFigureWeaponsShow {Tag = "IoMission"},
			-- Scriptingkram für die Karte
			QuestSetSolved {Quest = "KillHydra"},
			MapFlagSetTrue {Name = "mf_P301_HydraDead"},
			QuestSetSolved {Quest = "IronfieldsPart22SaveShaikur"},
			QuestSetSolved {Quest = "4_Kapitel"},
			QuestSetSolved {Quest = "SF2_1_Akt"},
			QuestSetActive {Quest = "SF2_2_Akt"},
			QuestSetActive {Quest = "1_KapitelAkt2"},
			QuestSetActive {Quest = "IronFieldsPart23FleeToGoS"},
			PlayerTravelEnable {},
			PortalEnable {Tag = "Portal_Norimar"},
			PortalEnable {Tag = "Needle"},
			PortalEnable {Tag = "GateOfSwords"},
			--FogOfWarCloak {FogOfWarId = 17},
			PlayerBuildingTeamTransfer {Team = "tm_Team1"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
 };
