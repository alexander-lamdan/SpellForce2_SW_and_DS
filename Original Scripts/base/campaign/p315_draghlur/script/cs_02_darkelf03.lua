
State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P315_CS_DarkElfSpawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 135},
			FigureSimpleWalk {Tag = "default", X = 417.2, Y = 646.8},
		},
	},
	
}

