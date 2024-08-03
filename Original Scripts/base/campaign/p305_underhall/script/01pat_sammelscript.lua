

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
    			Goto = FigurePatrolWalk{X = 260, Y = 278}, 
    			Points = 
   				{
        			"245, 281", 
       	 			"245, 306", 
        			"267, 306", 
        			"267, 320",
   				},
			},
		},
		
	},
	
};
