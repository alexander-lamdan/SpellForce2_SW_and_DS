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
			MapFlagIsTrue {Name = "mf_CS_A_08_Darkelves_Spawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 270},
		},
		DelayedActions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_A_08_Darkelves_Vanish"},
		},
		Actions = 
		{
			FigureVanish {Tag = "default"},
		},
	GotoState = "EndScript",
	};
};

State
{
	StateName = "EndScript",
};

