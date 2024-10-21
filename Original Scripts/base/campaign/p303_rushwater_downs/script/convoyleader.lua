offsetX = 0
offsetY = 0


--State
--{	
--	StateName = "INIT",
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--		},
--		GotoState = "Ambush1"
--	},
--	--OnFigureSpawnOnlyWhenEvent
--	--{
--	--	X = 123,
--	--	Y = 145,
--	--	Conditions = 
--	--	{
--	--		MapTimerIsElapsed {Name = "mt_P303_MapStartTimer", Seconds = 6+ timeoffset},
--	--	},
--	--	Actions = 
--	--	{
--	--	},
--	--},
--	--OnIdleGoHomeFake
--	--{
--	--	X = GetEntityX(),
--	--	Y = GetEntityY(),
--	--	Conditions = 
--	--	{
--	--	},
--   	--	Actions = 
--	--	{
--	--	},
--	--	OneTimeHomeActions =
--	--	{
--	--		FigureLookAtDirection {Direction = 90}
--	--	}
--    --},
--}

State
{
	StateName = "Ambush1",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	 {Name = "af_P303_FirstAmbushDead"},	
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Delay1"},		
		},
		
	},
	
	OnIdleGoHomeFake
	{
		X = 139+ offsetX, Y = 107+ offsetY,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			EntityValueIsLess {Name = "ev_HomeTest", Value = 1},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
		},
		Actions =
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 1},
		},	
	},
	-- Sind alle Attentäter des zweiten Hinterhalts tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
		},
		Actions =
		{
			-- Immer Timer und Flag, damit ich weiß an welcher Stelle der Convoi ist (Ambush1)
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},
	OnIdleGoHomeFake
	{
		X = 171+ offsetX, Y = 94+ offsetY,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 1},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
		},
		Actions =
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 2},
		},
	},
	-- Sind alle Attentäter des dritten Hinterhalts tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
		},
		Actions =
		{
			
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},
	OnIdleGoHomeFake
	{
		X = 196+ offsetX, Y = 93+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 2},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 3},
		},
	},
	-- Sind alle Attentäter des vierten Hinterhalts tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},
	OnIdleGoHomeFake
	{
		X = 215+ offsetX, Y = 167+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_HomeTest", Value = 3},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
			MapTimerIsElapsed {Name = "mt_P303_BitchTerror", Seconds = 25}
		},
		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 4},
		},
	},
	-- Sind alle Attentäter des fünften Hinterhalts tot wir das Flag zum Nachrücken gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},	
	OnIdleGoHomeFake
	{
		X = 200+ offsetX, Y = 204+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 4},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 5},
			MapFlagSetTrue {Name = "mf_P303_BowmenTakePositions"},
			EntityTimerStart	{Name = "et_Delay1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_BowAmbushDead"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},	
	
	OnIdleGoHomeFake
	{
		X = 278+ offsetX, Y = 228+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 5},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_BowAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 2},
			AvatarFlagIsFalse {Name = "af_P303_CutsceneShown"},
		},
		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			EntityValueSet	{Name = "ev_HomeTest", Value = 6},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Home",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_CutsceneShown"},
		},
		Actions =
		{
		}
	},
}
	
	
State
{
	StateName = "Home",
}