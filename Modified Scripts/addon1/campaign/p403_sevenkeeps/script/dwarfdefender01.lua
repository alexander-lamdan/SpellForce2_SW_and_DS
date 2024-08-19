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
			FigureRun	{X = 551, Y = 513},
		},
	},
   OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Range = 5, X = 551, Y = 513},
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
			BuildingDestroy	{Tag = "Camp01"},
			BuildingDestroy	{Tag = "Fortress"},
			BuildingDestroy	{Tag = "TrainingGround"},
			BuildingDestroy	{Tag = "Tower13"},
			BuildingDestroy	{Tag = "Tower05"},
			ObjectVanish	{Tag = "PactCamp01"},
	
		},
	},
   
    
};

