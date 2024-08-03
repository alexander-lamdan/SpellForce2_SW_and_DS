State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_Dying_Mordecay_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 584.32, Y = 539.94, },
			FigureLookAtDirection {Tag = "default", Direction = 255},
			CutsceneFigureWeaponsHide {Tag = "default"},
			FigureKill {Tag = "default"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_Dying_Mordecay_Vanish"},
		},
		Actions = 
		{
			FigureVanish {Tag = "default"},
			FigureVanish {Tag = "CS_03_DYING_MORDECAY_DEAD"},
		},
		GotoState = "End",
	};
};

State
{
	StateName = "End",
};