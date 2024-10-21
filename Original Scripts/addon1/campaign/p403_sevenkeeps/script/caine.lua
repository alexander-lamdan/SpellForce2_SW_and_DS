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
			MapFlagIsTrue {Name = "mf_Caine_Spawn"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 0},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
};