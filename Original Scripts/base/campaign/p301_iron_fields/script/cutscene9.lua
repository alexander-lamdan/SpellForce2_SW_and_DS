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
--		GotoState = "Cutscene9",
--		Conditions =
--		{
--			QuestIsActive {Quest = "IronFieldsPart21EnterTheShadows"},
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
--	StateName = "Cutscene9",
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
--			EntityTimerStart {Name = "et_Cutscene9"},
--		},
--		
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 4},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Sorvina1", Tag = "Sorvina"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 10},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "TothLar1", Tag = "TothLar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 16},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Sorvina2", Tag = "Sorvina"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 20},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Sorvina2a", Tag = "Sorvina"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 26},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Sorvina3", Tag = "Sorvina"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 30},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Falkmar1", Tag = "Falkmar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 34},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar15", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 38},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar16", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 42},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Io1", Tag = "Io"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 46},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "NightSong9b", Tag = "NightSong"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene9", Seconds = 51},
--			},
--			Actions =
--			{
--				CameraStop {},				
--				CutsceneEnd {}, 
--				MapTimerStart {Name = "mt_P301_OutcriesAfterShadowFight"}
--			},
--	},
--};
--
--	
