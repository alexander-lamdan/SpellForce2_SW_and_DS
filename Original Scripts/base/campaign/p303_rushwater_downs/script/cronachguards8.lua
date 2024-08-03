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
				Goto = FigurePatrolWalk{Tag = "CronachGuards8", X = 275, Y = 333}, 
				Points = 
				{
	   	 			"253, 333", 
	    			"287, 333", 
	    			"303, 344", 
	    			"299, 316",
	    			"302, 301",
	    			"305, 288", 
	    			"299, 316",
	    			"292, 320",
				}
			}
		}
	}
}