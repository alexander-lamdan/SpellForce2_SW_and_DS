--*******************************************************
--***                                                 ***
--***             	ShamanEndfight01	              ***
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
			MapFlagIsTrue {Name = "mf_P402_EndcutszeneCS"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_Shaman1Alive"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
	
};

