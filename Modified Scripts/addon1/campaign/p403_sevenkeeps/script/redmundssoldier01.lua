--*******************************************************
--***                                                 ***
--***         RedmundsSoldierSammelscript             ***
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
			MapFlagIsTrue {Name = "mf_Warenaustausch"},
			--AvatarHasItemMisc	{Player = "pl_Human", ItemId = 282, Amount = 1},
			MapValueIsGreater	{Name = "mv_RedmundsSoldatenSpawn", Value = 0},
			--MapValueIsLess	{Name = "mv_RedmundsSoldatenAnzahl", Value = 20},
			
		},
		Actions = 
		{
			FigurePlayerTransfer	{Player = "pl_Human"},
			MapValueDecrease	{Name = "mv_RedmundsSoldatenSpawn"},
			MapValueAdd	{Name = "mv_RedmundsSoldatenAnzahl", Value = 1},
			--AvatarItemMiscTake	{Player = "pl_Human", ItemId = 282, Amount = 1},
			MapFlagSetFalse {Name = "mf_Warenaustausch"},
			FigureRunToEntity	{TargetTag = "pl_HumanAvatar"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
		
	OnFigureRespawnEvent	
	{
		WaitTime = 1,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Warenaustausch"},
			MapValueIsGreater	{Name = "mv_RedmundsSoldatenSpawn", Value = 0},
			--AvatarHasItemMisc	{Player = "pl_Human", ItemId = 282, Amount = 1},
			--MapValueIsLess	{Name = "mv_RedmundsSoldatenAnzahl", Value = 20},
		},
		Actions = 
		{
			FigurePlayerTransfer	{Player = "pl_Human"},
			MapValueDecrease	{Name = "mv_RedmundsSoldatenSpawn"},
			--MapValueAdd	{Name = "mv_RedmundsSoldatenAnzahl", Value = 1},
			--AvatarItemMiscTake	{Player = "pl_Human", ItemId = 282, Amount = 1},
			MapFlagSetFalse {Name = "mf_Warenaustausch"},
			FigureRunToEntity	{TargetTag = "pl_HumanAvatar"},
		},
		DeathActions = 
		{
			MapValueSubtract	{Name = "mv_RedmundsSoldatenAnzahl", Value = 1},
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
	
};

