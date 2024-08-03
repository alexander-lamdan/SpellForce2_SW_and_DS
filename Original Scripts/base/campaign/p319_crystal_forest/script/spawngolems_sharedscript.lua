

State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P319_CS03Finished"},
			GameInterfaceIsVisible{},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	};


}

