--*******************************************************
--***                                                 ***
--***             Skjaldir  			              ***
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
			QuestIsSolved	{Player = "pl_Human", Quest = "HeartOfIceGetRewardFromSkjadir"},
			QuestIsNotSolved {Quest = "WestguardA1_DefendCamp"},
			AvatarFlagIsFalse {Name = "af_P401_SkjadirHasDiedOnWinterlight"},	
		},
		Actions = 
		{
			FigurePlayerTransfer	{Player = "pl_Human"},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = true
		
	},
	
	

};

