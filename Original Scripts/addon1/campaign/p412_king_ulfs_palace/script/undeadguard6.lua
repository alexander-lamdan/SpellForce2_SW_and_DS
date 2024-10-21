--*******************************************************
--***                                                 ***
--***             		UndeadGuard6                  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 3, TargetTag = "Skeleton6"},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "Skeleton6"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
};

