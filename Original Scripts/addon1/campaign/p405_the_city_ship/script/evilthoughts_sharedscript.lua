
MindEntityX = 266.496 
MindEntityY = 380.328 

 
State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
			MapValueIsEqual{Name = "mv_ThoughtsWave", Value = MyWave},
			--MapTimerIsElapsed{Name = "mt_EvilThoughtsAppear", Seconds = MyTime},
		},
		Actions =
		{
			EntityFlagSetTrue{ Name = "ef_ISpawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{ Name = "ef_ISpawned"},
		},
		Actions =
		{
		},
		GotoState = "Spawned",
	},
}

State
{
	StateName = "Spawned",
	OnIdleGoHomeFake
	{
		X = MindEntityX,
		Y = MindEntityY,
		Range = 8,
		GotoForced = true,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityFlagSetTrue{Name = "ef_ReachedMindEntity"},
			MapValueIncrease {Name = "mv_GhostsReachedMindEntity"},
			FigureVanish{Tag = "default"},
		},
		OneTimeHomeActions = 
		{
		},
	};

	
	OnFigureDeadOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsFalse{Name = "ef_ReachedMindEntity"},
		},
		Actions = 
		{
			MapValueIncrease {Name = "mv_GhostsReachedMindEntity"},
			AvatarXPGive{Player = "pl_Human", Amount = 400},
		},
	};




	




		
}
