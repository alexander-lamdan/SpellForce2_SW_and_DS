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
		X = 154.591, Y = 226.59, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6,X = 154.591, Y = 226.59},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 154.591, Y = 226.59},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 154.591, Y = 226.59},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow10Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow10Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 154.591, Y = 226.59},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10, X = 154.591, Y = 226.59},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 154.591, Y = 226.59},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

