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
		X = 187.42, Y = 126.785, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 187.42, Y = 126.785},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 187.42, Y = 126.785},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 187.42, Y = 126.785},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow8Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow8Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 187.42, Y = 126.785},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 187.42, Y = 126.785},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 187.42, Y = 126.785},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

