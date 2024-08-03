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
--		GotoState = "CutsceneMordecay",
--		Conditions =
--		{
--			OR
--			{
--				MapFlagIsTrue	{Name = "mf_Cutscene05"},
--				AND
--				{
--				AvatarFlagIsTrue{Name = "af_P303_ReanimatedMordecay"},
--				AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden geh�ren zusammen, deswegen beide in einer zeile!
--				},
--			},
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
--	StateName = "CutsceneMordecay",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{  
--		},
--		Actions = 
--		{
--			CutsceneBegin {},
--			CameraSet {X = 574.72, Y = 49.32, Z = 317.26, LookAtX = 575.00, LookAtY = 48.49, LookAtZ = 318.16},
--			EntityTimerStart {Name = "et_CutsceneMordecay"},
--			ObjectVanish {Tag = "Mordecay"},
--			PlayerHeroAdd {Player = "pl_Human", HeroId = 10},
--			FigureHeroSpawn {Player = "default", Tag = "HeroMordecay", X = 570, Y = 412, Direction = 90},
--		},
--		
--	},
--	
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 4},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Mordecay1", Tag = "Mordecay"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 10},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 16},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Mordecay2", Tag = "Mordecay"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 20},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 24},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Mordecay3", Tag = "Mordecay"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 29},
--			},
--			Actions =
--			{
--				CutsceneSay	{TextTag = "Avatar6", Tag = "pl_HumanAvatar"},
--			},
--	},
--	OnOneTimeEvent
--	{
--			Conditions =
--			{
--				EntityTimerIsElapsed {Name = "et_CutsceneMordecay", Seconds = 60},
--			},
--			Actions =
--			{
--				CameraStop {},				
--				CutsceneEnd {}, 
--				AvatarFlagSetTrue {Name = "af_P309_CutsceneMordecayEnd"}
--			},
--	},
--};
--
--	
