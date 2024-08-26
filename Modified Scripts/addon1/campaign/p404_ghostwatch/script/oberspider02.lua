
 	
State
{	
	StateName = "INIT",
		
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_ObergeistSpawned"},
		},
		Actions = 
		{
		},
		NoSpawnEffect = false,
	};
	
	
}