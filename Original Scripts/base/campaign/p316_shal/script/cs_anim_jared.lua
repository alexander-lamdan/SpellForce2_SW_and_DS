State
{	
	StateName = "Anim",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Jared_Dead"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "pl_HumanHeroJared", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"},
		},
		GotoState = "EndScript"
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Jared_Alive"},
		},
		Actions =
		{
			FigureStop {Tag = "pl_HumanHeroJared"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};