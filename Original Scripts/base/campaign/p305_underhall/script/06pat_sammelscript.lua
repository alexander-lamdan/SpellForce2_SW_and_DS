

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
    			Goto = FigurePatrolWalk{X = 249, Y = 68}, 
    			Points = 
   				{
        			"249, 124", 
       	 			"267, 137", 
        			"324, 135", 
   				},
			},
		},
		
	},
	
};
