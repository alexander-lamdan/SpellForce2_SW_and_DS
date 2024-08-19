--*******************************************************
--***                                                 ***
--***             OrcTroop02Sammelscript01            ***
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
			GateIsOpen	{Tag = "OrcGateSouth01"},
			GateIsOpen	{Tag = "OrcGateSouth02"},
			MapTimerIsElapsed	{Name = "mt_OrcArmeeTimer", Seconds = 9},
		},
		Actions =
		{
			FigureForcedSimpleWalk	{X = GetEntityX(), Y = GetEntityX()+40},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndAttackSouthCS"},
			FigureIsInRange	{Range = 10, X = GetEntityX(), Y = GetEntityX()+40},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Haupthaus01"},
		},
		
	},

};