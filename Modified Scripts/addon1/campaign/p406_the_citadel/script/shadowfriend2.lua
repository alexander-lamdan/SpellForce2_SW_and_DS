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
		X = 197.964, Y = 147.122, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6,X = 197.964, Y = 147.122},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 197.964, Y = 147.122},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 197.964, Y = 147.122},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow2Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow2Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10,X = 197.964, Y = 147.122},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 197.964, Y = 147.122},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 197.964, Y = 147.122},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

