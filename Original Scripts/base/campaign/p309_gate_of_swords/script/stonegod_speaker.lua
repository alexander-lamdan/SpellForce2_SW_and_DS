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
			MapFlagIsTrue {Name = "mf_P309_Stonegod_Speaker_Spawn"},
		},
		Actions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Stonegod_Speaker_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},			
		},
		GotoState = "EndScript",
	},
}

State
{
	StateName = "EndScript",
}