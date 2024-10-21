

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
    			Goto = FigurePatrolWalk{X = 308, Y = 278}, 
    			Points = 
   				{
        			"329, 278", 
       	 			"329, 308", 
        			"303, 308", 
        			"302, 319",
   				},
			},
		},
		
	},
	
};
