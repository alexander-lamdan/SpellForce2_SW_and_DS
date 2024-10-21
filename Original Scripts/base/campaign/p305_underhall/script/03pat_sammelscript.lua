

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
    			Goto = FigurePatrolWalk{X = 308, Y = 222}, 
    			Points = 
   				{
        			"259, 224", 
       	 			"261, 233", 
        			"306, 233", 
   				},
			},
		},
		
	},
	
};
