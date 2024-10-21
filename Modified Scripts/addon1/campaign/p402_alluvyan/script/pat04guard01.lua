--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***			    RealmPatrouille	                  ***
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
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat04Point01"},
				Tags = 
				{
					"Pat04Point02",
					"Pat04Point03",
					"Pat04Point04",
				},
			},		
		},
		
	},
	
	
};