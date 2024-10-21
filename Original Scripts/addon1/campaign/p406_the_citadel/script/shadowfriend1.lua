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
		X = 148.497, Y = 150.578, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 148.497, Y = 150.578},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 148.497, Y = 150.578},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 148.497, Y = 150.578},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow1Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow1Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 148.497, Y = 150.578},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10, X = 148.497, Y = 150.578},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 148.497, Y = 150.578},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

