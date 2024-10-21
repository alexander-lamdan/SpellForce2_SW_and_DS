--*******************************************************
--***                                                 ***
--***             		UndeadGuard4                  ***
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
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 3, TargetTag = "Skeleton4"},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "Skeleton4"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
};

