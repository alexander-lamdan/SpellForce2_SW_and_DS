--*******************************************************
--***                                                 ***
--***             		MistDragon                    ***
--***                    	                          ***
--*******************************************************



--State
--{	
--	StateName = "INIT",
--	OnFigureSpawnOnlyWhenEvent	
--	{
--		X = GetEntityX(), Y = GetEntityY(),
--		Conditions = 
--		{
--			MapFlagIsTrue {Name = "mf_AdditionalTroopSpawn1"},
--			BuildingIsAlive	{Tag = "Nordcamp01"},
--		},
--		Actions = 
--		{
--			FigureWalkToEntity	{TargetTag = "Defender07"},
--		}, 
--		DelayedActions = 
--		{
--			
--		}, 
--		NoSpawnEffect = false
--		
--	},
--	
--	OnFigureRespawnEvent	
--	{
--		WaitTime = 60,
--		X = GetEntityX(), Y = GetEntityY(),
--		Conditions =
--		{
--			BuildingIsAlive	{Tag = "Nordcamp01"},
--			OR
--			{
--				AND
--				{
--					MapFlagIsTrue {Name = "mf_AdditionalTroopSpawn1"},
--					EntityFlagIsFalse {Name = "ef_TroopALive"},
--				},
--				AND
--				{
--					MapFlagIsTrue {Name = "mf_AdditionalTroopSpawn2"},
--					EntityFlagIsTrue {Name = "ef_TroopALive"},
--				},
--			},
--		},
--		Actions = 
--		{
--			FigureWalkToEntity	{TargetTag = "Defender07"},
--			EntityFlagSetTrue {Name = "ef_TroopALive"},
--		},
--		DeathActions = 
--		{
--			
--		}, 
--		DelayedActions = 
--		{
--		}, 
--		NoSpawnEffect = false, 
--		IsSpawnOnlyWhen = false,
--	},
--	
--};
--
