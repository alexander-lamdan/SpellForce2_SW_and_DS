--*******************************************************
--***                                                 ***
--***             		Blade1              		  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 242.199, Y = 89.4139, 
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
		},
		Actions = 
		{
			
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
			MapTimerIsElapsed	{Name = "mt_OutcryConstructorStart", Seconds = 10},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},	
	
    OnFigureRespawnEvent	
	{
		WaitTime = 1,
		X = 242.199, Y = 89.4139, 
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OutcriesMordecayStart"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_HinweisAlive"},
			EntityTimerStart	{Name = "et_HinweisSpoke"},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HinweisSpoke", Seconds = 10},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},	
    
    
    
};

