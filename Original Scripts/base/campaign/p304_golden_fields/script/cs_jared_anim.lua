
State
{	
	StateName = "Jared_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{	
			MapFlagIsTrue {Name = "mf_P304_Jared_Died_Anim_Play"},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Jared", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"}, -- 0.08s
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 1.2},
			EntityFlagIsFalse{Name = "ef_stop_it"},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Jared", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"}, -- 0.08s
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P304_Jared_Died_Anim_Stop"},
		},
		Actions = 
		{
			FigureAnimPlayOnce {Tag = "Jared", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"}, -- 1.83
			EntityFlagSetTrue{Name = "ef_stop_it"},
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};