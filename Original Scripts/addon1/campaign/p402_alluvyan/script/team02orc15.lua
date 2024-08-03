--*******************************************************
--***                                                 ***
--***             OrcSammelscriptTeam02Treants        ***
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
			FigureIsInEntityRange	{Tag = "Treant3", TargetTag = "AimTreant03", Range = 5},
		},
		Actions =
		{
			FigureAttackEntity	{TargetTag = "Treant3"},
			EntityFlagSetTrue {Name = "ef_FireAtTreant"},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 30,
		X = 427,
		Y = 407,
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc2_1"},
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

