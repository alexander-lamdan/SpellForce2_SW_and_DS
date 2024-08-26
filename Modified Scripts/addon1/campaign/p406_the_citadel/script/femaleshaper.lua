--*******************************************************
--***                                                 ***
--***             		FemaleShaper          		  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 599.407, Y = 544.011, 
		Conditions = 
		{
			
		},
		Actions = 
		{
			FigureAnimPlayLooped	{File = "base/gfx/figures/hero/figure_hero_female_special_shaper_sleep.ska"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
		},
		Actions = 
		{
			FigureAnimPlayLooped	{File = "base/gfx/figures/hero/figure_hero_female_special_shaper_sleep.ska"},
		},
	},
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			QuestIsSolved	{Quest = "CityShip3_ReturnToCityShip"},
		},
		Actions = 
		{
			FigureVanish	{},
		},
	},
    
};

