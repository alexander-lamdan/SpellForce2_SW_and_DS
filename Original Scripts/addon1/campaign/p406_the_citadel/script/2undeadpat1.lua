--*******************************************************
--***                                                 ***
--***               Citadel Part1					  ***
--***			    2UndeadPat1	              	      ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {TargetTag = "1UndeadPoint1"},
				Tags = 
				{
					"1UndeadPoint2",
					"1UndeadPoint3",
					"1UndeadPoint4",
				},
			},		
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 45,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "UndeadSpawnpoint2"},
			MapFlagIsTrue {Name = "mf_P406_StartIntorCS"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
	
	
};