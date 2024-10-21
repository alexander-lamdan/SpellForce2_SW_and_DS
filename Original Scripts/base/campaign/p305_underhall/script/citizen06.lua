
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
    			Goto = FigurePatrolWalk{X = 172, Y = 132}, 
    			Points = 
   				{
        			"130, 132",
        			"130, 168",
        			"150, 176",
   				},
			},
		},
		
	},
		
};
