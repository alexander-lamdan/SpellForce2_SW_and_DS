

  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P314_CS03Finished"},
		},
		Actions = 
		{
		},
	};


	
}
