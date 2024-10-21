State
{
	StateName = "PatrolState",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "FirstUndeadWP1"},
				Tags = 
				{
					"FirstUndeadWP1",
					"FirstUndeadWP2",
				},
			},
		},
	},
};

