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
		X = 189.462, Y = 223.712, 
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRange	{Team = "tm_Undead", Range = 6, X = 189.462, Y = 223.712},
				FigureTeamIsInRange	{Team = "tm_Golem", Range = 6, X = 189.462, Y = 223.712},
			},
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 189.462, Y = 223.712},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ShadowAliveTimer"},
			MapFlagSetTrue {Name = "mf_Shadow12Alive"},
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
			MapFlagIsTrue {Name = "mf_Shadow12Alive"},		
			FigureTeamIsNotInRange	{Team = "tm_Golem", Range = 10, X = 189.462, Y = 223.712},
			FigureTeamIsNotInRange	{Team = "tm_Undead", Range = 10,X = 189.462, Y = 223.712},
			FigureTeamIsNotInRange	{Team = "tm_Team1", Range = 10, X = 189.462, Y = 223.712},
			EntityTimerIsElapsed	{Name = "et_ShadowAliveTimer", Seconds = 25},
		},
		Actions =
		{
			FigureVanish	{},
		},
	},
	
};

