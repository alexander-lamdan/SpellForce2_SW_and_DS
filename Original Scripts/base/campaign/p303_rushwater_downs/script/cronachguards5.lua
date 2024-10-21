State
{ 
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
				Goto = FigurePatrolWalk{Tag = "CronachGuards5", X = 334, Y = 317}, 
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