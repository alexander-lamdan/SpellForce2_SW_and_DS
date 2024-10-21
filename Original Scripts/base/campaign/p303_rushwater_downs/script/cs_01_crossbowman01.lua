State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Crossbowman_Spawn"},
		},
		Actions = 
		{
			-- Figur schaut nach Süden
			FigureLookAtDirection {Tag = "default", Direction = 0},
			EntityTimerStart {Name = "et_Goto_Timer"},
		},
	};
	OnOneTimeEvent	-- Figur läuft los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Goto_Timer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "default", X = 117.241, Y = 143.936},
			EntityTimerStop {Name = "et_Goto_Timer"},
		},
	},
	OnOneTimeEvent	-- Figur wird gelöscht
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_01_Portal_Units_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		},
		GotoState = "ScriptEnd",
	},
};
	
State
{
	StateName = "ScriptEnd",
};