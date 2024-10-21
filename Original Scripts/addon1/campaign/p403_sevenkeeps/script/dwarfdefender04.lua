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
			FigureRun	{X = 621, Y = 565},
		},
	},
	
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Range = 5, X = 621, Y = 565},
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
			BuildingDestroy	{Tag = "Tower01"},
			BuildingDestroy	{Tag = "Tower02"},
		},
	},
    
};
