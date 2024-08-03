State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Extro_Actor_AnimPlay"},
		},
		Actions =
		{	
			FigureAnimPlayOnce {Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_special_malacay_die.ska"}, -- 12.29s
			EntityTimerStart {Name = "et_dead_anim"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_dead_anim", Seconds = 12.25},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		},
	},
};