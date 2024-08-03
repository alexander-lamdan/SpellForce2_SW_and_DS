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
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "Frenzy2Wp1"},
				Tags = 
				{
					"Frenzy2Wp1",
					"Frenzy2Wp2",
				},
			},
		},
	},
};