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
				Goto = FigurePatrolWalkToEntity {Tag = "PatrolGolem1", TargetTag = "PatrolGolem1Wp1"},
				Tags = 
				{
					"PatrolGolem1Wp1",
					"PatrolGolem1Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "PatrolGolem2", TargetTag = "PatrolGolem2Wp1"},
				Tags = 
				{
					"PatrolGolem2Wp1",
					"PatrolGolem2Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "PatrolGolem3", TargetTag = "PatrolGolem3Wp1"},
				Tags = 
				{
					"PatrolGolem3Wp1",
					"PatrolGolem3Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "PatrolGolem4", TargetTag = "PatrolGolem4Wp1"},
				Tags = 
				{
					"PatrolGolem4Wp1",
					"PatrolGolem4Wp2",
				},
			},
			
			--In der Schmiede: Elementare die um Brunnen tanzen
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "DancingFire1", TargetTag = "DancingFire1Wp1"},
				Tags = 
				{
					"DancingFire1Wp1",
					"DancingFire1Wp2",
					"DancingFire1Wp3",
					"DancingFire1Wp4",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "DancingFire2", TargetTag = "DancingFire2Wp1"},
				Tags = 
				{
					"DancingFire2Wp1",
					"DancingFire2Wp2",
					"DancingFire2Wp3",
					"DancingFire2Wp4",
				},
			},
			-- Beast Patrol 1
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast1", TargetTag = "BeastPatrol1Beast1Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast1Wp1",
					"BeastPatrol1Beast1Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast2", TargetTag = "BeastPatrol1Beast2Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast2Wp1",
					"BeastPatrol1Beast2Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast3", TargetTag = "BeastPatrol1Beast3Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast3Wp1",
					"BeastPatrol1Beast3Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast4", TargetTag = "BeastPatrol1Beast4Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast4Wp1",
					"BeastPatrol1Beast4Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast5", TargetTag = "BeastPatrol1Beast5Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast5Wp1",
					"BeastPatrol1Beast5Wp2",
				},
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "BeastPatrol1Beast6", TargetTag = "BeastPatrol1Beast6Wp1"},
				Tags = 
				{
					"BeastPatrol1Beast6Wp1",
					"BeastPatrol1Beast6Wp2",
				},
			},
			
			-- Wolf
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "PatrolWolf", TargetTag = "WolfWp1"},
				Tags = 
				{
					"WolfWp1",
					"WolfWp2",
					"WolfWp3",
				},
			},
		},
	},
};