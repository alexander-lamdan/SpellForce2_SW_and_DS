

State
{
		StateName = "WolfCreepLVL15",
		OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
			AvatarHasLevel	{Player = "pl_Human", Level = 18},
		},
		Actions = 
		{
			FigureVanish	{Tag = "LVL10WolfCreep01"},
			FigureVanish	{Tag = "LVL10WolfCreep02"},
			FigureVanish	{Tag = "LVL10WolfCreep03"},
			FigureVanish	{Tag = "LVL10WolfCreep04"},
			FigureVanish	{Tag = "LVL10WolfCreep05"},
			FigureVanish	{Tag = "LVL10WolfCreep06"},
			FigureVanish	{Tag = "LVL10WolfCreep07"},
			FigureVanish	{Tag = "LVL10WolfCreep08"},
			FigureVanish	{Tag = "LVL10WolfCreep09"},
			FigureVanish	{Tag = "LVL10WolfCreep10"},
			FigureVanish	{Tag = "LVL10WolfCreep11"},
			FigureVanish	{Tag = "LVL10WolfCreep12"},
			FigureVanish	{Tag = "LVL10WolfCreep13"},
			FigureVanish	{Tag = "LVL10WolfCreep14"},
			FigureVanish	{Tag = "LVL10WolfCreep15"},
			FigureVanish	{Tag = "LVL10WolfCreep16"},
			FigureVanish	{Tag = "LVL10WolfCreep17"},
			FigureVanish	{Tag = "LVL10WolfCreep18"},
			FigureVanish	{Tag = "LVL10WolfCreep19"},
			FigureVanish	{Tag = "LVL10WolfCreep20"},
			FigureVanish	{Tag = "LVL10WolfCreep21"},
			FigureVanish	{Tag = "LVL10WolfCreep22"},
			FigureVanish	{Tag = "LVL10WolfCreep23"},
			FigureVanish	{Tag = "LVL10WolfCreep24"},
			FigureVanish	{Tag = "LVL10WolfCreep25"},
			
			FigureVanish	{Tag = "LVL03Bear01"},
			FigureVanish	{Tag = "LVL03Bear02"},
			FigureVanish	{Tag = "LVL03Bear03"},
			
		},
	},


	
};
