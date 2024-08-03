State
{	 
	StateName = "MainScript",
	OnEvent
	{
		EventName = Anim1,
		GotoState = self,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Anim_Start_Troll01"},
			EntityFlagIsFalse {Name = "ef_AnimPlay"},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/fraction_2/figure_troll_smasher_attacktwohand1.ska"}, -- 3.00s
			EntityFlagSetTrue {Name = "ef_AnimPlay"},
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnEvent
	{
		EventName = Anim2,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 3},
			EntityFlagIsTrue {Name = "ef_AnimPlay"},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name = "ef_AnimPlay"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Anim_Units_Vanish"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Stop_It"},
			FigureVanish {Tag = "default"},		
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};