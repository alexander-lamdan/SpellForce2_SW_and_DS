State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 663.499,
		Y = 180.491,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_A_08_Sorvina_Spawn"},
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
			MapFlagIsTrue {Name = "mf_CS_A_08_Sorvina_Vanish"},
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

