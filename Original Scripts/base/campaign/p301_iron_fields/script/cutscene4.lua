---------------------------------------------------------------------------------
----
----		Cutscene bei Missionsbeginn
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "Init",
--	OnOneTimeEvent
--	{
--		GotoState = "Cutscene3",
--		Conditions =
--		{
--			MapFlagIsTrue {Name = "mf_P301_NightSongCutsceneStart"},
--			MapFlagIsTrue {Name = "mf_P301_Tutorial"},
--		},
--		Actions =
--		{
--			
--		},
--	},
--}
--
--
--
--State
--{
--	StateName = "Cutscene3",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{  
--		},
--		Actions = 
--		{
--			CutsceneBegin {},
--			CameraSet {X = 568.64, Y = 61.67, Z = 417.23, LookAtX = 567.71, LookAtY = 61.23, LookAtZ = 417.11},
--			EntityTimerStart {Name = "et_Cutscene3"},
--		},
--		
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene3", Seconds = 4},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "DarkElfRanger1", Tag = "DarkElfRanger"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene3", Seconds = 10},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "DarkElfRanger2", Tag = "DarkElfRanger"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene3", Seconds = 16},
--			},
--			Actions =
--			{
--				CameraStop {},				
--				CutsceneEnd {}, 
--				FigureTeamTransfer	{Tag = "DarkElfRanger", Team = "tm_Team2"},
--				FigureTeamTransfer	{Tag = "NightSongEncounter2", Team = "tm_Team2"},
--				QuestSetSolved {Quest = "SaveNightsong"},
--				QuestSetActive {Quest = "ProtectNightsong"},
--				MapFlagSetTrue {Name = "mf_P301_NightSongCutsceneShown"},
--				
--				-- !!! Kann erst ausgebaut werden, wenn Steady Companions technisch m�glich sind
--				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "NightSong"},
--			},
--	},
--};