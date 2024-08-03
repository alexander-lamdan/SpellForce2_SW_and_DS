--*******************************************************
--***                                                 ***
--***             		Blade3              		  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 253.434, Y = 84.1809, 
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianDead"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Blade3Alive"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
    
};

