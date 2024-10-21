State
{
	StateName = "PATCH",

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "FemaleShaper"},
		},
		Actions = 
		{
			FigureAnimPlayLooped	{Tag = "FemaleShaper", File = "base/gfx/figures/hero/figure_hero_female_special_shaper_sleep.ska"},
		},
	},
};
