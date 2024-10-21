----*******************************************************
----***                                                 ***
----***             		UndeadGuard1                ***
----***                    	                            ***
----*******************************************************
--
--
--
State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 3, TargetTag = "Skeleton1"},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "Skeleton1"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
};

