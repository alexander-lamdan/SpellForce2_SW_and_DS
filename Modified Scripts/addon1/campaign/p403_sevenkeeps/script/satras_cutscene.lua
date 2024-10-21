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
			MapFlagIsTrue {Name = "mf_Satras_Spawn"},
		},
		DelayedActions =
		{
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},
};