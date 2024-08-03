
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_HarpyQuestGiven"}, 
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
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 424 },
			AvatarValueAdd{Name = "av_P304_HarpysKilled", Value = 1},
		},
	};
	
	OnFigureRespawnEvent
	{
		WaitTime = 0,	-- waittime 0 spart je eine condition/action
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
