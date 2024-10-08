---------------------------------------------------------------------------------
----
----		2. Cutscene:
----
----		Nahe kleinem, gut bewachten Tor
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "INITCutscene",
--	OnOneTimeEvent
--	{
--		GotoState = "Main",
--		Conditions =
--		{
--		},
--		Actions =
--		{
--		},
--	},
--}
--
--State
--{
--	StateName = "Main",
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsTrue {Name = "af_P319_Cutscene02Begin"},
--		},
--		Actions =
--		{
--			CutsceneBegin {},
--			CameraSet {X = 278.11, Y = 70.24, Z = 197.49, LookAtX = 278.10, LookAtY = 69.70, LookAtZ = 198.33},
--			FigureTeleport	{Tag = "Schattenlied", X = 272 , Y = 242},
--			EntityTimerStart {Name = "et_Cutscene"},	
--		}
--	},
--	
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 5},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_01", Tag = "Schattenlied"},
--			
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 10},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_02", Tag = "Schattenlied"},
--			
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 15},
--		},
--		Actions =
--		{
--
--			CutsceneSay	{TextTag = "Gate_03", Tag = "pl_HumanAvatar"},
--			MapFlagSetTrue {Name ="mf_ShadowWarriorAppear"},
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 20},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_04", Tag = "Schattenlied"},
--			
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 25},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_05", Tag = "Schattenkrieger"},
--			
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 30},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_06", Tag = "Schattenkrieger"},
--			
--		}
--	},
--
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 35},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_07", Tag = "Schattenlied"},
--			
--		}
--	},
--
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 40},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "Gate_08", Tag = "pl_HumanAvatar"},
--		}
--	},
--	
--
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Cutscene", Seconds = 45},
--			},
--			Actions =
--			{	
--				CameraStop {},
--				CutsceneEnd {},
--				
--				AvatarFlagSetTrue {Name = "af_P319_CS02Finished"},
--			},
--	},
--	
--}
