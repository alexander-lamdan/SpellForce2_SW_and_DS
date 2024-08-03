State
{	
	StateName = "Avatar_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Anim_Avatar_Start"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_2.ska"}, -- 1.42s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnEvent
	{
		EventName = Anim2,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 1.42},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_2.ska"}, -- 1.42s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Anims_Stop"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Stop_It"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};