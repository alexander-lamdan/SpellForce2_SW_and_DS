

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
			AvatarFlagIsFalse{Name = "af_P404_MankDied"},
		},
		Actions = 
		{
		},
	};
    
    OnFollowEvent
	{
		Tag = "Mank",
		TargetTag = "Agathos",
		OnConditions = 
		{
		},
		Actions = 
		{
		},
	};


}
