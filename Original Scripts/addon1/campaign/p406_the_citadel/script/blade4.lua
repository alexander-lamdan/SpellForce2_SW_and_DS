--*******************************************************
--***                                                 ***
--***             		Blade4              		  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 260.302, Y = 86.5206,  
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianDead"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Blade4Alive"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
    
};

