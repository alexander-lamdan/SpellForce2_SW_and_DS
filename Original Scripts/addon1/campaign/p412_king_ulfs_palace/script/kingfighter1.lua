--*******************************************************
--***                                                 ***
--***             	 KingFighter1               	  ***
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
			MapFlagIsTrue {Name = "mf_FormerStatuenCast1"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "pl_HumanAvatar"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	OnFigureRespawnEvent	
	{
		WaitTime = 15,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_Geweihter1Dead"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "pl_HumanAvatar"},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	

};

