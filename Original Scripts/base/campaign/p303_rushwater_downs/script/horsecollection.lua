
--State
--{	
--	StateName = "INIT",
--	
----	OnFigureSpawnOnlyWhenEvent
----	{
----		X = 123,
----		Y = 145,
----		Conditions = 
----		{
----			MapTimerIsElapsed {Name = "mt_P303_MapStartTimer", Seconds = 17+ timeoffset},
----		},
----		Actions = 
----		{
----		},
----	},
----	OnIdleGoHomeFake
----	{
----		X = GetEntityX(),
----		Y = GetEntityY(),
----		Conditions = 
----		{
----		},
----   		Actions = 
----		{
----		},
----		HomeActions =
----		{
----			
----		},
----		OneTimeHomeActions =
----		{
----			FigureLookAtDirection {Direction = 45},
----			EntityFlagSetTrue {Name = "ef_P303_ChangeState"},
----		}
----   },
--   OnOneTimeEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--		},
--		GotoState = "Ambush1"
--	},
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
		X = 138+ offsetX, Y = 116+ offsetY,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
			EntityValueIsLess	 {Name = "ev_HomeTest", Value = 1},
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
		X = 167+ offsetX, Y = 99+ offsetY,
		Conditions = 
		{
			AvatarFlagIsTrue	 {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 1},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
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
			AvatarFlagIsTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},
	OnIdleGoHomeFake
	{
		X = 193+ offsetX, Y = 98+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 2},
			AvatarFlagIsTrue	 {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
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
			MapTimerStart	{Name = "mt_P303_FigureOutcryDelay1"},
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
			AvatarFlagIsTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
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
			FigureIsDead	{Tag = "Ambush21"},
			FigureIsDead	{Tag = "Ambush22"},
			FigureIsDead	{Tag = "Ambush23"},
			FigureIsDead	{Tag = "Ambush24"},
			FigureIsDead	{Tag = "Ambush25"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay1"},
		}
		
	},	
	OnIdleGoHomeFake
	{
		X = 199+ offsetX, Y = 204+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 4},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
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
		X = 273+ offsetX, Y = 231+ offsetY,
		Conditions = 
		{
			EntityValueIsEqual	{Name = "ev_HomeTest", Value = 5},
			AvatarFlagIsTrue {Name = "af_P303_FirstAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_ThirdAdditionalAttackDead"},
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
			AvatarFlagIsTrue {Name = "af_P303_BowAmbushDead"},
			EntityTimerIsElapsed {Name = "et_Delay1", Seconds = 4+timeoffset },
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
}
