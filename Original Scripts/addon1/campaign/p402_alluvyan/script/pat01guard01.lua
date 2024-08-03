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
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat01Point01"},
				Tags = 
				{
					"Pat01Point02",
					"Pat01Point03",
					"Pat01Point04",
				},
			},		
		},
		
	},
	
	
};