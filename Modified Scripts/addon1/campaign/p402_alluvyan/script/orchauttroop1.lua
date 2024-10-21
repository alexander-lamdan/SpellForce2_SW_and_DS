--*******************************************************
--***                                                 ***
--***             OrchautTroop			              ***
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
			MapFlagIsTrue {Name = "mf_HaldorOffer"},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "Pat01"},
			MapFlagSetTrue {Name = "mf_OrcSkin3Alive"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
	
	

};

