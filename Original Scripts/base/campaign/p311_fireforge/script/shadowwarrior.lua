State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 374.472,
		Y = 438.881,
		NoSpawnEffect = true,
		Conditions = 
		{	
			MapFlagIsTrue {Name = "mf_P311_Shadowwarrior_Spawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 0},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P311_Shadowwarrior_Vanish"},
		},
		Actions = 
		{
			FigureVanish {Tag = "default"},
		},
		GotoState = "ScriptEnd",
	};
};

State
{
	StateName = "ScriptEnd",
};

