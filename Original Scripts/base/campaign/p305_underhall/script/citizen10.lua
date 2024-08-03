
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
    			Goto = FigurePatrolWalk{X = 115, Y = 129}, 
    			Points = 
   				{
        			"110, 78",
        			"110, 106",
        			"86, 121",
        			"77, 139",
   				},
			},
		},
		
	},
};
