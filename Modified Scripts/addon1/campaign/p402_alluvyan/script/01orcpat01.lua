--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***			   01OrcPatrouille01	              ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--OrcVeteran läuft eine Patrouille ab.
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat01"},
				Tags = 
				{
					"Pat02",
					"Pat03",
					"Pat04",
				},
			},		
		},
		
	},
	
	
};