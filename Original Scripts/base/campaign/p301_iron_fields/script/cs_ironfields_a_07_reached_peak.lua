--************************************************************
--**														**
--**		Iron Fiels A Reached Peak						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'Ur'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera zeigt Ur
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA07"},
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Ur", Range = 20},
					QuestIsActive {Quest = "TalkToUr"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 76.544, Y = 630.119},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 165},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 78.808, Y = 629.618},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 185},
			FigureTeleport {Tag = "Ur", X = 84.852, Y = 637.722},
			FigureLookAtDirection {Tag = "Ur", Direction = 272},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "Ur"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},  
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},      
};
State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar11
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_A_07_Take02", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar kniet sich hin
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_A_07_Avatar_Kneel_Down"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Ur1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur1", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar steht auf
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_A_07_Avatar_Kneel_Up"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar12
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.85},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Schattenlied
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- NightSong7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take07", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_A_07_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong7", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Ur2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Ur2", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- NightSong8
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong8", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Ur3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur3", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- NightSong9
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take11", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_A_07_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong9", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Ur4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur4", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- NighSong9a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NighSong9a", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Ur5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take15", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_A_07_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Ur5", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Avatar13
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Ur6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur6", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Ur7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur7", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Ur7a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur7a", Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Avatar14
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_07_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
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
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
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
			FigureStop {Tag = "Ur"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Ur"},
			-- Scriptingkram für die Karte
			MapTimerStart {Name = "mt_P301_TalkedToUr"},
			QuestSetSolved {Quest = "TalkToUr"},
			--QuestSetSolved {Quest = "ProtectNightsong"},
			QuestSetSolved {Quest = "IronFieldsPart2WarnFortress"},
			QuestSetSolved {Quest = "Chapter1ComingHome"},
			QuestSetSolved {Quest = "Prolog"},
			QuestSetActive {Quest = "SF2_1_Akt"},
			QuestSetActive {Quest = "1_Kapitel"},
--			QuestSetActive {Quest = "SchattenliedMustLive"},
			QuestSetActive {Quest = "IronFieldsPart3ToNorimar"},
			FogOfWarRevealAtEntity {Tag = "IronFieldsNordWest", Range = 10 , FogOfWarId = 12},
			MapFlagSetTrue {Name = "mf_P301_SecondUrCS"}
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};