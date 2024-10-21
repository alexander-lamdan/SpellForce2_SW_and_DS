

State
{
		StateName = "SpiderCreepLVL20",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
			AvatarHasLevel	{Player = "pl_Human", Level = 23},
		},
		Actions = 
		{
			FigureVanish	{Tag = "LVL3Spider01"},
			FigureVanish	{Tag = "LVL3Spider02"},
			FigureVanish	{Tag = "LVL3Spider03"},
			FigureVanish	{Tag = "LVL3Spider04"},
			FigureVanish	{Tag = "LVL3Spider05"},
			FigureVanish	{Tag = "LVL3Spider06"},
		},
	},


	
};
