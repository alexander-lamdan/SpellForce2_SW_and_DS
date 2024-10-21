
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
    			Goto = FigurePatrolWalk{X = 110, Y = 247}, 
    			Points = 
   				{
        			"151, 221", 
   				},
			},
		},
		
	},
	
};
