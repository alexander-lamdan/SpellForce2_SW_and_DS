
State
{	
	StateName = "LyaCorpse_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{	
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 2.5},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_dead.ska"}, -- 0.08s
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P301_LyaCorpse_Dead_Anim_Stop_And_Vanish"},
		},
		Actions = 
		{
			FigureVanish {Tag = "default"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};