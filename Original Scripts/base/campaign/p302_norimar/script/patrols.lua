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
				Goto = FigurePatrolWalkToEntity {Tag = "Patrol02Undead01", TargetTag = "Patrol02Undead01WP01"},
				Tags = 
				{
					"Patrol02Undead01WP01",
					"Patrol02Undead01WP02",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "Patrol02Undead02", TargetTag = "Patrol02Undead02WP01"},
				Tags = 
				{
					"Patrol02Undead02WP01",
					"Patrol02Undead02WP02",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "Patrol02Undead03", TargetTag = "Patrol02Undead03WP01"},
				Tags = 
				{
					"Patrol02Undead03WP01",
					"Patrol02Undead03WP02",
				},
			},
		},
	},
};

