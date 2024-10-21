

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
    			Goto = FigurePatrolWalk{X = 397, Y = 182}, 
    			Points = 
   				{
        			"357, 177", 
       	 			"317, 176", 
        			"348, 186", 
        			"348, 218",
        			"386, 219",
        			"386, 189",
   				},
			},
		},
		
	},
	
};
