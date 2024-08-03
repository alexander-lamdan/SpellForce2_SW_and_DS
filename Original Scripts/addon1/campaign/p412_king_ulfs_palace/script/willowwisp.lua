--*******************************************************
--***                                                 ***
--***             		WillowWisp                 	  ***
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
			MapFlagIsTrue {Name = "mf_OpenSargophag1"},
		},
		Actions = 
		{
			
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
};

