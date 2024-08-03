State
{	
	StateName = "Anim",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Shae_Dead"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "pl_HumanHeroShae", File = "base/gfx/figures/hero/figure_hero_female_dead.ska"},
		},
		GotoState = "EndScript"
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Shae_Alive"},
		},
		Actions =
		{
			FigureStop {Tag = "pl_HumanHeroShae"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};