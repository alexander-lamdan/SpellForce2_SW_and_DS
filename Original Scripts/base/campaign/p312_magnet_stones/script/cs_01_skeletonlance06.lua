State
{	
	StateName = "MainScript",
	OnEvent
	{
		EventName = Anim1,
		GotoState = self,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance06"},
			EntityFlagIsFalse {Name = "ef_AnimPlay"},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_attack_2h_staff_2.ska"}, -- 2.00s
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
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 2},
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