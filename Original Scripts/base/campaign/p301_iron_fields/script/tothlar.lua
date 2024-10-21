State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 663.499,
		Y = 180.491,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_A_08_TothLar_Spawn"},
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
			MapFlagIsTrue {Name = "mf_CS_A_08_TothLar_Vanish"},
			FigureIsAlive {Tag = "TothLar"}
		},
		Actions = 
		{
			FigureOutcry {TextTag = "TothLar2", Tag = "TothLar"},
			FigureVanish {Tag = "default"},
		},
	GotoState = "EndScript",
	};
};

State
{
	StateName = "EndScript",
};

