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
			MapFlagIsTrue {Name = "mf_CS_03_Dragon_Talking_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 280},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	};
};