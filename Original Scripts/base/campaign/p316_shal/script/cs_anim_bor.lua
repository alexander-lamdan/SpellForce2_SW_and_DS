State
{	
	StateName = "Anim",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Bor_Dead"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "pl_HumanHeroBor", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"},
		},
		GotoState = "EndScript"
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Bor_Alive"},
		},
		Actions =
		{
			FigureStop {Tag = "Pl_HumanHeroBor"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};