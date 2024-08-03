--*******************************************************
--***                                                 ***
--***               Citadel Part1					  ***
--***			    2MudGolemPat1	                  ***
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
				Goto = FigurePatrolWalkToEntity {TargetTag = "2MudPoint1"},
				Tags = 
				{
					"2MudPoint2",
					"2MudPoint3",
					"2MudPoint4",
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
			BuildingIsAlive	{Tag = "MudGolemSpawnpoint2"},
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