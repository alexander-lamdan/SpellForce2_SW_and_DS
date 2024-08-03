--*******************************************************
--***                                                 ***
--***             	 KingFighter14               	  ***
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
			MapFlagIsTrue {Name = "mf_FormerStatuenCast14"},
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
			MapFlagIsFalse {Name = "mf_Geweihter4Dead"},
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

