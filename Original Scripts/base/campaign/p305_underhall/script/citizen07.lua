
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
    			Goto = FigurePatrolWalk{X = 175, Y = 172}, 
    			Points = 
   				{
        			"192, 161",
   				},
			},
		},
		
	},

};
