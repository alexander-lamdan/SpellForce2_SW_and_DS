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
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat02Point01"},
				Tags = 
				{
					"Pat02Point02",
					"Pat02Point03",
					"Pat02Point04",
				},
			},		
		},
		
	},
	
	
};