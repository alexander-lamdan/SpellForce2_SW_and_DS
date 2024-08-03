
State
{
	StateName = "CitizenStart",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigurePatrolWalk{X = 138, Y = 133}, 
    			Points = 
   				{
        			"93, 136",
        			"88, 166",
        			"81, 190",
        			"124, 217",
   				},
			},
		},
		
	},
	
};
