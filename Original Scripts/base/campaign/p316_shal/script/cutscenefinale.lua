---------------------------------------------------------------------------------
----
----		Am Ende der Map
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "INITCutscene",
--	OnOneTimeEvent
--	{
--		GotoState = "CutsceneEnde",
--		Conditions =
--		{
--			MapFlagIsTrue{Name = "mf_StartCutsceneFinal"},
--		},
--		Actions =
--		{
--			EntityTimerStart {Name = "et_Timer"},
--			
--		},
--	},
--}
--
--State
--{
--	StateName = "CutsceneEnde",
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			
--		},
--		Actions =
--		{
--			CutsceneBegin {},
--			CameraSet {X = 151.80, Y = 28.77, Z = 123.47, LookAtX = 152.13, LookAtY = 28.30, LookAtZ = 122.65},
--			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "Schattenlied"},
--					
--		}
--	},
----  Dialog Schattenlied
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Timer", Seconds = 1},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "Schattenlied", TextTag = "Schattenlied06"},
--			
--		}
-- 	},
----  Dialog Schattenlied
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Timer", Seconds = 7},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
--			
--			
--		}
--	},
----  Dialog Schattenlied
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Timer", Seconds = 12},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "Schattenlied", TextTag = "Schattenlied07"},
--			
--			
--		}
--	},
----  Dialog Schattenlied
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_Timer", Seconds = 17},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "Schattenlied", TextTag = "Schattenlied08"},
--		}
--	},
--
--	-- Ende der Cutszene
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_Timer", Seconds = 23},
--				
--			},
--			Actions =
--			{
--				
--				MapFlagSetTrue	{Name = "mf_CutsceneFinaleEnded"},
--				CameraStop {},				
--				CutsceneEnd {}, 
--			
--			}
--	}
--}