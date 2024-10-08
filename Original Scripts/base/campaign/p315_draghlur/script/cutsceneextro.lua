---------------------------------------------------------------------------------
----
----		Cutscene bei Missionsbeginn Drachenlurch
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "Init",
--	OnOneTimeEvent
--	{
--		GotoState = "ExtroDrag",
--		Conditions =
--		{
--			MapTimerIsElapsed {Name = "mt_P315_TothLarDead", Seconds = 5},
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
--	StateName = "ExtroDrag",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{  
--		},
--		Actions = 
--		{
--			CutsceneBegin {},
--			CameraSet {X = 311.85, Y = 15.85, Z = 30.61, LookAtX = 311.73, LookAtY = 15.64, LookAtZ = 31.58},
--			EntityTimerStart {Name = "et_CutsceneExtroDrag"},
--		},
--		
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 4},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "IronLord4", Tag = "IronLord"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 10},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "NightSong2", Tag = "NightSong"},
--				MapFlagSetTrue {Name = "mf_P315_ShadowSpawn"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 16},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "ShadowWarrior", Tag = "ShadowWarrior"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 19},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Shadow1", Tag = "Shadow1"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 22},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "NightSong3", Tag = "NightSong"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 26},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 32},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 38},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 44},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "IronLord5", Tag = "IronLord"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 48},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "NightSong4", Tag = "NightSong"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneExtroDrag", Seconds = 52},
--			},
--			Actions =
--			{
--				CameraStop {},				
--				CutsceneEnd {}, 
--				AvatarFlagSetTrue {Name = "af_P309_CutsceneExtroDragEnd"},
--				
--			},
--	},
--};
--
--	
