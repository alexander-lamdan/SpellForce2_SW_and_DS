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
			FigureRun	{X = 604, Y = 513},
		},
	},
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Range = 5, X = 604, Y = 513},
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
			BuildingDestroy	{Tag = "Tower12"},
			BuildingDestroy	{Tag = "Tower11"},
			BuildingDestroy	{Tag = "Tower19"},
			BuildingDestroy	{Tag = "Tower08"},
			BuildingDestroy	{Tag = "Tower09"},
			BuildingDestroy	{Tag = "Tower10"},
		},
	},
    
};
