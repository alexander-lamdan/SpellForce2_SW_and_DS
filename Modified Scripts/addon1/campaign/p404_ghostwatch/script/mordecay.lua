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
			MapFlagIsTrue {Name = "mf_Mordecay_Spawn"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 45},
			CutsceneFigureWeaponsHide {Tag = "default"},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	},
};