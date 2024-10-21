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
			GateIsOpen	{Tag = "DwarfGate02"},
		},
		Actions =
		{
			FigureRun	{X = 614, Y = 497},
		},
	},
    
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Range = 5, X = 614, Y = 497},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_DwarfDestroyTimer"},
		},
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DwarfDestroyTimer", Seconds = 6},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Tower17"},
			BuildingDestroy	{Tag = "Tower18"},
			BuildingDestroy	{Tag = "Tower16"},
			BuildingDestroy	{Tag = "Tower15"},
			BuildingDestroy	{Tag = "Tower14"},
		},
	},
    
};
