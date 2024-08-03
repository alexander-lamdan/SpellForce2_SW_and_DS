--*******************************************************
--***                                                 ***
--***               Citadel Part1					  ***
--***			    1CrystalGolemPat1	              ***
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
				Goto = FigurePatrolWalkToEntity {TargetTag = "1CrystalPoint1"},
				Tags = 
				{
					"1CrystalPoint2",
					"1CrystalPoint3",
					"1CrystalPoint4",
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
			BuildingIsAlive	{Tag = "CrystalGolemSpawnpoint1"},
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