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
		X = 234.89, Y = 184.82, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 234.89, Y = 184.82},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 234.89, Y = 184.82},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 234.89, Y = 184.82},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow11Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow11Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 234.89, Y = 184.82},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 234.89, Y = 184.82},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 234.89, Y = 184.82},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

