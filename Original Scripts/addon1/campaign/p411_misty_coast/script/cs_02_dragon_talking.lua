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
			MapFlagIsTrue {Name = "mf_CS_02_Dragon_Talking_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 228},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	};
};