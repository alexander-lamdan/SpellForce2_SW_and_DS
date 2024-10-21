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
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat06Point01"},
				Tags = 
				{
					"Pat06Point02",
					"Pat06Point03",
					"Pat06Point04",
				},
			},		
		},
		
	},
	
	
};