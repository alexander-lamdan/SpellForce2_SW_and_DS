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
			MapFlagIsTrue {Name = "mf_CS_04_Actors_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 457.8, Y = 635.6, },
			FigureLookAtDirection {Tag = "default", Direction = 135},
		},
	};
}
