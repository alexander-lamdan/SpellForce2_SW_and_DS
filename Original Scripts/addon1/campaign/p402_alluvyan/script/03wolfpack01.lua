--*******************************************************
--***                                                 ***
--***             WolfPackSammelscript03              ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_OrcAmbush"},
		},
		Actions = 
		{
			MinimapAlertSetToEntity	{Type = 2},
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
			MapTimerIsElapsed	{Name = "mt_OrcArmeeTimer", Seconds = 7},
			GateIsOpen	{Tag = "OrcGateSouth01"},
			GateIsOpen	{Tag = "OrcGateSouth02"},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "Haupthaus01"},
		},
		
	},

};

