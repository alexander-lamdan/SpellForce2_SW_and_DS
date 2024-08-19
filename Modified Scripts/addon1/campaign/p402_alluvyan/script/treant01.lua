--*******************************************************
--***                                                 ***
--***             			Treant01                  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			FigureForcedWalkToEntity	{TargetTag = "AimTreantCrossing01"},
		},
		
	},
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "AimTreantCrossing02", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "AimTreantCrossing02", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "AimTreantCrossing02", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "AimTreant02", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "AimTreant02", Range = 8},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "AimTreant02", Range = 8},
			},
			FigureIsInEntityRange	{TargetTag = "AimTreantCrossing01", Range = 2},
		},
		Actions =
		{
			FigureForcedWalkToEntity	{TargetTag = "AimTreant01"},
		},
		
	},
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "AimTreant01", Range = 2},
		},
		Actions =
		{
			FigureHoldPosition	{},
			MapFlagSetTrue {Name = "mf_TreantHoldPosition01"},
		},
		
	},
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TreantHoldPosition01"},
		},
		Actions =
		{
			FigureAnimPlayLooped	{File = "base/gfx/figures/fraction_1/figure_elf_treant_resolve_enemy.ska"},
		},
		
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_DestroyMagicDefense"},
		},
		Actions =
		{
			FigureStop	{},
			FigureForcedWalk	{X = 250, Y = 284},
		},
		
	},
};
