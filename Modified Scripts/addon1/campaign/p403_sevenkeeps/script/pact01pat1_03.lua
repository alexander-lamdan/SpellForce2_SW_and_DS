
State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigurePatrolWalk{X = 544, Y = 515}, 
    			Points = 
   				{
        			"590, 532", 
        			"600, 553",
        			"593, 568", 
        			"600, 539",
        			"544, 515",
   				},
			},
		},
		
	},
	
};
