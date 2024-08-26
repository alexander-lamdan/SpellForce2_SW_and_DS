--*******************************************************
--***                                                 ***
--***             		Blade2              		  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
    OnFigureSpawnOnlyWhenEvent	
	{
		X = 247.532, Y = 84.9801, 
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianDead"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Blade2Alive"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
    
};

