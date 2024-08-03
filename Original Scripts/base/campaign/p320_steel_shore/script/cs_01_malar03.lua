State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Malar03_Spawn"},
		},
		Actions =
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Malar_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		},
		GotoState = "ScriptEnd",
	},
};

State
{
	StateName = "ScriptEnd",
};