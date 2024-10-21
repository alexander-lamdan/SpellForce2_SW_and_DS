

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
    			Goto = FigurePatrolWalk{X = 387, Y = 85}, 
    			Points = 
   				{
        			"258, 85", 
       	 			"334, 88", 
        			"334, 120", 
   				},
			},
		},
		
	},
	
};
