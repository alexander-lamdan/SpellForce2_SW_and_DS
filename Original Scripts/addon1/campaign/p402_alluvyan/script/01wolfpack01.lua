--*******************************************************
--***                                                 ***
--***             WolfPackSammelscript01              ***
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
			MapTimerIsElapsed	{Name = "mt_OrcArmeeTimer", Seconds = 5},
			GateIsOpen	{Tag = "OrcGateSouth01"},
			GateIsOpen	{Tag = "OrcGateSouth02"},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "Haupthaus01"},
		},
		
	},

};

