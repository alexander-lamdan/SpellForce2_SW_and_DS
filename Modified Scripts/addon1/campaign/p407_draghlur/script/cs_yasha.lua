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
			MapFlagIsTrue {Name = "mf_CS_Yasha_Spawn"},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "default", X = 394.8, Y = 49, },
			FigureLookAtDirection {Tag = "default", Direction = 180},
			FigureKill {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "defualt"},
		},
	},
}