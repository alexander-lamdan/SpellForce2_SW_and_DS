
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
			MapFlagIsTrue {Name = "mf_P315_CS_ShadowSpawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 270},
		},
	},
	
}

