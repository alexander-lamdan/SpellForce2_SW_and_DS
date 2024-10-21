--*******************************************************
--***                                                 ***
--***             		Resident	                  ***
--***                    	                          ***
--*******************************************************


State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			QuestIsSolved {Quest = "Alluvyan_ToSevenkeeps"},
		},
		Actions = 
		{
			
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {TargetTag = "2Roaming10"},
				Tags = 
				{
					"2Roaming1",
					"2Roaming2",
					"2Roaming3",
					"2Roaming4",
					"2Roaming5",
					"2Roaming6",
					"2Roaming7",
					"2Roaming8",
					"2Roaming9",
				},
			},		
		},
		
	},


};
