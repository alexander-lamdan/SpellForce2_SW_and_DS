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
			CutsceneFigureTeleport {Tag = "default", X = 374.38, Y = 538.88, },
			FigureLookAtDirection {Tag = "default", Direction = 160},
			
		}, 
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Delete_Actors_CS_05"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},			
		},
	},
	
};