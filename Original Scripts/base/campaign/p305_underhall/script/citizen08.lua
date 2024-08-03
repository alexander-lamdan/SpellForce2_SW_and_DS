
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
    			Goto = FigurePatrolWalk{X = 171, Y = 155}, 
    			Points = 
   				{
        			"133, 180",
        			"137, 134",
        			"161, 132",
        			"176, 106",
   				},
			},
		},
		
	},
	
};
