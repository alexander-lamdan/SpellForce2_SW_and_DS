---------------------------------------------------------------------------------
----
----		Wenn die IceQueen get�tet wurde
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "INITCutscene",
--	OnOneTimeEvent
--	{
--		GotoState = "IceQueenEnd",
--		Conditions =
--		{
--			
--		},
--		Actions =
--		{
--			
--			
--		},
--	},
--}
--
--State
--{
--	StateName = "IceQueenEnd",
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue  {Name = "mf_CutsceneEndStart"},
--		},
--		Actions =
--		{
--			CutsceneBegin {},
--			CameraSet {X = 286.71, Y = 122.50, Z = 470.18, LookAtX = 285.90, LookAtY = 122.05, LookAtZ = 470.55},
--			EntityTimerStart {Name = "et_EndTimer"},
--			
--		}
--	},
----  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 1},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "Thane", TextTag = "Thane_Wulfgar01"},
--			
--		}
-- 	},
----  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 6},
--		},
--		Actions =
--		{
--			
--			CutsceneSay { Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
--			
--			
--		}
--	},
----  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 11},
--		},
--		Actions =
--		{
--		
--			CutsceneSay {Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
--		}
--	},
----  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 16},
--		},
--		Actions =
--		{
--			
--			
--			CutsceneSay {Tag = "Thane", TextTag = "Thane_Wulfgar02"},
--			
--		}
--	},
--
----  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 21},
--		},
--		Actions =
--		{
--			
--			
--			CutsceneSay {Tag = "Thane", TextTag = "Thane_Wulfgar03"},
--			
--		}
--	},
--	
--	--  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 25},
--		},
--		Actions =
--		{
--			
--			
--			CutsceneSay {Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
--			
--		}
--	},
--	--  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 30},
--		},
--		Actions =
--		{
--			
--			
--			CutsceneSay {Tag = "pl_HumanAvatar", TextTag = "Avatar04"},
--			
--		}
--	},
--	--  Dialog zwischen Windhammer_Ghost und Avatar
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 35},
--		},
--		Actions =
--		{
--			
--			
--			CutsceneSay {Tag = "Jandrim", TextTag = "Jandrim01"},
--			
--		}
--	},
--	
--	-- Ende der Cutszene
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_EndTimer", Seconds = 40},
--				
--			},
--			Actions =
--			{
--				MapFlagSetTrue	{Name = "mf_CutsceneWindhammerGhostEnded"},
--				CameraStop {},				
--				CutsceneEnd {}, 
--			
--			}
--	}
--};