
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
       	 			"634, 542",  
        			"600, 539",
        			"544, 515",
   				},
			},
		},
		
	},
	
};

