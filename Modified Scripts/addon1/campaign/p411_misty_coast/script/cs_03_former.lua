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
			MapFlagIsTrue {Name = "mf_CS_03_Former_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 45},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	};
};