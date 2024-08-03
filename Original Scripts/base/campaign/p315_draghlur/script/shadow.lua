
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
			MapFlagIsTrue {Name = "mf_P315_ShadowSpawn"},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 225},
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	},

}

