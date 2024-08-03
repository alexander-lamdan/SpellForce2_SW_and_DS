--*******************************************************
--***                                                 ***
--***               Citadel Part1					  ***
--***			    3UndeadPat1	              	      ***
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
				Goto = FigurePatrolWalkToEntity {TargetTag = "2UndeadPoint1"},
				Tags = 
				{
					"2UndeadPoint2",
					"2UndeadPoint3",
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
			BuildingIsAlive	{Tag = "UndeadSpawnpoint3"},
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