

State
{
	StateName = "MainState",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_AgathosSpawned"},
			AvatarFlagIsFalse{Name = "af_P404_MunkDied"},
		},
		Actions = 
		{
		},
	};
    
    OnFollowEvent
	{
		Tag = "Munk",
		TargetTag = "Agathos",
		OnConditions = 
		{
		},
		Actions = 
		{
		},
	};


}
