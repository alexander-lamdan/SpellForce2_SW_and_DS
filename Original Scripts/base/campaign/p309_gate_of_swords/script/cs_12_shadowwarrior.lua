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
			MapFlagIsTrue {Name = "mf_CS_12_ShadowWarrior_Spawn"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 275},
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
};