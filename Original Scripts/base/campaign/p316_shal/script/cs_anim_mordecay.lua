State
{	
	StateName = "Anim",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Mordecay_Dead"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "pl_HumanHeroMordecay", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"},
		},
		GotoState = "EndScript"
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Mordecay_Alive"},
		},
		Actions =
		{
			FigureStop {Tag = "pl_HumanHeroMordecay"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};