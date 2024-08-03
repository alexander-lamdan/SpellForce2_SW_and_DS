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
		X = 199.3, Y = 195.051, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 199.3, Y = 195.051},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 199.3, Y = 195.051},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 199.3, Y = 195.051},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow3CloneAlive"},
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
			MapFlagIsTrue {Name = "mf_Shadow3CloneAlive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 199.3, Y = 195.051},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 199.3, Y = 195.051},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 199.3, Y = 195.051},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

