----*******************************************************
----***                                                 ***
----***             		UndeadGuard5                  ***
----***                    	                          ***
----*******************************************************
--
--
--
--State
--{	
--	StateName = "INIT",
--	OnFigureSpawnOnlyWhenEvent	
--	{
--		X = GetEntityX(), Y = GetEntityY(),
--		Conditions = 
--		{
--			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 3, TargetTag = "Skeleton5"},
--		},
--		Actions = 
--		{
--			ObjectVanish	{Tag = "Skeleton5"},
--		}, 
--		DelayedActions = 
--		{
--			
--		}, 
--		NoSpawnEffect = false
--		
--	},
--	
--};
--
