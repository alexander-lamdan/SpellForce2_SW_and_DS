
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
    			Goto = FigurePatrolWalk{X = 113, Y = 103}, 
    			Points = 
   				{
        			"126, 128",
        			"169, 133",
        			"141, 122",
   				},
			},
		},
		
	},
	
	
	
};
