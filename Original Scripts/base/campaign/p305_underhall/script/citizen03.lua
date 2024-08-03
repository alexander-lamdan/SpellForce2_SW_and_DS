
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
    			Goto = FigurePatrolWalk{X = 39, Y = 169}, 
    			Points = 
   				{
        			"76, 184",
        			"44, 162",
        			"67, 209", 
   				},
			},
		},
		
	},

};
