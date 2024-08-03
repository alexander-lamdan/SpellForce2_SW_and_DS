--*******************************************************
--***                                                 ***
--***             OrcSammelscriptTeam01Treants        ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnEvent
	{
    	
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_FireAtTreant"},
			FigureIsInRange	{X = GetEntityX(),Y = GetEntityY(), Range = 5},
			FigureIsInEntityRange	{Tag = "Treant1", TargetTag = "AimTreant01", Range = 5},
		},
		Actions =
		{
			FigureAttackEntity	{TargetTag = "Treant1"},
			EntityFlagSetTrue {Name = "ef_FireAtTreant"},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = 319,
		Y = 406,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc1_1"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name = "ef_FireAtTreant"},
			FigureRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
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

