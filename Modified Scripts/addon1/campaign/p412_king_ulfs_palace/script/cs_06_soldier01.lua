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
			MapFlagIsTrue {Name = "mf_CS_06_Actors_Spawn"},
		},
		Actions = 
		{
		}, 
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = GetEntityX(), Y = GetEntityY(), },
			FigureLookAtDirection {Tag = "default", Direction = 180},
			FigureSimpleRun {Tag = "default", X = 186.231, Y = 274.266, },
		}, 
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Delete_Actors_CS_06"},
		},
		Actions =
		{		
		},
	},
};