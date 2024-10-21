
State
{
	StateName = "MainState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalk {Tag = "Wache08",X = 99,Y = 98},
				Points = 
				{
					"85, 98",
					"85, 106",
					"116, 106",
					"114, 98",
				},
			},
		},
	},

};

