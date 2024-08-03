--*******************************************************
--***                                                 ***
--***             		UndeadGuard1                  ***
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
			MapFlagIsTrue {Name = "mf_SpawnIllusion_Caine"},
		},
		Actions = 
		{
			
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false,
		
	},
	
};

