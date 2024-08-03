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
		X = 173.58, Y = 207.263, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 173.58, Y = 207.263},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 173.58, Y = 207.263},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 173.58, Y = 207.263},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow6Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow6Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 173.58, Y = 207.263},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 173.58, Y = 207.263},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10,X = 173.58, Y = 207.263},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

