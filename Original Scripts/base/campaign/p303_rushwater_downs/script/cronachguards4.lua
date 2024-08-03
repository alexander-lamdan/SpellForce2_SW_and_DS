State
{    
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "FalkmarMustLive"},
		},
		Actions =
		{
			FigurePathGoto
			{
				Goto = FigurePatrolWalk{Tag = "CronachGuadrs4", X = 334, Y = 317}, 
				Points = 
				{
					"300, 319",
	    			"303, 336", 
	    			"305, 368",
	    			"303, 336", 
					"300, 319",
				}
			}
		}
	}
}