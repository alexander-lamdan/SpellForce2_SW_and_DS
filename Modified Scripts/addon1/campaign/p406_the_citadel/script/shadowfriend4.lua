--*******************************************************
--***                                                 ***
--***             		UndeadGuard1                  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 150.138, Y = 198.454, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6,X = 150.138, Y = 198.454},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 150.138, Y = 198.454},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 150.138, Y = 198.454},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow4Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow4Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 150.138, Y = 198.454},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 150.138, Y = 198.454},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 150.138, Y = 198.454},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

