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
				Goto = FigurePatrolWalkToEntity {TargetTag = "Pat05Point01"},
				Tags = 
				{
					"Pat05Point02",
					"Pat05Point03",
					"Pat05Point04",
				},
			},		
		},
		
	},
	
	
};