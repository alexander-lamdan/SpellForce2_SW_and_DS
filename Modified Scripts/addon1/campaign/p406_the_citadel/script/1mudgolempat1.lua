--*******************************************************
--***                                                 ***
--***               Citadel Part1					  ***
--***			    1MudGolemPat1	                  ***
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
				Goto = FigurePatrolWalkToEntity {TargetTag = "1MudPoint4"},
				Tags = 
				{
					"1MudPoint1",
					"1MudPoint2",
					"1MudPoint3",
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
			BuildingIsAlive	{Tag = "MudGolemSpawnpoint1"},
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