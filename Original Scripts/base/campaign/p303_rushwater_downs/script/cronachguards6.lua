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
				Goto = FigurePatrolWalk{Tag = "CronachGuards6", X = 302, Y = 301}, 
				Points = 
				{
					"299, 316",
    				"305, 288", 
    				"299, 316",
    				"292, 320",
					"275, 333",
   		 			"253, 333", 
    				"287, 333", 
    				"303, 344", 
				}
			}
		}
	}
}