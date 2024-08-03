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
		X = 331.814, Y = 382.012, 
		Conditions = 
		{
			QuestIsSolved	{Quest = "CityShip3_ReturnToCityShip"},
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
			QuestIsKnown {Quest = "CityShip4_ReturnToCityShip"},
		},
		Actions = 
		{
			FigureVanish	{},
		},
	},
    
};

