
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_OgreQuestGiven"}, 
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainScript"
	},
}

State
{
	StateName = "MainScript",
   
   OnOneTimeDeadEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 430 },
			AvatarValueAdd{Name = "av_P304_OgreKilled", Value = 1},
		},
	};

	OnFigureRespawnEvent
	{
		WaitTime = 10,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_NEVERTRUE"},
		},
		-- Dieses Event ist nur ein Hack!
		-- Es muß leider drin sein, damit das DeadEvent überhaupt ausgeführt wird
	};



};
