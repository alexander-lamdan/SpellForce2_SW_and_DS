
State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_BlessedAttack"},
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
			EntityTimerStart{Name = "et_Spawned"},
			EntityFlagRandomize	{Name = "ef_AttackPointA"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};

	OnIdleGoHomeFake
	{
		X = 336.417, Y = 496.101,
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Spawned", Seconds = 20},
			EntityFlagIsTrue{Name = "ef_AttackPointA"},
		},
		Actions = 
		{
		},
	};
	
	OnIdleGoHomeFake
	{
		X = 418.444, Y = 412.575,
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Spawned", Seconds = 20},
			EntityFlagIsFalse{Name = "ef_AttackPointA"},
		},
		Actions = 
		{
		},
	};
	
}
