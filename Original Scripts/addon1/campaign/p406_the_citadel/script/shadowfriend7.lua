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
		X = 126.736, Y = 206.614, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 126.736, Y = 206.614},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 126.736, Y = 206.614},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 126.736, Y = 206.614},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow7Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow7Alive"},
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 126.736, Y = 206.614},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10, X = 126.736, Y = 206.614},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 126.736, Y = 206.614},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

