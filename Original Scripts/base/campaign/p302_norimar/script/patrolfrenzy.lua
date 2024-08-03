State
{
	StateName = "Patrol",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "FrenzyWp1"},
				Tags = 
				{
					"FrenzyWp1",
					"FrenzyWp2",
				},
			},
		},
	},
};