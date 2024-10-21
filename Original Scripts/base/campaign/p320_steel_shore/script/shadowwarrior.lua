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
			MapFlagIsTrue {Name = "mf_P320_CS_01_ShadowWarrior_Spawn"},
		},
		Actions =
		{
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_CS_01_ShadowWarrior_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 175,
		Y = 645.4,
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P320_CS_02_ShadowWarrior_Spawn"},
		},
		DelayedActions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 60},
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	};
};