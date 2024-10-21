--*******************************************************
--***                                                 ***
--***             DwarfSammelscript                   ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",

	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "Jandrim", Range = 15},
		},
		Actions =
		{
    		MapValueAdd	{Name = "mv_DwarfCounter", Value = 1},
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KingUlfCS"},
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
    		FigureVanish	{},
		},
		
	},   	
	
};

