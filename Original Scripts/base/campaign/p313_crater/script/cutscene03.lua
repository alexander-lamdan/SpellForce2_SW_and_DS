---------------------------------------------------------------------------------
----
----		Cutscene wenn Naugron gekillt
----
---------------------------------------------------------------------------------
--
--
--State
--{
--	StateName = "IntroCrater",
--	OnOneTimeEvent
--	{
--		GotoState = "Cutscene",
--		Conditions =
--		{
--		},
--		Actions =
--		{
--		},
--	},
--}
--
--
--
--State
--{
--	StateName = "Cutscene",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{  
--			AvatarFlagIsTrue{Name = "af_P313_Cutscene03Begin"},
--		},
--		Actions = 
--		{
--			CutsceneBegin {},
--			CameraSet {X = 170.43, Y = 54.53, Z = 213.83, LookAtX = 170.43, LookAtY = 53.59, LookAtZ = 214.17},
--			EntityTimerStart {Name = "et_CutsceneTimer"},
--		},
--		
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneTimer", Seconds = 5},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "MirrorFree01", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneTimer", Seconds = 10},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "MirrorFree02", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneTimer", Seconds = 15},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "MirrorFree03", Tag = "pl_HumanAvatar"},
--			},
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneTimer", Seconds = 20},
--			},
--			Actions =
--			{
--				CameraStop {},				
--				CutsceneEnd {}, 
--				
--				AvatarFlagSetTrue{Name = "af_P313_Cutscene03Ended"},
--			},
--	},
--};
--
--	
