State
{	
	StateName = "Anim",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Lya_Dead"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "pl_HumanHeroLya", File = "base/gfx/figures/hero/figure_hero_female_dead.ska"},
		},
		GotoState = "EndScript"
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Lya_Alive"},
		},
		Actions =
		{
			FigureStop {Tag = "pl_HumanHeroLya"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};