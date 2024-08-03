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
			MapFlagIsTrue {Name = "mf_CS_05_Actors_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 130.05, Y = 520.82, },
			FigureLookAtDirection {Tag = "default", Direction = 140},
		},
	};
}
