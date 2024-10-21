
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
			MapFlagIsTrue {Name = "mf_P319_ShadowWarriorSpawn"},
		},
		Actions = 
		{
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
	
}

