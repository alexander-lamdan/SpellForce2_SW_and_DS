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
			CutsceneFigureTeleport {Tag = "default", X = GetEntityX(), Y = GetEntityY(), },
			FigureLookAtDirection {Tag = "default", Direction = 135},
			
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