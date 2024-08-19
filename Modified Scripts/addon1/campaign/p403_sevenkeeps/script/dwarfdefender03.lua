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
			FigureRun	{X = 579, Y = 548},
		},
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Range = 5, X = 579, Y = 548},
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
			BuildingDestroy	{Tag = "Tower06"},
			BuildingDestroy	{Tag = "Tower07"},
			BuildingDestroy	{Tag = "Tower03"},
			BuildingDestroy	{Tag = "Tower04"},
		},
	},
    
    
};
