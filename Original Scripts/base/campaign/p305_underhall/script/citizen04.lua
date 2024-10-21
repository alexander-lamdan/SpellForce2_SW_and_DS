
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
    			Goto = FigurePatrolWalk{X = 99, Y = 136}, 
    			Points = 
   				{
        			"121, 117",
        			"92, 161",
   				},
			},
		},
		
	},

};
