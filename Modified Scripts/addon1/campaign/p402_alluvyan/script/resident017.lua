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
				Goto = FigurePatrolWalkToEntity {TargetTag = "1Roaming3"},
				Tags = 
				{
					"1Roaming2",
					"1Roaming1",
					"1Roaming4",
				},
			},		
		},
		
	},
};
